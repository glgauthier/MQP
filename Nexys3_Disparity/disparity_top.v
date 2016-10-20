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
	 output [7:0] new_image,
	 output buffer_href,
	 output buffer_vref,
	 output reg image_sel, // left/right frame select
	 output idle // LED indicator signify end of process
    );

// user-defined constants (image search parameters)
parameter SEARCH_RANGE = 50; // 50 
parameter HALF_BLOCK = 3; // 3 
parameter WIDTH = 46; // output image width (scale down by 16)
parameter HEIGHT = 30; // output image height (scale down by 16)

// calculated constants
parameter BLOCK_SIZE = (2*HALF_BLOCK) + 1;

// search variables
reg [9:0] col_count = 0;  // number of cols iterated through (m in matlab code)
reg [9:0] row_count = 0; // number of rows iterated through (n in matlab code)
wire [9:0] minr = 0, maxr = 0, minc = 0, maxc = 0; // current search block borders
reg [9:0] rcnt = 0, ccnt = 0, dcnt; // temporary counters based on above wires for template block
wire [9:0] mind = 0, maxd = 0; // min/max disparity search bounds
wire [9:0] numBlocks = 0; // number of blocks within current search bounds

// temporary memory
reg [7:0] resultant [1:WIDTH][1:HEIGHT];
reg [7:0] left_frame [1:WIDTH][1:HEIGHT];
reg [7:0] right_frame [1:WIDTH][1:HEIGHT];
reg [7:0] template [1:BLOCK_SIZE][1:BLOCK_SIZE];
reg [7:0] block [1:BLOCK_SIZE][1:BLOCK_SIZE];
reg [7:0] SAD_vector [1:SEARCH_RANGE]; // dynamic size in matlab implementation

// ~~~~~~~~~~~~~~~ Disparity FSM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter [2:0] READ = 3'b000, // read data from FIFO
					 SEPARATE = 3'b010, // separate search image into rows
					 SAD = 3'b011, // perfom sum of absolute diff's
					 FINALIZE = 3'b100, // search for max vector values, store in disparity matrix
					 IDLE = 3'b101; // wait for next read sequence

reg [2:0] current_state, next_state;
reg ns_enable = 1'b0, ps_enable = 1'b0;

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
			next_state = SEPARATE;
		else
			next_state = READ;
	SEPARATE:
		if(ns_enable)
			next_state = SAD;
		else
			next_state = SEPARATE;
	SAD:
		if(ps_enable)
			next_state = SEPARATE;
		else if(ns_enable)
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

// FSM Implementation
always @(posedge clk)
	case(current_state)
	
	IDLE: // wait for next read sequence
	begin
		row_count <= 10'b0;
		col_count <= 10'b0;
		image_sel <= 1'b0;
	end
	
	READ: // read in image data from buffers
	begin
		// read in image buffer data at current address
		if (image_sel == 1'b0)
			left_frame[col_count][row_count] <= image_data;
		else
			right_frame[col_count][row_count] <= image_data;
		
		// update address for next FSM cycle
		// increment accross by pixel index
		if(col_count < WIDTH) 
			col_count <= col_count + 1'b1;
		// after reaching last pixel, go to next row
		else if (row_count < HEIGHT) begin 
			col_count <= 10'b0;
			row_count <= row_count + 1'b1;
		end
		// if all indices have been accessed in the left image, reset for the right
		else if (row_count == HEIGHT && col_count == WIDTH && image_sel == 1'b0) begin
			image_sel <= 1'b1;
			row_count <= 10'b0;
			col_count <= 10'b0;
		end
		// go to next state if both images have been read in
		else 
			ns_enable = 1'b1;
	end
	
	SEPARATE: // reset for next search along disparity range
	begin
		rcnt <= minr;
		ccnt <= minc;
		
		// read in template block set by (minc:maxc,minr:maxr)
		while (ccnt <= maxc) begin
			while (rcnt <= maxr) begin
			template[ccnt-minc][rcnt-minr] <= right_frame[ccnt][rcnt];
			rcnt <= rcnt + 1'b1;
			end
			
			ccnt <= ccnt + 1'b1;
		end
		
		ns_enable <= 1'b1;
	
	end
	
	SAD:
	begin
		dcnt <= mind;
		
		while(dcnt <= maxd) begin
			dcnt <= dcnt + 1'b1;
		end
		
//		if (col_count <= HEIGHT) begin
//			while (row_count <= WIDTH) begin
//			end
//		end
		
		// reset for another separation/repeat cycle
		ns_enable <= 1'b1; // if done with disparity
		ps_enable <= 1'b1; // if it's time for a new search
		col_count <= 10'b0;
		row_count <= 10'b0;
		
	end
	
	FINALIZE:
	begin
		ns_enable <= 1'b1;
	end
	endcase
	
// done after finalize is finished
assign idle = (current_state == IDLE); 

// assign block search bounds based col_count, row_count (prevent wrapping outside image)
assign minr = (1 > (col_count - HALF_BLOCK)) ? 10'b1 : (col_count - HALF_BLOCK);
assign maxr = (HEIGHT < (col_count + HALF_BLOCK)) ? HEIGHT : (col_count + HALF_BLOCK);
assign minc = (1 > (row_count - HALF_BLOCK)) ? 10'b1 : (row_count - HALF_BLOCK);
assign maxc = (WIDTH < (row_count + HALF_BLOCK)) ? WIDTH : (row_count + HALF_BLOCK);
assign mind = 10'b0; // or = max(-SEARCH_RANGE, 1-minc)
assign maxd = (SEARCH_RANGE < (WIDTH - maxc)) ? SEARCH_RANGE : (WIDTH - maxc);
assign numBlocks = (maxd - mind) + 1'b1;
endmodule
