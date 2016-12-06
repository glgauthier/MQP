// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module noip_top(sysclk, reset, sw, cam_rst, trigger, cam_sysclk, cam_reset, cam_trigger, FIFO_DATA, FIFO_OE1, FIFO_RRST1, FIFO_OE2, FIFO_RRST2, FIFO_RCK, rgb, HS, VS, LEDs);
  input sysclk;
  input reset;
  input sw;
  input cam_rst;
  input trigger;
  output cam_sysclk;
  output cam_reset;
  output cam_trigger;
  input [7:0]FIFO_DATA;
  output FIFO_OE1;
  output FIFO_RRST1;
  output FIFO_OE2;
  output FIFO_RRST2;
  output FIFO_RCK;
  output [7:0]rgb;
  output HS;
  output VS;
  output [3:0]LEDs;
endmodule
