`timescale 1ns / 1ps
// Rangefinder controller module
// Communicates with PS via AXI, BRAM lookup tables, GPIO, and VGA display controller
// Used to convert rangefinder data processed by the PS into a format that can be
// output for display and storage
module rangefinder(
    input clk, // 100MHz input clock
    input reset, // synchronous reset
    input button, // trigger new data capture (no longer used)
    input [8:0] device_x, // device x offset for display
    input [8:0] device_y, // device y offset for display
    output [7:0] leds, // LED indicators for debug
    input [15:0] data, // rangefinder data in (from PS/PL AXI)
    input enable, // PL data processing enable (from PS/PL AXI)
    input [10:0] step, // current step offset (0-768) from PS/PL AXI
    output reg [18:0] vga_waddr, // write address to VGA logic
    output reg transmit, // enable new data capture (to PS via AXI)
    output reg [7:0] dina, // VGA output buffer pixel data
    output reg wea, // VGA output buffer write enable
    
    output reg [7:0] addra1, // 0-45 degree ROM lookup table address
    input [12:0] coord1_data, // 0-45 degree ROM lookup table data
    
    output reg [7:0] addra2, // 45-90 degree ROM lookup table address
    input [12:0] coord2_data // 45-90 degree ROM lookup table address
    );
    
    reg [15:0] watchdog; // timeout to begin new data capture sequence
    reg [15:0] decoded; // stores 2 bytes of rangefinder data as (MSB -> LSB)-0x30 
    reg [24:0] xmult, ymult; // rangefinder data point x,y location relative to (0,0)
    wire xneg, yneg; // flag for indicating if x,y data is positive or negative
    reg [9:0] xlocation; // rangefinder data point x location relative to device_x
    reg [8:0] ylocation; // rangefinder data point y location relative to device_y
    
    reg [2:0] offset_counter; // counter to wait for multiply operation in OFFSET state
    reg [1:0] address_counter; // counter to wait for multiply operation in ADDRESS state
    
    wire [18:0] vga_product; // current pixel row for output address
    
    wire [24:0] product1, product2; // x/y offset output from trig lookup / multiplier conversion
    
    // FSM states, next state logic
    parameter [2:0] IDLE = 0, CLEAR = 1, DECODE = 2, OFFSET = 3, SCALE = 4, ADDRESS = 5, WRITE = 6;
    reg [2:0] current_state, next_state;
    
    reg [10:0] row_count; // 0-480
    reg [10:0] col_count; // 0-640
    reg [8:0] step_count = 9'd0;
//-----------------------------------------------------------
//data processing
    //sets flag to indicate negative horizontal value on circle                 
    assign xneg = (step >= 0 && step <= 128)  ? 1'b0 :
                  (step > 128 && step <= 384) ? 1'b0 :
                  (step > 384 && step <= 640) ? 1'b1 : //1'b1;
                  (step > 640 && step <= 768) ? 1'b1 :
                  (step > 768 && step <= 896) ? 1'b1 : 1'b0;
                  
    //sets flag to indicate negative vertical value on circle                 
    assign yneg = (step >= 0 && step <= 128)  ? 1'b1 :
                  (step > 128 && step <= 384) ? 1'b0 :
                  (step > 384 && step <= 640) ? 1'b0 : //1'b1;
                  (step > 640 && step <= 768) ? 1'b1 :
                  (step > 768 && step <= 896) ? 1'b1 : 1'b1;
    
    // State machine overhead control
    always @ (posedge clk)
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    
    //next state logic
    always @ (current_state, offset_counter, address_counter, enable, row_count, col_count, button, step)
    begin
        case (current_state)
            // stays in IDLE until a new enable pulse
            IDLE:
                if(enable)
                    next_state = DECODE;
                else if (button) // was (button || step == 768)
                    next_state = CLEAR;
                else
                    next_state = IDLE;
            
            CLEAR: // clear pixel data from previous run
                if(row_count == 479 && col_count == 639)
                    next_state = IDLE;
                else
                    next_state = CLEAR;
            // stays in DECODE for one clock cycle
            DECODE:
                next_state = OFFSET;
                    
            // stays in OFFSET for a multiply operation
            OFFSET:
                if(offset_counter == 4)
                    next_state = SCALE;
                else
                    next_state = OFFSET;
            
            // stays in SCALE for one clock cycle
            SCALE:
                next_state = ADDRESS;
                
            // stays in ADDRESS for a multiply operation
            ADDRESS:
                if(address_counter == 3)
                    next_state = WRITE;
                else
                    next_state = ADDRESS;
                    
            // stays in ADDRESS for one clock cycle
            WRITE:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end
    
    //state machine
    always @ (posedge clk)
    begin
        //resets registers, waits for data to process
        if(current_state == IDLE)
        begin
            wea <= 1'b0;
            dina <= 8'h00;
            row_count <= 11'd0;
            col_count <= 11'd0;
            if(step_count == 9'd767)
                step_count <= 9'd0;
        end
        
        // clear previous set of data from BRAM
        else if(current_state == CLEAR)
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
        else if(current_state == DECODE)
        begin
            step_count <= step_count + 1'b1;
            
            wea <= 1'b0;

            addra1 <= (step >= 0 && step <= 128)  ? 128-step :  //index 128 to 0  - Q1 - hz
                      (step > 128 && step <= 256) ? step-128 :  //index 1 to 128  - Q2 - hz
                      (step > 256 && step <= 384) ? 384-step :  //index 127 to 0  - Q2 - vr
                      (step > 384 && step <= 512) ? step-384 :  //index 1 to 128  - Q3 - vr
                      (step > 512 && step <= 640) ? 640-step :  //index 127 to 0  - Q3 - hz
                      (step > 640 && step <= 768) ? step-640 :  //index 1 to 128  - Q4 - hz
                      (step > 768 && step <= 896) ? 896-step :  //index 127 to 0  - Q4 - vr
                      //(step > 896 && step <= 1023) ? step - 896 :
                                                    step-896;   //index 0 to 128  - Q1 - vr
    
            addra2 <= (step >= 0 && step <= 128)  ? step :      //index 128 to 256 - Q1 - vr
                      (step > 128 && step <= 256) ? 256-step :  //index 255 to 128 - Q2 - vr
                      (step > 256 && step <= 384) ? step-256 :  //index 129 to 256 - Q2 - hz
                      (step > 384 && step <= 512) ? 512-step :  //index 255 to 128 - Q3 - hz
                      (step > 512 && step <= 640) ? step-512 :  //index 129 to 256 - Q3 - vr
                      (step > 640 && step <= 768) ? 768-step :
                      (step > 768 && step <= 896) ? step-768 :
                      //(step > 896 && step <= 1023) ? 1023 - step :
                                                    1023-step;   //index 255 to 128 - Q4 - vr
                                                    
            
            decoded <= {data[7:0]-8'h30, data[15:8]-8'h30};
        end
        
        //drops upper bit of each data point
        //calculates horizontal and vertical distance for each data point
        else if(current_state == OFFSET)
        begin
            if(offset_counter == 4)
            begin
                if((step > 256 && step <= 512) || (step > 768 && step <= 1023))
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
            
            offset_counter <= offset_counter + 1'b1;
        end
        
        //scales data and localizes to device
        else if(current_state == SCALE)
        begin
            offset_counter <= 3'b0;
            
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
        else if(current_state == ADDRESS)
        begin
            if(address_counter == 3)
                vga_waddr <= vga_product + xlocation;
            
            address_counter <= address_counter + 1'b1;
        end
        
        //writes to BRAM
        else if(current_state == WRITE)
        begin
            address_counter <= 2'b00;
            dina <= 8'hFF;
            wea <= 1'b1;
        end
    end
    
    // convert data point, trig lookup to x or y offset
    mult_gen_0 trig_mult_1
    (
        .CLK(clk),
        .A({decoded[13:8], decoded[5:0]}),
        .B(coord1_data),
        .P(product1)
    );
    // convert data point, trig lookup to x or y offset
    mult_gen_0 trig_mult_2
    (
        .CLK(clk),
        .A({decoded[13:8], decoded[5:0]}),
        .B(coord2_data),
        .P(product2)
    );
    
    // calculates 640*row_count portion of VGA write address
    mult_gen_2 vga_multiplier
    (
        .CLK(clk),
        .A(ylocation),
        .P(vga_product)
    );
    
    //watchdog counter watches for missed data transfers
    always @(posedge clk, posedge reset)
    begin
        if(reset || transmit)
            watchdog <= 0;
        else if (current_state == IDLE)
            watchdog <= watchdog + 1'b1;
        else
            watchdog <= watchdog;
    end    
    
    // trigger a new rangefinder data aquisition sequence when the entire screen has been cleared
    always @ (posedge clk)
    begin
        if((row_count == 479 && col_count == 639) || step_count == 9'd767)
            transmit <= 1'b1;
        else
            transmit <= 1'b0;
    end
    
    // write current_state, next_state, and I/O to LEDs for debug
    assign leds[7:0] = {next_state[2:0],current_state[2:0],enable,button};
        
endmodule