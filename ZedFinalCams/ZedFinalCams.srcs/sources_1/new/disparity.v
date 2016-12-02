`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Disparity Algorithm implementation
//////////////////////////////////////////////////////////////////////////////////
module disparity(
	 input clk, // Read clk signal
	 input enable, // Enable new disparity calculation 
	 input buffer_ready, // Input from left/right image buffer controller
	 input reset, // Reset disparity FSM
	 input [7:0] ldata, // Left bram pixel data in
	 input [7:0] rdata, // Right bram pixel data in
	 output reg [16:0] laddr, // Left bram read address
	 output reg [16:0] raddr, // Right bram read address
	 output reg [18:0] result_addr, // Result bram write address
	 output reg [7:0] result_data, // Result bram pixel data
	 output result_wea, // Result bram write enable
	 output idle, // LED indicator signify end of process
	 output [2:0] state_LED // Current state indicator
    );

// user-defined constants (image search parameters)
parameter WIDTH = 384 - 1; // output image width (0-indexed)
parameter HEIGHT = 288 - 1; // output image height (0-indexed)
parameter SEARCH_RANGE = 20-1; // disparity block comparison search range (0-indexed)
parameter HALF_BLOCK = 3; // half block size

// calculated constants
parameter BLOCK_SIZE = (2*HALF_BLOCK) + 1; // block size
parameter BLOCK_SIZE0 = (2*HALF_BLOCK); // block size with zero based index

// search variables (incremented automatically)
reg [9:0] col_count = 10'b0;  // number of cols iterated through (m in matlab code)
reg [9:0] row_count = 10'b0; // number of rows iterated through (n in matlab code)
reg [9:0] minr = 10'b0, maxr = 10'b0, t_minc = 10'b0, t_maxc = 10'b0, b_minc = 10'b0, b_maxc = 10'b0; // current search block borders
reg [9:0] rcnt = 10'b0, ccnt = 10'b0, dcnt=10'b0, cdcnt = 10'b0,rdcnt = 10'b0; // temporary counters based on above wires for search blocks
reg [5:0] mind = 6'b0, maxd = 6'b0; // min/max disparity search bounds (limit SEARCH_RANGE to 63 blocks!)
reg [5:0] scnt = 6'b0; // number of disparity search comparisons performed
reg [5:0] numBlocks = 6'b0; // number of blocks within current search bounds
reg [5:0] blockIndex = 6'b0; // current block being searched in numBlocks
reg [7:0] min, index; // index and value of max number in disparity vector (this should be switched to min)
reg [1:0] pipe =2'b00; // pipeline control for FSM
reg done; // will be 1 if disparity is 100% done, 0 otherwise (used for next_state == IDLE)

// temporary memory
reg [7:0] template [0:BLOCK_SIZE0][0:BLOCK_SIZE0]; // template block
reg [7:0] block [0:BLOCK_SIZE0][0:BLOCK_SIZE0]; // search block
reg [7:0] SAD_diffs [0:BLOCK_SIZE0][0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [14:0] temp [0:BLOCK_SIZE0]; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [14:0] SAD_vector [0:SEARCH_RANGE]; // block for holding sum(sum(abs(template-block))) - up to 9x9 block size

// ~~~~~~~~~~~~~~~ Disparity FSM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter [2:0] IDLE = 3'b000, // wait for next read sequence
                READ = 3'b001, // read data from FIFO
				SEPARATE = 3'b010, // separate search image into rows
				SAD = 3'b011, // perfom sum of absolute diff's
				FINALIZE = 3'b100; // search for max vector values, store in disparity matrix
reg [2:0] current_state = IDLE, 
          next_state = IDLE;

// state-machine flip-flops
always @ (posedge clk)
	if(reset) // synchronous to protect bram
		current_state <= IDLE;
	else
		current_state <= next_state;

// next state logic
always @(current_state,enable,ccnt,dcnt,pipe,done,buffer_ready,rcnt,maxd)
	case(current_state)
	IDLE: 
		if(enable) 
			next_state = READ;
		else 
			next_state = IDLE;
	READ: 
		if(buffer_ready)
			next_state = SEPARATE;
		else
			next_state = READ;
	SEPARATE:
		if(ccnt == (BLOCK_SIZE0) && rcnt == (BLOCK_SIZE0))
			next_state = SAD;
		else
			next_state = SEPARATE;
	SAD:
		if(dcnt < maxd && pipe == 2'b11)
			next_state = SEPARATE;
		else if (dcnt < maxd || pipe < 2'b11)
			next_state = SAD;
		else
			next_state = FINALIZE;
	FINALIZE: 
		if(~done && pipe == 2'b11)
			next_state = SEPARATE;
		else if(done && pipe == 2'b11)
			next_state = IDLE;
		else
			next_state = FINALIZE;
	default: next_state = IDLE;
	endcase
    
// FSM disparity Implementation
always @(posedge clk)
case(current_state)
	IDLE: // wait for next read sequence
	begin
		row_count <= 10'b0;
		col_count <= 10'b0;
		dcnt <= 10'b0;
		pipe <= 2'b00;
	end
	
	READ: // read in image data from buffers
	begin		
		pipe <= 2'b00;
	end
	
	SEPARATE: // Read in new block data for next comparison
	begin
		// read in the template and search blocks IN PARALLEL as set by the following:
		// template block: (t_minc:t_maxc,minr:maxr)
		// search block: (b_minc:b_maxc,minr:maxr)
		
		// read in template image block
		if(ccnt <= (t_maxc-t_minc) && rcnt <= (maxr-minr)) begin// fully within template search bounds
			template[ccnt][rcnt] <= ldata;//left_frame[t_minc+ccnt][minr+rcnt];
			end
		else // outside tempate bounds
			template[ccnt][rcnt] <= 8'h00;
			
		// read in search image block
		if(ccnt <= (b_maxc-b_minc) && rcnt <= (maxr-minr)) begin// fully within template search bounds
			block[ccnt][rcnt] <= rdata;//right_frame[b_minc+ccnt][minr+rcnt];
			end
		else // outside tempate bounds
			block[ccnt][rcnt] <= 8'h00;

		// increment ccnt and rcnt to iterate through all pixels within blocks
		if(pipe == 2'b11) begin
		    pipe <= 2'b00;
            if(ccnt<(BLOCK_SIZE0))
                ccnt<=ccnt+1'b1;
            else if(rcnt<(BLOCK_SIZE0) && ccnt==(BLOCK_SIZE0)) begin
                rcnt <= rcnt+1'b1;
                ccnt <= 10'b0;
            end
		end
		else
		  pipe <= pipe + 1'b1;
		  
		// make sure pipe is clear for SAD
		if(next_state == SAD)begin
			pipe <= 2'b00;
			ccnt <= 10'b0;
			rcnt <= 10'b0;
			cdcnt <= 10'b0;
			rdcnt <= 10'b0;
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

			if(ccnt<(BLOCK_SIZE0))
				ccnt<=ccnt+1'b1;
			else if(rcnt <(BLOCK_SIZE0) && ccnt==(BLOCK_SIZE0)) begin
				rcnt <= rcnt+1'b1;
				ccnt <= 10'b0;
			end
			else begin // ccnt == (BLOCK_SIZE-1) && rcnt == (BLOCK_SIZE-1)
				pipe <= 2'b01;
			end
		end
		
		// ~~~~~~~~~~~~~~~~ sum(abs(template-block)) ~~~~~~~~~~~~~~~~ 
		if (rcnt>1'b1 && pipe < 2'b10) begin // pipeline things
			if(cdcnt < BLOCK_SIZE) // 0..block_size-1
                if(cdcnt == 10'b0)
                    temp[rdcnt] <= SAD_diffs[0][rdcnt];
                else
                    temp[rdcnt] <= temp[rdcnt] + SAD_diffs[cdcnt][rdcnt];	
			else// avg accross block width when one sum is done 
				temp[rdcnt] <= (temp[rdcnt]/BLOCK_SIZE);
			
			if(cdcnt<BLOCK_SIZE)
				cdcnt<=cdcnt+1'b1;
			else if(rdcnt <(BLOCK_SIZE0) && cdcnt==(BLOCK_SIZE)) begin
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
			if(ccnt<BLOCK_SIZE0) begin
				if(ccnt == 10'b0)
					SAD_vector[blockIndex] <= temp[0];
				else
					SAD_vector[blockIndex] <= SAD_vector[blockIndex] + temp[ccnt];
				ccnt <= ccnt + 1'b1;
			end
			else begin
				SAD_vector[blockIndex] <= SAD_vector[blockIndex]/(BLOCK_SIZE);
				ccnt <= 10'b0;
				pipe <= 2'b11;
			end
		end 
		
        // update SAD vector index (when full, proceed to finalization)	
		if(dcnt < maxd && pipe == 2'b11) begin
			dcnt <= dcnt + 1'b1;
			blockIndex <= dcnt - mind; // index in SAD_vector
		end
		
		// update cols & rows processed by the algorithm
		if (next_state == FINALIZE) begin
			scnt <= 6'b0;
			pipe <= 2'b00;
			if(col_count < (WIDTH-(HALF_BLOCK+1'b1)))
					col_count <= col_count + 1'b1;
			else if (col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count < HEIGHT) begin
					row_count <= row_count + 1'b1;
					col_count <= 10'b0;
			end
			if(col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count == HEIGHT)
				done <= 1'b1;
			else
				done <= 1'b0;
		end 
		if (next_state == SEPARATE) begin
			ccnt <= 10'b0;
			rcnt <= 10'b0;
			cdcnt <= 10'b0;
			rdcnt <= 10'b0;
			pipe <= 2'b00;
		end
	end
	
	FINALIZE:
	begin
		dcnt <= 10'b0;
		// search for index of max valye in SAD_vector
		if(scnt<numBlocks) begin
			if(scnt == 6'b0) begin
				min <= SAD_vector[0];
				index <= 8'h00;
				end
			else if(SAD_vector[scnt]<min) begin
				min <= SAD_vector[scnt];
				index <= scnt;
				end
			scnt <= scnt + 1'b1;
		end
		// place disparity value in output image array
		else begin
		    result_data <= index;
		    // PUT THIS LINE BACK IN WHEN DONE
			//resultant[buffer_href][buffer_vref] <= index;
			pipe <= 2'b11;
		end
	end
endcase

assign result_wea = (current_state == FINALIZE && scnt == (numBlocks)) ? 1'b1 : 1'b0; // && scnt == numBlocks    

always @(posedge clk)
    result_addr = ((WIDTH+1'b1)*row_count)+col_count;
    
always @(posedge clk)
    laddr = ((WIDTH+1'b1)*(minr+rcnt))+(t_minc+ccnt);

always @(posedge clk)
    raddr = ((WIDTH+1'b1)*(minr+rcnt))+(b_minc+ccnt);

// assign block search bounds
always @(row_count,col_count,t_maxc,maxd,mind,dcnt)
begin
		minr = (0 > $signed(row_count - HALF_BLOCK)) ? 10'b0 : (row_count - HALF_BLOCK);
		maxr = ((HEIGHT) < (row_count + HALF_BLOCK)) ? HEIGHT : (row_count + HALF_BLOCK);
		t_minc = (0 > $signed(col_count - HALF_BLOCK)) ? 10'b0 : (col_count - HALF_BLOCK);
		t_maxc = ((WIDTH) < (col_count + HALF_BLOCK)) ? WIDTH : (col_count + HALF_BLOCK);
		b_minc =(0 > $signed(dcnt - HALF_BLOCK+col_count)) ? 10'b0 : (dcnt - HALF_BLOCK + col_count);
		b_maxc = ((WIDTH) < (dcnt + HALF_BLOCK)) ? WIDTH : (dcnt + col_count + HALF_BLOCK);
end

// assign disparity search bounds
always @(t_maxc,maxd,mind,current_state)
        begin
		mind = 6'b0; // or = max(-SEARCH_RANGE, 1-t_minc)
		if (current_state == READ)
			maxd = SEARCH_RANGE;
		else if(current_state == FINALIZE)
			maxd = (SEARCH_RANGE < ((WIDTH) - t_maxc)) ? SEARCH_RANGE : ((WIDTH) - t_maxc);
		numBlocks = maxd - mind;
end

// done after finalize is finished
assign idle = (current_state == IDLE); 
// current state indicator LED
assign state_LED = current_state;

endmodule
