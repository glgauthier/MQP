`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2016 02:35:36 PM
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
	input fpga_clk,
    input reset,
    input reset1,
    input drx,
    output dtx,
    output lock_led
);

wire clk_96M;
wire clk19_2k;
wire [519:0] rfData;
wire [5:0] db_count;

dcm_96M dcm
(
    .CLK_IN1(fpga_clk),
    .CLK_OUT1(clk_96M),
    .RESET(reset),
    .LOCKED(lock_led)
);

clk_divider cd
(
    .clk_96M(clk_96M),
    .reset(reset),
    .clk19_2k(clk19_2k)
);

distance_acquisition da
(
    .clk(clk19_2k),
    .clk_96M(clk_96M),
    .reset(reset1),
    .dtx(dtx),
    .drx(drx),
    .db_count(db_count),
    .rfData(rfData)
);

mapping map
(
.clk(clk_96M),
.reset(reset),
.db_count(db_count),
.rfData(rfData)
);

cordic_0 cordic
(
    .aclk(),
    .s_axis_phase_tvalid(),
    .m_axis_dout_tvalid(),
    .s_axis_phase_tdata(),
    .m_axis_dout_tdata()
);


endmodule