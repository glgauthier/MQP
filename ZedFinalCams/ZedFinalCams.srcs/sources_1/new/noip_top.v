`timescale 1ns / 1ps
// Top module for future custom stereo camera IP package
module noip_top(
   input sysclk,
   input reset, // reset 
   input cam_rst, // button for camera RESET_BAR
   input trigger, // button for camera trigger
   output cam_sysclk, // sysclk out to camera
   output cam_reset, // reset_bar out to camera
   output cam_trigger, // trigger out to camera
   input [7:0] FIFO_DATA, // DO[7:0] from AL422b fifo
   output FIFO_OE1, // read enable to fifo (active low)
   output FIFO_RRST1, // read reset to fifo (active low)
   output FIFO_OE2, // read enable to fifo (active low)
   output FIFO_RRST2, // read reset to fifo (active low)
   output FIFO_RCK, // rck to fifo (1MHz)
   output [7:0] rgb, // values on vga color pins
   output HS, // horizontal sync (to VGA port)
   output VS, // vertical sync (to VGA port)
   output [3:0] LEDs
   );
    
wire clk_200MHz, clk_50MHz, clk_25MHz;
clk_wiz_0 clkgen
   (
   // Clock in ports
    .clk_100MHz(sysclk),      // input clk_100MHz
    // Clock out ports
    .clk_200MHz(clk_200MHz),     // output clk_200MHz
    .clk_50MHz(clk_50MHz),     // output clk_50MHz
    .clk_25MHz(clk_25MHz),     // output clk_25MHz
    // Status and control signals
    .reset(reset)
);
assign FIFO_RCK = clk_50MHz;

// ~~~~~~~~~~ disparity code ~~~~~~~~~~~~~~
wire idle,image_sel;
wire [2:0] state_LED;
wire [18:0] left_radr,left_wadr,right_radr,right_wadr,result_addr;
wire [7:0] left_data,right_data,result_data;
wire [9:0] buffer_href,buffer_vref;
disparity disp(
 .clk(clk_200MHz), // Read clk signal
 .enable(trigger), // enable new disparity calculation 
 .reset(reset), // reset disparity FSM
 .image_data(FIFO_DATA), // FIFO data in [7:0]
 .buffer_ready(), // input images ready to be processed
 .disp_href(), // output image href [9:0]
 .disp_vref(), // output image vref [9:0]
 .new_image(), // output image data [7:0]
 .buffer_href(buffer_href), // current template href [9:0]
 .buffer_vref(buffer_vref), // current template vref [9:0]
 .image_sel(), // left/right frame select
 .idle(idle), // LED indicator signify end of process
 .state_LED(state_LED) // current state indicator [2:0]
);

assign LEDs = {idle,state_LED[2:0]}; 

// ~~~~~~~~~~~~~~~~ Left, right, resultant image buffers ~~~~~~~~~~~~~~~~ 
// logic for controlling buffer reads and writes
reg left_we, right_we, resultant_we;
wire [18:0] left_wadr, right_wadr;
wire [7:0] left_din, right_din;
assign left_din = (image_sel == 1'b0) ? FIFO_DATA : 8'h00;
assign right_din = (image_sel == 1'b0) ? 8'h00 : FIFO_DATA;

blk_mem_640_480 left_img (
  .clka(clk_50MHz),    // input wire clka
  .wea(wea),      // input wire [0 : 0] wea
  .addra(left_wadr),  // input wire [18 : 0] addra
  .dina(left_din),    // input wire [7 : 0] dina
  .clkb(clk_200MHz),    // input wire clkb
  .enb(1'b1),
  .addrb(left_radr),  // input wire [18 : 0] addrb
  .doutb(left_data)  // output wire [7 : 0] doutb
);

blk_mem_640_480 right_img (
  .clka(clk_50MHz),    // input wire clka
  .wea(wea),      // input wire [0 : 0] wea
  .addra(right_wadr),  // input wire [18 : 0] addra
  .dina(right_din),    // input wire [7 : 0] dina
  .clkb(clk_200MHz),    // input wire clkb
  .enb(1'b1),
  .addrb(right_radr),  // input wire [18 : 0] addrb
  .doutb(right_data)  // output wire [7 : 0] doutb
);

blk_mem_640_480 resultant (
  .clka(clk_200MHz),    // input wire clka
  .wea(wea),      // input wire [0 : 0] wea
  .addra(result_addr),  // input wire [18 : 0] addra
  .dina(result_data),    // input wire [7 : 0] dina
  .clkb(clk_25MHz),    // input wire clkb
  .enb(~blank),
  .addrb({(752*vcount)+hcount}),  // input wire [18 : 0] addrb
  .doutb(rgb)  // output wire [7 : 0] doutb
);
// ~~~~~~~~~~~~~~~~ End of image buffers ~~~~~~~~~~~~~~~~

// ~~~~~~~~~~~~~~~~ VGA controller ~~~~~~~~~~~~~~~~~~~~~~
wire [10:0] hcount, vcount;
wire blank;
vga_controller_640_60 vga(
    .rst(reset),
    .pixel_clk(clk_25MHz),
    .HS(HS),
    .VS(VS),
    .hcount(hcount),
    .vcount(vcount),
    .blank(blank)
    );

endmodule
