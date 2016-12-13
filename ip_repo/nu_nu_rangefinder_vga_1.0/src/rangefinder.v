`timescale 1ns / 1ps

module rangefinder(
    input clk,
    input reset,
    input button,
    input [8:0] device_x,
    input [8:0] device_y,
    output reg [7:0] leds,
    input [15:0] data,
    input enable,
    input [10:0] step,
    output reg [18:0] vga_waddr,
    output reg transmit,
    output reg [5:0] count,
    output reg [7:0] dina,
    output reg wea,
    
    output reg [7:0] addra1,
    input [12:0] coord1_data,
    
    output reg [7:0] addra2,
    input [12:0] coord2_data
    );
    
    reg [15:0] watchdog;
    reg [15:0] decoded;
    reg [11:0] location;
    reg [24:0] xmult, ymult;
    wire xneg, yneg;
    reg was_enabled;
    reg [5:0] write_count;
    
    reg [9:0] xlocation;
    reg [8:0] ylocation;
    
    reg [18:0] reset_count;
    reg reset_count_en;
    
    reg [2:0] s2_counter;
    reg [1:0] s4_counter;
    
    wire [18:0] vga_product;
    
    wire [24:0] product1, product2;
    
    parameter [2:0] s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6;
    reg [2:0] current_state, next_state;
    
    reg [10:0] row_count; // 0-480
    reg [10:0] col_count; // 0-640
//-----------------------------------------------------------
//data processing
    //sets flag to indicate negative horizontal value on circle                 
    assign xneg = (step >= 0 && step <= 128)  ? 1'b0 :
                  (step > 128 && step <= 384) ? 1'b0 :
                  (step > 384 && step <= 640) ? 1'b1 : 1'b1;

    //sets flag to indicate negative vertical value on circle                 
    assign yneg = (step >= 0 && step <= 128)  ? 1'b1 :
                  (step > 128 && step <= 384) ? 1'b0 :
                  (step > 384 && step <= 640) ? 1'b0 : 1'b1;
    
    // State machine overhead control
    always @ (posedge clk)
        if (reset)
            current_state <= s0;
        else
            current_state <= next_state;
    
    //next state logic
    always @ (current_state, s2_counter, s4_counter, enable, row_count, col_count, button)
    begin
        case (current_state)
            // stays in s0 until a new enable pulse
            s0:
                if(enable)
                    next_state = s2;
                else if (button)
                    next_state = s1;
                else
                    next_state = s0;
            
            s1: // clear pixel data from previous run
                if(row_count == 479 && col_count == 639)
                    next_state = s0;
                else
                    next_state = s1;
            // stays in s1 for one clock cycle
            s2:
                next_state = s3;
                    
            // stays in s2 for a multiply operation
            s3:
                if(s2_counter == 4)
                    next_state = s4;
                else
                    next_state = s3;
            
            // stays in s3 for one clock cycle
            s4:
                next_state = s5;
                
            // stays in s4 for a multiply operation
            s5:
                if(s4_counter == 3)
                    next_state = s6;
                else
                    next_state = s5;
                    
            // stays in s5 for one clock cycle
            s6:
                next_state = s0;

            default:
                next_state = s0;
        endcase
    end
    
    //state machine
    always @ (posedge clk)
    begin
        //resets registers, waits for data to process
        if(current_state == s0)
        begin
            wea <= 1'b0;
            dina <= 8'h00;
            row_count <= 11'd0;
            col_count <= 11'd0;
        end
        
        // clear previous set of data from BRAM
        else if(current_state == s1)
        begin
            vga_waddr <= (640*row_count) + col_count;
            wea <= 1'b1;
            dina <= 8'h00;
            if(col_count < 639)
                col_count <= col_count + 1'b1;
            else if(col_count == 639 && row_count < 479)
                begin
                col_count <= 11'd0;
                row_count <= row_count + 1'b1;
                end

        end
        //calculates adresses for trig LUTs
        //decodes data by substracting 0x30 from both halves of data point
        else if(current_state == s2)
        begin
            wea <= 1'b0;

            addra1 <= (step >= 0 && step <= 128)  ? 128-step :  //index 128 to 0  - Q1 - hz
                      (step > 128 && step <= 256) ? step-128 :  //index 1 to 128  - Q2 - hz
                      (step > 256 && step <= 384) ? 384-step :  //index 127 to 0  - Q2 - vr
                      (step > 384 && step <= 512) ? step-384 :  //index 0 to 128  - Q3 - vr
                      (step > 512 && step <= 640) ? 640-step :  //index 127 to 0  - Q3 - hz
                                                    step-640;   //index 0 to 128  - Q4 - hz      
    
            addra2 <= (step >= 0 && step <= 128)  ? step :      //index 128 to 256 - Q1 - vr
                      (step > 128 && step <= 256) ? 256-step :  //index 255 to 128 - Q2 - vr
                      (step > 256 && step <= 384) ? step-256 :  //index 129 to 256 - Q2 - hz
                      (step > 384 && step <= 512) ? 512-step :  //index 255 to 128 - Q3 - hz
                      (step > 512 && step <= 640) ? step-512 :  //index 129 to 256 - Q3 - vr
                                                    768-step;   //index 255 to 128 - Q4 - vr
                                                    
            
            decoded <= {data[7:0]-8'h30, data[15:8]-8'h30};
        end
        
        //drops upper bit of each data point
        //calculates horizontal and vertical distance for each data point
        else if(current_state == s3)
        begin
            if(s2_counter == 4)
            begin
                if(step > 256 && step <= 512)
                begin
                    xmult <= product2;
                    ymult <= product1;
                end
                
                else
                begin
                    xmult <= product1;
                    ymult <= product2;
                end
            end
            
            s2_counter <= s2_counter + 1'b1;
        end
        
        //scales data and localizes to device
        else if(current_state == s4)
        begin
            s2_counter <= 3'b0;
            
            if(xneg)
                xlocation <= device_x - xmult[23:16];
            else
                xlocation <= device_x + xmult[23:16];
            
            if(yneg)
                ylocation <= device_y + ymult[23:16];
            else
                ylocation <= device_y - ymult[23:16];
        end
        
        //calculates address for VGA BRAM
        else if(current_state == s5)
        begin
            if(s4_counter == 3)
                vga_waddr <= vga_product + xlocation;
            
            s4_counter <= s4_counter + 1'b1;
        end
        
        //writes to BRAM
        else if(current_state == s6)
        begin
            s4_counter <= 2'b00;
            dina <= 8'hFF;
            wea <= 1'b1;
        end
    end
    
    mult_gen_0 trig_mult_1
    (
        .CLK(clk),
        .A({decoded[13:8], decoded[5:0]}),
        .B(coord1_data),
        .P(product1)
    );
    
    mult_gen_0 trig_mult_2
    (
        .CLK(clk),
        .A({decoded[13:8], decoded[5:0]}),
        .B(coord2_data),
        .P(product2)
    );
    
    mult_gen_2 vga_multiplier
    (
        .CLK(clk),
        .A(ylocation),
        .P(vga_product)
    );
    
    //next data transfer logic
    
    //watchdog counter watches for missed data transfers
    always @(posedge clk, posedge reset)
    begin
        if(reset || transmit)
            watchdog <= 0;
        else
            watchdog <= watchdog + 1'b1;
    end    
    
    //sets flag to initialize another rangefinder data sequence   
//    always @ (posedge clk, posedge reset)
//    begin
//        if(reset)
//            transmit <= 1'b1;
//        else if(watchdog <= 38400)
//            transmit <= 1'b1;
//        else
//            transmit <= 1'b0;
//    end
    
    always @ (posedge clk)
    begin
        if(row_count == 479 && col_count == 639)
            transmit <= 1'b1;
        else
            transmit <= 1'b0;
    end
        
endmodule