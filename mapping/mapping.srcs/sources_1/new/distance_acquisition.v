`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2016 01:20:27 PM
// Design Name: 
// Module Name: distance_acquisition
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
module distance_acquisition(
    input clk,
    input clk_96M,
    input reset,
    input drx,
    output dtx,
    output reg [5:0] db_count,    // data block count - used to coordinate with angles
    output reg [519:0] rfData    // one block of rangefinder data
);

reg [19:0] count;    // counts clock cycles for tx/rx purposes
reg [119:0] echo;     // first 120 bits received echo the command transmitted and LF LF
reg valid;    // 1'b1 if echo matches command
reg [9:0] lf;    // last 10 bits received are line feed

reg [12:0] writeCount;    // timing variable used to read rfData from temp

reg [519:0] temp_rfData; // temporary data block to be written

wire [49:0] tx_1;
wire [49:0] tx_2;
    
assign tx_1 = 50'b0111000101_0000011001_0000011001_0000011001_0111011001;
assign tx_2 = 50'b0011011001_0000111001_0000011001_0100011001_0101100001;

reg [99:0] transmit;

// assigns data to transmit
assign dtx = transmit[99];

// module counter
always @ (posedge clk, posedge reset)
begin
    if(reset)
        count <= 16'b0;
    else 
        count <= count + 1'b1;
end

// transmits the data acquisition command
always @ (posedge clk, posedge reset)
begin
    if(reset)
        // uses RS 232C comm protocol:
        // start bit (1'b0), data (LSB first), stop bit (1'b1)
        // 47_30_30_30_37_36_38_30_31_0D
        // 0100 0111_0011 0000_0011 0000_0011 0000_0011 0111 ... 
        // 0011 0110_0011 1000_0011 0000_0011 0001_0000 1101
        transmit <= {tx_1[49:0], tx_2[49:0]};
    else if(count < 100 && count > 0)
        transmit <= {transmit[98:0], transmit[99]};    //shifts out data to transmit
end

// receives echo command
always @ (posedge clk, posedge reset)
begin
    if(reset)
        echo <= 120'b0;
    else if(count >= 100 && count < 220)
        echo <= {echo[118:0], drx};
end

// checks if echo is valid
always @ (posedge clk, posedge reset)
begin
    if(reset)
        valid <= 1'b0;
    else if(count == 220)
        if(echo == {tx_1[49:0], tx_2[49:0], 20'b0101100001_0101100001})
            valid <= 1'b1;
end

// receives 24 data blocks
always @ (posedge clk, posedge reset)
begin
    if(reset)
        temp_rfData <= 520'b0;
    else if(count >= 220 && count < 12700)
        temp_rfData <= {temp_rfData[518:0], drx};
end

always @(posedge clk_96M, posedge reset)
begin
    if(reset)
        writeCount <= 13'b0;
    else if(count == 739 || count == 1259 || count == 1779 || count == 2299 || count == 2819 ||
              count == 3339 || count == 3859 || count == 4379 || count == 4899 || count == 5419 ||
              count == 5939 || count == 6459 || count == 6979 || count == 7499 || count == 8019 ||
              count == 8539 || count == 9059 || count == 9579 || count == 10099 || count == 10619 ||
              count == 11139 || count == 11659 || count == 12179 || count == 12699)
        writeCount <= writeCount + 1'b1;
    else
        writeCount <= 13'b0;
end

// writes temp to rfData on the second 96M rising edge and counts the data blocks
// sends ready signal used to start logic in mapping.v
always @ (posedge clk_96M, posedge reset)
begin
    if(reset)
    begin
        rfData <= 520'b0;
        db_count <= 6'b0;
    end
    
    else if(writeCount == 2)
    begin    
        rfData <= temp_rfData[519:0];
        db_count <= db_count + 1'b1;
    end
    
    else if(count == 12709)
        db_count <= 6'b0;
end

// reads in last 10 bits of command
// not really necessary
always @ (posedge clk, posedge reset)
begin
    if(reset)
        lf <= 10'b0;
    else if(count >= 12700 && count < 12710)
        lf <= {lf[8:0], drx};
end

endmodule

