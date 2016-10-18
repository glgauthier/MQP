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
    input [10:0] step
    );
    
    reg [12:0] HZ [256:0];
    reg [15:0] databuf;
    reg [9:0] count;
        
    reg [15:0] decoded;
    reg [11:0] location;
    
    wire [12:0] horizontal, vertical;
    
    //figure out how to deal with negative values
    reg [10:0] xlocation, ylocation;
    
    //fills LUT with sin values
    initial begin
        HZ[0]=4096;
        HZ[256]=0;
    end        
    
    //figure out how to deal with negative values
    //horizontal scale factor for circle data
    assign horizontal = (step >= 0 && step <= 128) ? HZ[128-step] :
                        (step > 128 && step <= 384) ? HZ[step-128] :
                        (step > 384 && step <= 640) ? 0 - HZ[640-step] : 0 - HZ[step-640];
    
    //vertical scale factor for circle data                    
    assign vertical = (step >= 0 && step <= 128) ? 0 - HZ[step+128] :
                      (step > 128 && step <= 384) ? HZ[384-step] :
                      (step > 384 && step <= 640) ? HZ[step-384] : 0 - HZ[896-step];
    
    //clock edge counter to run data processing
    always @ (posedge clk, posedge reset)
    begin
        if(reset || enable)
            count <= 0;
        else
            count <= count + 1'b1;
    end
    
    //reading data into buffer
    always @ (posedge clk, posedge reset)
    begin
        if(enable)
        begin
            databuf[15:0] <= data[15:0];
        end
    end
    
    //data processing block
    always @ (posedge clk, posedge reset)
    begin
        if(count == 10'h001)
        begin
            decoded <= {databuf[15:8]-8'h30, databuf[7:0]-8'h30}; 
        end
        else if(count == 10'h003)
        begin
            location <= {decoded[13:8], decoded[5:0]};
        end
        else if(count == 10'h004)
        begin
            xlocation <= (location * horizontal) >> 13;
            ylocation <= (location * vertical) >> 13;
        end
    end
    
endmodule
