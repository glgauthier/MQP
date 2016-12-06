// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clkin_100MHz, clk_100MHz, clk_25MHz, clk_24MHz, clk_5MHz, reset);
  input clkin_100MHz;
  output clk_100MHz;
  output clk_25MHz;
  output clk_24MHz;
  output clk_5MHz;
  input reset;
endmodule
