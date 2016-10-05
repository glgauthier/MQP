`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Disparity Algorithm top module implementation
//////////////////////////////////////////////////////////////////////////////////
module disparity(
	 input clk, // Read clk signal
	 input enable, // enable new disparity calculation 
	 input reset, // reset disparity FSM
	 input [7:0] image_data, // FIFO data in
	 input buffer_ready,
	 output new_image,
	 output buffer_href,
	 output buffer_vref,
	 output image_sel, // left/right frame select
	 output idle // LED indicator signify end of process
    );

// user-defined constants (image search parameters)
parameter RANGE = 50; // 50 
parameter HALF_BLOCK = 3; // 3 
parameter WIDTH = 47; // output image width (scale down by 16)
parameter HEIGHT = 30; // output image height (scale down by 16)
// calculated constants
parameter [7:0] BLOCK_SIZE = 2'b10*HALF_BLOCK + 1'b1;

// temporary memory
reg [7:0] final_image [1:WIDTH][1:HEIGHT];
reg [7:0] left_frame [1:WIDTH][1:HEIGHT];
reg [7:0] right_frame [1:WIDTH][1:HEIGHT];
reg [7:0] SAD_vector [1:RANGE];

// ~~~~~~~~~~~~~~~ Disparity FSM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter [2:0] READ = 3'b000, // read data from FIFO
					 PROJECT = 3'b001, // apply projection mattress
					 SEPARATE = 3'b010, // separate search image into rows
					 SAD = 3'b011, // perfom sum of absolute diff's
					 FINALIZE = 3'b100, // search for max vector values, store in disparity matrix
					 IDLE = 3'b101; // wait for next read sequence
reg [2:0] current_state, next_state;
reg ns_enable = 1'b0;

// state-machine flip-flops
always @ (posedge clk, posedge reset)
	if(reset)
		current_state <= READ;
	else
		current_state <= next_state;

// next state logic
// starts a new sequence on "enable" transition,
// otherwise progresses based on ns_enable
always @(current_state,enable,ns_enable)
	case(current_state)
	IDLE:
		if(enable)
			next_state = READ;
		else
			next_state = IDLE;
	READ: 
		if (ns_enable) 
			next_state = PROJECT;
		else
			next_state = READ;
	PROJECT: 
		if (ns_enable)
			next_state = SEPARATE;
		else
			next_state = PROJECT;
	SEPARATE:
		if(ns_enable)
			next_state = SAD;
		else
			next_state = SEPARATE;
	SAD:
		if(ns_enable)
			next_state = FINALIZE;
		else
			next_state = SAD;
	FINALIZE: 
		if(ns_enable)
			next_state = IDLE;
		else 
			next_state = FINALIZE;
	default: next_state = IDLE;
	endcase


always @(posedge clk)
	case(current_state)
	READ: ns_enable <= 1'b1;
	PROJECT: ns_enable <= 1'b1;
	SEPARATE: ns_enable <= 1'b1;
	SAD: ns_enable <= 1'b1;
	FINALIZE: ns_enable <= 1'b1;
	endcase
	
// done after finalize is finished
assign idle = (current_state == IDLE); 

endmodule
