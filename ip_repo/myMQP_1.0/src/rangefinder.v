`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2016 11:36:44 AM
// Design Name: 
// Module Name: rangefinder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module rangefinder(
    input clk,
    input reset,
    input [15:0] data,
    input enable,
    input [10:0] step,
    output reg [7:0] xlocation,
    output reg [7:0] ylocation,
    output reg write,
    output reg [27:0] transmit
    );
   
   // figure out how to deal with data points that were out of range for rangefinder!!!
   // probably just append another test to the if statements - outer if(data!=outofrange)
    
    reg [5:0] count;

    reg [15:0] decoded;
    reg [11:0] location;
    reg [24:0] xmult, ymult;
    wire xneg, yneg; 
    
    reg [7:0] addra1, addra2;
    
    blk_mem_gen_0 coord1_mem
    (
        .addra(addra1),
        .clka(clk),
        .douta(coord1_data)
    );
    
    blk_mem_gen_1 coord2_mem
    (
        .addra(addra2),
        .clka(clk),
        .douta(coord2_data)
    );
                        
    //sets flag to indicate negative horizontal value on circle                 
    assign xneg = (step >= 0 && step <= 128)  ? 1'b0 :
                  (step > 128 && step <= 384) ? 1'b0 :
                  (step > 384 && step <= 640) ? 1'b1 : 1'b1;

    //sets flag to indicate negative vertical value on circle                 
    assign yneg = (step >= 0 && step <= 128)  ? 1'b1 :
                  (step > 128 && step <= 384) ? 1'b0 :
                  (step > 384 && step <= 640) ? 1'b0 : 1'b1;
    
    //clock edge counter to run data processing
    always @ (posedge clk, posedge reset)
    begin
        if(reset || enable)
            count <= 0;
        else
            count <= count + 1'b1;
    end
    
    //calculating address of LUTs
    always @ (posedge clk)
    begin
        if(enable && (count == 10'b0000000001))
        begin
            addra1 <= (step >= 0 && step <= 128)  ? 128-step :  //index 128 to 0  - Q1 - hz
                      (step > 128 && step <= 256) ? step-128 :  //index 1 to 128  - Q2 - hz
                      (step > 256 && step <= 384) ? 384-step :  //index 127 to 0  - Q2 - vr
                      (step > 384 && step <= 512) ? step-384 :  //index 0 to 128  - Q3 - vr
                      (step > 512 && step <= 640) ? 640-step :  //index 127 to 0  - Q3 - hz
                                                    step-640;   // index 0 to 128 - Q4 - hz        
        
            addra2 <= (step >= 0 && step <= 128)  ? step :      //index 128 to 256 - Q1 - vr
                      (step > 128 && step <= 256) ? 256-step :  //index 255 to 128 - Q2 - vr
                      (step > 256 && step <= 384) ? step-256 :  //index 129 to 256 - Q2 - hz
                      (step > 384 && step <= 512) ? 512-step :  //index 255 to 128 - Q3 - hz
                      (step > 512 && step <= 640) ? step-512 :  //index 129 to 256 - Q3 - vr
                                                    768-step;   //index 255 to 128 - Q4 - vr
        end
    end
    
    //data processing block
    always @ (posedge clk)
    begin
        if(enable && (count == 10'b0000000001))
        begin
            //30 hex is subtracted from each data byte
            decoded <= {data[15:8]-8'h30, data[7:0]-8'h30};
        end
    end
    
    always @ (posedge clk)
    begin
        if(count == 3)
        begin
            //the upper two bits of each data byte are dropped
            location <= {decoded[13:8], decoded[5:0]};
        end
    end
    
    //calculate horizontal and vertical position of each data point on a map
    always @ (posedge clk)
    begin
        if(count == 5)
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
    
    always @ (posedge clk)
    begin
        if(count == 25)
        begin
            if(xneg)
            begin
                xlocation <= xmult[24:17] - 320;
            end
            else
            begin
                xlocation <= xmult[24:17] + 320;
            end
            
            if(yneg)
            begin
                ylocation <= ymult[24:17] + 300;
            end
            else
            begin
                ylocation <= ymult[24:17] - 300;
            end
        end
    end

    //sets flag to top module signifying append to list       
    always @ (posedge clk)
    begin 
        if(count >= 30 && count <= 35)
        begin
            write <= 1'b1;   //sets flag
        end
        else
        begin
            write <= 1'b0;
        end
    end
    
    //sets flag to initialize another rangefinder data sequence   
    always @ (posedge clk)
    begin    
        if((count >= 50) && (step >= 768))
        begin
            transmit <= 1'b1;
        end
        else
        begin
            transmit <= 1'b0;
        end
    end
    
endmodule
