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
    output [18:0] vga_waddr,
    output reg write,
    output reg transmit,
    output reg [5:0] count,
    output reg [7:0] dina,
    output reg wea,
    
    output reg [7:0] addra1,
    input [12:0] coord1_data,
    
    output reg [7:0] addra2,
    input [12:0] coord2_data
    );
   
   // figure out how to deal with data points that were out of range for rangefinder!!!
   // probably just append another test to the if statements - outer if(data!=outofrange)
    
    reg [15:0] watchdog;
    reg [15:0] decoded;
    reg [11:0] location;
    reg [23:0] xmult, ymult;
    wire xneg, yneg;
    reg was_enabled;
    reg [5:0] write_count;
    
    reg [8:0] xlocation;
    reg [8:0] ylocation;
    
    reg [18:0] reset_count;
    reg reset_count_en;
    
//-----------------------------------------------------------
//resetting the vga BRAM
//    always @ (posedge clk, posedge reset)
//    begin
//        if(reset)
//            reset_count_en <= 1'b1;
//        else if(reset_count == 307200)
//            reset_count_en <= 1'b0;
//    end
    
//    always @ (posedge clk)
//    begin
//        if(reset_count_en)
//            reset_count <= reset_count + 1'b1;
//        else
//            reset_count <= 19'b0;
//    end
//-----------------------------------------------------------
    
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
    
    //enables data processing
    always @ (posedge clk, posedge reset)
    begin
      if(reset)
          was_enabled <= 1'b0;
      else if(enable)
          was_enabled <= 1'b1;
      else if(count > 50)
          was_enabled <= 1'b0;
    end
    
    //clock edge counter to run data processing
    always @ (posedge clk, posedge reset)
    begin
        if(reset)
            count <= 0;
        else if(was_enabled)
            count <= count + 1'b1;
        else
            count <= 0;
    end
    
    //calculating address of LUTs
    always @ (posedge clk)
    begin
        if(count == 10'b0000000001)
        begin
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
        end
    end
        
    //decodes data
    always @ (posedge clk)
    begin
        if(count == 6'b000001)
            decoded <= {data[7:0]-8'h30, data[15:8]-8'h30};
    end
    
    //the upper two bits of each data byte are dropped
    always @ (posedge clk)
    begin
        if(count == 3)
            location <= {decoded[13:8], decoded[5:0]};
    end
    
    //calculate horizontal and vertical position of each data point
    always @ (posedge clk)
    begin
        if(count == 7)
        begin
            if(step > 256 && step <= 512)
            begin
                xmult <= location * coord2_data;
                ymult <= location * coord1_data;
            end
            else
            begin
                xmult <= location * coord1_data;
                ymult <= location * coord2_data;
            end
        end
    end
    
    //scales data and localizes to device location on screen
    always @ (posedge clk)
    begin
        if(count == 25)
        begin
            if(xneg)
                xlocation <= device_x - xmult[23:16];
            else
                xlocation <= device_x + xmult[23:16];
            
            if(yneg)
                ylocation <= device_y + ymult[23:16];
            else
                ylocation <= device_y - ymult[23:16];
        end
    end

    //sets flag to signify data is ready to be added to VGA BRAM
    always @ (posedge clk)
    begin
        if(count == 30)
            write <= 1'b1;
        else
            write <= 1'b0;
    end
//-----------------------------------------------------------

//-----------------------------------------------------------            
//logic to write location to VGA BRAM
    
    assign vga_waddr = /*reset_count_en ? reset_count : */(640*ylocation) + xlocation;
    
    always @ (posedge clk)
    begin
        if(write)
        begin
            write_count <= write_count + 1'b1;
            wea <= 1'b1;
        end
        else
        begin
            write_count <= 1'b0;
            wea <= 1'b0;
        end
    end
    
    always @ (posedge clk)
    begin
        if(write_count == 5)
        begin
            dina <= 8'hFF;
        end
    end
    
    // delays vga logic by two 100M clock cycles
    // for the BRAM read delay    
//    always @ (posedge clk_100M)
//    begin
//        if(reset || blank)
//            vga_count <= 2'b00;
//        else if(!blank && vga_count < 2)
//            vga_count <= vga_count + 1'b1;
//    end    
    
    
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
        if(button)
            transmit <= 1'b1;
        else
            transmit <= 1'b0;
    end
        
endmodule
