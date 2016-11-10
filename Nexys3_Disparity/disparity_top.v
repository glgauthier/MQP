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
	 input [9:0] disp_href,
	 input [9:0] disp_vref,
	 output [7:0] new_image,
	 output reg [9:0] buffer_href,
	 output reg [9:0] buffer_vref,
	 output reg image_sel = 0, // left/right frame select
	 output idle, // LED indicator signify end of process
	 output [2:0] state_LED,
	 output reg [9:0] minr, maxr,t_minc,t_maxc,b_minc=0,b_maxc=0,mind,maxd,numBlocks,
	 output reg [9:0] rcnt, ccnt, dcnt = 0, cdcnt,rdcnt,scnt = 0
    );

// user-defined constants (image search parameters)
parameter WIDTH = 20 - 1; // output image width (scale down by 16)
parameter HEIGHT = 7 - 1; // output image height (scale down by 16)
parameter SEARCH_RANGE = 15-1; // 50 
parameter HALF_BLOCK = 3-1; // 3 

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
integer i,j,c;
reg [7:0] max, index;
reg [1:0] pipe=2'b00;

// temporary memory
reg [7:0] resultant [0:WIDTH][0:HEIGHT];
reg [7:0] left_frame [0:WIDTH][0:HEIGHT];
reg [7:0] right_frame [0:WIDTH][0:HEIGHT];
reg [7:0] template [0:BLOCK_SIZE-1][0:BLOCK_SIZE-1];
reg [7:0] block [0:BLOCK_SIZE][0:BLOCK_SIZE];
reg [7:0] SAD_diffs [0:BLOCK_SIZE][0:BLOCK_SIZE];
reg [(SEARCH_RANGE*8)-1:0] SAD_vector [0:SEARCH_RANGE]; // dynamic size in matlab implementation
reg [(SEARCH_RANGE*8)-1:0] temp; // sum pre-sad vector

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
always @(current_state,enable,row_count,col_count,image_sel,ccnt,cdcnt,t_maxc,b_maxc,dcnt,ns_enable,ps_enable,pipe)
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
		if((ccnt == t_maxc) && (cdcnt == b_maxc)) begin
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
		if(t_maxc<WIDTH && maxr<HEIGHT && pipe == 2'b11) begin
			next_state = SEPARATE;
			prev_state = FINALIZE;
		end
		else if(t_maxc==WIDTH && maxr==HEIGHT && pipe == 2'b11) begin
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
		else if (row_count == (HEIGHT) && col_count == (WIDTH) && image_sel == 1'b0) begin
			image_sel <= 1'b1;
			row_count <= 10'b0;
			col_count <= 10'b0;
		end
		// go to next state if both images have been read in
		else begin
			row_count <= 10'b0;
			col_count <= 10'b0;
		end
	end
	
	SEPARATE: // reset for next search along disparity range
	begin
		// read in search block set by (dcnt+t_minc,dcnt+t_maxc,minr:maxr)
		for(cdcnt = (b_minc); cdcnt < (b_maxc); cdcnt = cdcnt + 1'b1)
			for (rdcnt = minr; rdcnt < maxr; rdcnt = rdcnt + 1'b1)
				block[cdcnt-b_minc][rdcnt-minr] <= right_frame[cdcnt][rdcnt];
		
		// read in template block set by (t_minc:t_maxc,minr:maxr)
		for(ccnt = t_minc; ccnt<t_maxc; ccnt = ccnt + 1'b1)
			for(rcnt = minr; rcnt<maxr; rcnt = rcnt + 1'b1)
				template[ccnt-t_minc][rcnt-minr] <= left_frame[ccnt][rcnt];
			
		if(next_state == SAD)
			pipe <= 2'b00;
	end
	
	SAD:
	begin
		
    	// abs(template-block)
		if (pipe == 2'b00) begin
			for(ccnt = t_minc; ccnt<t_maxc; ccnt = ccnt + 1'b1)
			begin
				for(rcnt = minr; rcnt<maxr; rcnt = rcnt + 1'b1)
					if(template[ccnt][rcnt]>block[ccnt][rcnt])
						SAD_diffs[ccnt-t_minc][rcnt-minr] <= template[ccnt][rcnt] - block[ccnt][rcnt];
					else
						SAD_diffs[ccnt-t_minc][rcnt-minr] <= block[ccnt][rcnt] - template[ccnt][rcnt];
				if(ccnt == (t_maxc-1)) pipe <= 2'b01;
			end
		end
		
		// sum(abs(template-block))
		else if (pipe == 2'b01) begin
			scnt <= scnt + 1'b1; // number of blocks processed for the vector (SUMcount = scnt)		
			for(i = t_minc; i <= t_maxc; i = i + 1) begin // increment accross
				for(j = minr; j<= maxr; j = j + 1) begin // increment down
					temp[i] <= temp[i] + SAD_diffs[i-t_minc][j-minr];
					if(j == maxr) 
						temp[i] <= temp[i] / (maxr-minr);
				end
				if (i == t_maxc) pipe <= 2'b10;
			end
		end
		
		// sum(sum(abs(template-block)))
		else
			for(i = t_minc; i <= t_maxc; i = i + 1)
			begin
				SAD_vector[blockIndex] <= SAD_vector[blockIndex] + temp[i-t_minc];
				if (i == t_maxc) begin
					SAD_vector[blockIndex] <= SAD_vector[blockIndex]/(t_maxc-t_minc);
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
		end
			
		
	end
	
	FINALIZE:
	begin
		dcnt <= 10'b0;
		// search for index of max valye in SAD_vector
		if(pipe == 2'b00)
		begin
			for(c = 0; c <= SEARCH_RANGE; c = c + 1)
			begin
				if (c == 0) begin
					max <= SAD_vector[0];
					index <= 0;
				end
				else if(SAD_vector[c]>max)
				begin
					max <= SAD_vector[c];
					index <= c;
				end
				
				if (c == SEARCH_RANGE) pipe <= 2'b01;
			end
		end
		// place disparity value in output image array
		else begin
			resultant[t_minc+HALF_BLOCK][minr+HALF_BLOCK] <= index;
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
			//maxd = (SEARCH_RANGE < ((WIDTH) - t_maxc + HALF_BLOCK)) ? SEARCH_RANGE : ((WIDTH) - t_maxc + HALF_BLOCK);
			maxd = (SEARCH_RANGE < ((WIDTH) - t_maxc)) ? SEARCH_RANGE : ((WIDTH) - t_maxc);
		numBlocks = maxd - mind;
		buffer_href = col_count;
		buffer_vref = row_count;
	end
end

//always @ (disp_href, disp_vref)
//begin
assign new_image = resultant[disp_vref][disp_href];
//end

assign state_LED = current_state;

endmodule
