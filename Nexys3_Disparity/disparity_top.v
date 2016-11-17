`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Disparity Algorithm top module implementation
//////////////////////////////////////////////////////////////////////////////////
module disparity(
	 input clk, // Read clk signal
	 input enable, // enable new disparity calculation 
	 input reset, // reset disparity FSM
	 input [7:0] image_data, // FIFO data in
	 input buffer_ready, // input images ready to be processed
	 input [9:0] disp_href, // output image href
	 input [9:0] disp_vref, // output image vref
	 output [40:0] new_image, // output image data
	 output reg [9:0] buffer_href, // current template href
	 output reg [9:0] buffer_vref, // current template vref
	 output reg image_sel = 0, // left/right frame select
	 output idle, // LED indicator signify end of process
	 output [2:0] state_LED, // current state indicator
	 // ~~~~~~~~ internal registers brought to output for simulation ~~~~~~~~~~~~~~
	 output reg [9:0] minr, maxr,t_minc,t_maxc,b_minc,b_maxc,mind,maxd,numBlocks,
	 output reg [9:0] rcnt=0, ccnt=0, dcnt = 0, cdcnt,rdcnt,scnt = 0
    );

// user-defined constants (image search parameters)
parameter WIDTH = 20 - 1; // output image width (0-indexed)
parameter HEIGHT = 7 - 1; // output image height (0-indexed)
parameter SEARCH_RANGE = 15-1; // disparity block comparison search range (0-indexed)
parameter HALF_BLOCK = 2; // half block size

// calculated constants
parameter BLOCK_SIZE = (2*HALF_BLOCK) + 1;

// search variables
reg [9:0] col_count = 0;  // number of cols iterated through (m in matlab code)
reg [9:0] row_count = 0; // number of rows iterated through (n in matlab code)
//wire [9:0] minr = 0, maxr = 0, t_minc = 0, t_maxc = 0; // current search block borders
//reg [9:0] rcnt = 0, ccnt = 0, dcnt=0, cdcnt = 0,rdcnt = 0,scnt = 0; // temporary counters based on above wires for template block
//wire [9:0] mind = 0, maxd = 0; // min/max disparity search bounds
//wire [9:0] numBlocks = 0; // number of blocks within current search bounds
reg [9:0] blockIndex = 0; // current block being searched in numBlocks
reg [7:0] min, index; // index and value of max number in disparity vector (this should be switched to min)
reg [1:0] pipe=2'b00; // pipeline control for FSM
reg done; //col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count == HEIGHT (will be 1 if disparity is 100% done)

// counting variables for various loops
integer i,j,c;

// temporary memory
reg [7:0] resultant [0:WIDTH][0:HEIGHT]; // final disparity image
reg [7:0] left_frame [0:WIDTH][0:HEIGHT]; // left image
reg [7:0] right_frame [0:WIDTH][0:HEIGHT]; // right image
reg [7:0] template [0:BLOCK_SIZE-1][0:BLOCK_SIZE-1]; // template block
reg [7:0] block [0:BLOCK_SIZE-1][0:BLOCK_SIZE-1]; // search block
reg [7:0] SAD_diffs [0:BLOCK_SIZE-1][0:BLOCK_SIZE-1]; // block for holding abs(template-block)
reg [(SEARCH_RANGE*8)-1:0] temp [0:BLOCK_SIZE-1]; // block for holding sum(abs(template-block))
reg [(SEARCH_RANGE*8)-1:0] SAD_vector [0:SEARCH_RANGE]; // block for holding sum(sum(abs(template-block)))

// ~~~~~~~~~~~~~~~ Disparity FSM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter [2:0] READ = 3'b001, // read data from FIFO
					 SEPARATE = 3'b010, // separate search image into rows
					 SAD = 3'b011, // perfom sum of absolute diff's
					 FINALIZE = 3'b100, // search for max vector values, store in disparity matrix
					 IDLE = 3'b000; // wait for next read sequence

reg [2:0] current_state = IDLE, next_state = IDLE, prev_state = IDLE;
reg ns_enable = 1'b0, ps_enable = 1'b0;

// state-machine flip-flops
always @ (posedge clk, posedge reset)
	if(reset)
		current_state <= IDLE;
	else
		current_state <= next_state;

// next state logic
// starts a new sequence on "enable" transition,
// otherwise progresses based on ns_enable
always @(current_state,enable,row_count,col_count,image_sel,ccnt,cdcnt,t_maxc,b_maxc,dcnt,ns_enable,ps_enable,pipe,done)
	case(current_state)
	IDLE: 
		if(enable) begin
			next_state = READ;
			prev_state = IDLE;
		end 
		else begin
			next_state = IDLE;
			prev_state = IDLE;
		end
	READ: 
		if (row_count == HEIGHT && col_count == WIDTH && image_sel == 1'b1) begin
			next_state = SEPARATE;
			prev_state = READ;
		end
		else begin
			next_state = READ;
			prev_state = READ;
		end
	SEPARATE:
		//if((ccnt == t_maxc) && (cdcnt == b_maxc)) begin
		if(ccnt == (BLOCK_SIZE-1) && rcnt == (BLOCK_SIZE-1)) begin
			next_state = SAD;
			prev_state = SEPARATE;
		end
		else begin
			next_state = SEPARATE;
			prev_state = SEPARATE;
		end
	SAD:
		if(dcnt < maxd && pipe == 2'b11) begin
			next_state = SEPARATE;
			prev_state = SAD;
		end
		else if (dcnt < maxd || pipe < 2'b11) begin
			next_state = SAD;
			prev_state = SAD;
		end
		else begin
			next_state = FINALIZE;
			prev_state = SAD;
		end
	FINALIZE: 
		// both were maxr<HEIGHT && maxr == HEIGHT
		//if(t_maxc<(WIDTH-1) && minr<=(HEIGHT-HALF_BLOCK) && pipe == 2'b11) begin
		//if(b_maxc<WIDTH && minr<=(HEIGHT-HALF_BLOCK) && pipe == 2'b11) begin
		if(~done && pipe == 2'b11) begin
			next_state = SEPARATE;
			prev_state = FINALIZE;
		end
		else if(done && pipe == 2'b11) begin
		//else if (blockIndex == 1'b1 && pipe == 2'b11)
			next_state = IDLE;
			prev_state = FINALIZE;
		end
		else begin
			next_state = FINALIZE;
			prev_state = FINALIZE;
		end
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
		dcnt <= 10'b0;
		pipe <= 2'b00;
	end
	
	READ: // read in image data from buffers
	begin		
		// read in image buffer data at current address
		if (image_sel == 1'b0)
			left_frame[col_count][row_count] <= image_data;
		else
			right_frame[col_count][row_count] <= image_data;
		
		// update address for next FSM cycle
		if(col_count < WIDTH) // increment accross by pixel index
			col_count <= col_count + 1'b1;
		else if (row_count < HEIGHT) begin // after reaching last pixel, go to next row
			col_count <= 10'b0;
			row_count <= row_count + 1'b1;
		end
		// if all indices have been accessed in the left image, reset for the right
		else if (row_count == (HEIGHT) && col_count == (WIDTH) && image_sel == 1'b0) begin
			image_sel <= 1'b1;
			row_count <= 10'b0;
			col_count <= 10'b0;
		end
		// go to next state if both images have been read in
		else begin
			row_count <= 10'b0;
			col_count <= 10'b0;
			pipe <= 2'b00;
		end
	end
	
	SEPARATE: // Read in new block data for next comparison
	begin
		// read in the template and search blocks IN PARALLEL as set by the following:
		// template block: (t_minc:t_maxc,minr:maxr)
		// search block: (b_minc:b_maxc,minr:maxr)
		
		// read in template image block
		if(ccnt <= (t_maxc-t_minc) && rcnt <= (maxr-minr)) // fully within template search bounds
			template[ccnt][rcnt] <= left_frame[t_minc+ccnt][minr+rcnt];
		else // outside tempate bounds
			template[ccnt][rcnt] <= 8'h00;
			
		// read in search image block
		if(ccnt <= (b_maxc-b_minc) && rcnt <= (maxr-minr)) // fully within template search bounds
			block[ccnt][rcnt] <= right_frame[b_minc+ccnt][minr+rcnt];
		else // outside tempate bounds
			block[ccnt][rcnt] <= 8'h00;

		// increment ccnt and rcnt to iterate through all pixels within blocks
		if(ccnt<(BLOCK_SIZE-1))
			ccnt<=ccnt+1'b1;
		else if(rcnt<(BLOCK_SIZE-1) && ccnt==(BLOCK_SIZE-1)) begin
			rcnt <= rcnt+1'b1;
			ccnt <= 10'b0;
		end
		
		// make sure pipe is clear for SAD
		if(next_state == SAD)begin
			pipe <= 2'b00;
			ccnt <= 0;
			rcnt <= 0;
			cdcnt <= 0;
			rdcnt <= 0;
		end
	end
	
	SAD:
	begin
    	// ~~~~~~~~~~~~~~~~ abs(template-block) ~~~~~~~~~~~~~~~~ 
		if (pipe == 2'b00) begin
			if(template[ccnt][rcnt]>block[ccnt][rcnt])
				SAD_diffs[ccnt][rcnt] <= template[ccnt][rcnt] - block[ccnt][rcnt];
			else
				SAD_diffs[ccnt][rcnt] <= block[ccnt][rcnt] - template[ccnt][rcnt];

			if(ccnt<(BLOCK_SIZE-1))
				ccnt<=ccnt+1'b1;
			else if(rcnt <(BLOCK_SIZE-1) && ccnt==(BLOCK_SIZE-1)) begin
				rcnt <= rcnt+1'b1;
				ccnt <= 10'b0;
			end
			else begin // ccnt == (BLOCK_SIZE-1) && rcnt == (BLOCK_SIZE-1)
				pipe <= 2'b01;
			end
			
		end
		
		// ~~~~~~~~~~~~~~~~ sum(abs(template-block)) ~~~~~~~~~~~~~~~~ 
		if (rcnt>1 && pipe < 2'b10) begin // pipeline things
			if(cdcnt < BLOCK_SIZE) // 0..block_size-1
					if(cdcnt == 0)
						temp[rdcnt] <= SAD_diffs[0][rdcnt];
					else
						temp[rdcnt] <= temp[rdcnt] + SAD_diffs[cdcnt][rdcnt];	
			else// avg accross block width when one sum is done 
					temp[rdcnt] <= (temp[rdcnt]/BLOCK_SIZE);
			
			if(cdcnt<BLOCK_SIZE)
				cdcnt<=cdcnt+1'b1;
			else if(rdcnt <(BLOCK_SIZE-1) && cdcnt==(BLOCK_SIZE)) begin
				rdcnt <= rdcnt+1'b1;
				cdcnt <= 10'b0;
			end
			else begin// ccnt == (BLOCK_SIZE) && rcnt == (BLOCK_SIZE-1)
				pipe <= 2'b10;
				ccnt <= 10'b0;
				rcnt <= 10'b0;
				cdcnt <= 10'b0;
				rdcnt <= 10'b0;
			end
		
		end
		
		// ~~~~~~~~~~~~~~~~ sum(sum(abs(template-block))) ~~~~~~~~~~~~~~~~ 
		if (pipe == 2'b10) begin // pipe = 2'b10
			if(ccnt<BLOCK_SIZE-1) begin
				if(ccnt == 0)
					SAD_vector[blockIndex] <= temp[0];
				else
					SAD_vector[blockIndex] <= SAD_vector[blockIndex] + temp[ccnt];
				ccnt <= ccnt + 1'b1;
			end
			else begin
				SAD_vector[blockIndex] <= SAD_vector[blockIndex]/(BLOCK_SIZE);
				ccnt <= 0;
				pipe <= 2'b11;
			end
		end 
		
      // update SAD vector index (when full, proceed to finalization)	
		if(dcnt < maxd && pipe == 2'b11) begin
			dcnt <= dcnt + 10'b1;
			blockIndex <= dcnt - mind; // index in SAD_vector
		end
		
		// update cols & rows processed by the algorithm
		if (next_state == FINALIZE) begin
			scnt <= 0;
			pipe <= 2'b00;
			if(col_count < (WIDTH-(HALF_BLOCK+1'b1)))
					col_count <= col_count + 1'b1;
			else if (col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count < HEIGHT) begin
					row_count <= row_count + 1'b1;
					col_count <= 0;
			end
			if(col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count == HEIGHT)
				done <= 1'b1;
			else
				done <= 1'b0;
		end 
		if (next_state == SEPARATE) begin
			ccnt <= 0;
			rcnt <= 0;
			cdcnt <= 0;
			rdcnt <= 0;
			pipe <= 2'b00;
		end
			
		
	end
	
	FINALIZE:
	begin
		dcnt <= 10'b0;
		// search for index of max valye in SAD_vector
//		if(pipe == 2'b00)
//		begin
//			for(c = 0; c <= numBlocks; c = c + 1)
//			begin
//				if (c == 0) begin
//					min <= SAD_vector[0];
//					index <= 0;
//				end
//				else if(SAD_vector[c]<min)
//				begin
//					min <= SAD_vector[c];
//					index <= c;
//				end
//				
//				if (c == numBlocks) pipe <= 2'b01;
//			end
//		end
		if(scnt<=numBlocks) begin
			if(scnt == 0) begin
				min <= SAD_vector[0];
				index <= 0;
				end
			else if(SAD_vector[scnt]<min) begin
				min <= SAD_vector[scnt];
				index <= scnt;
				end
			scnt <= scnt + 1'b1;
		end
		// place disparity value in output image array
		else begin
			resultant[buffer_href][buffer_vref] <= index;
			pipe <= 2'b11;
		end
			
			
	end
	endcase
	
// done after finalize is finished
assign idle = (current_state == IDLE); 

// assign block search bounds
always @(row_count,col_count,t_maxc,maxd,mind,dcnt,next_state,current_state,prev_state)
begin
	if (current_state == IDLE) begin
		minr = 0;
		maxr = 0;
		t_minc = 0;
		t_maxc = 0;
		b_minc = 10'b0;
		b_maxc = 10'b0;
		mind = 0; // or = max(-SEARCH_RANGE, 1-t_minc)
		maxd = 0;
		numBlocks = 0;
		buffer_href = 0;
		buffer_vref = 0;
		end
	else begin
		minr = (0 > $signed(row_count - HALF_BLOCK)) ? 10'b0 : (row_count - HALF_BLOCK);
		maxr = ((HEIGHT) < (row_count + HALF_BLOCK)) ? HEIGHT : (row_count + HALF_BLOCK);
		t_minc = (0 > $signed(col_count - HALF_BLOCK)) ? 10'b0 : (col_count - HALF_BLOCK);
		t_maxc = ((WIDTH) < (col_count + HALF_BLOCK)) ? WIDTH : (col_count + HALF_BLOCK);
		b_minc =(0 > $signed(dcnt - HALF_BLOCK+col_count)) ? 10'b0 : (dcnt - HALF_BLOCK + col_count);
		b_maxc = ((WIDTH) < (dcnt + HALF_BLOCK)) ? WIDTH : (dcnt + col_count + HALF_BLOCK);
		mind = 10'b0; // or = max(-SEARCH_RANGE, 1-t_minc)
		if (current_state == READ)
			maxd = SEARCH_RANGE;
		else if(current_state == FINALIZE)
			maxd = (SEARCH_RANGE < ((WIDTH) - t_maxc)) ? SEARCH_RANGE : ((WIDTH) - t_maxc);
		numBlocks = maxd - mind;
		buffer_href = col_count;
		buffer_vref = row_count;
	end
end

// ~~~~ Check template & block output (tested working) ~~~~
//assign new_image = block[ccnt][rcnt];
//assign new_image = template[ccnt][rcnt];
// ~~~~ Check abs(template-block) [tested working] ~~~~
//assign new_image = SAD_diffs[ccnt][rcnt];
// ~~~~ Check sum(abs(template-block)) [tested working] ~~~~
//assign new_image = temp[ccnt];
// ~~~~ Check sum(sum(abs(template-block))) [tested working] ~~~~
//assign new_image = SAD_vector[blockIndex];
// ~~~~ Check each block index analysed by the FINALIZE state (working) ~~~~
//assign new_image = SAD_vector[scnt]; 
// ~~~~ Check the resultant index found by the FINALIZE state (working) ~~~~
//assign new_image = index;

assign new_image = {32'b0,resultant[disp_href][disp_vref]};

assign state_LED = current_state;

endmodule
