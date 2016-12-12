`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Disparity Algorithm implementation
//////////////////////////////////////////////////////////////////////////////////
module parallel_disparity(
	 input clk, // Read clk signal
	 input enable, // Enable new disparity calculation 
	 input sw, // Input from left/right image buffer controller
	 input reset, // Reset disparity FSM
	 input [7:0] ldata, // Left bram pixel data in
	 input [7:0] rdata, // Right bram pixel data in
	 output reg [16:0] laddr, // Left bram read address
	 output reg [16:0] raddr, // Right bram read address
	 output reg [18:0] result_addr, // Result bram write address
	 output reg [7:0] result_data, // Result bram pixel data
	 output result_wea, // Result bram write enable
	 output [2:0] state_LED, // Current state indicator
	 output reg [7:0] lineout,
	 input [7:0] lineaddr
    );

// user-defined constants (image search parameters)
parameter WIDTH = 384 - 1; // output image width (0-indexed)
parameter HEIGHT = 288 - 1; // output image height (0-indexed)
parameter SEARCH_RANGE = 20-1; // disparity block comparison search range (0-indexed)
parameter HALF_BLOCK = 3; // half block size
parameter FOCAL_LENGTH = 6; // 6mm
parameter BASELINE = 63; //63mm

// calculated constants
parameter BLOCK_SIZE = (2*HALF_BLOCK) + 1; // block size
parameter BLOCK_SIZE0 = (2*HALF_BLOCK); // block size with zero based index
parameter FB = FOCAL_LENGTH*BASELINE;

// search variables (incremented automatically)
reg [8:0] col_count = 9'b0;  // number of cols iterated through (m in matlab code)
reg [8:0] row_count = 9'b0; // number of rows iterated through (n in matlab code)
reg [8:0] minr = 9'b0, maxr = 9'b0, t_minc = 9'b0, t_maxc = 9'b0, b_minc = 9'b0, b_maxc = 9'b0; // current search block borders
reg [8:0] rcnt = 9'b0, dcnt=9'b0; // temporary counters based on above wires for search blocks
reg [2:0] cdcnt = 3'b0, rdcnt = 3'b0, ccnt = 3'b0;//temporary counters based on above wires for search blocks
reg [5:0] mind = 6'b0, maxd = 6'b0; // min/max disparity search bounds (limit SEARCH_RANGE to 63 blocks!)
reg [5:0] scnt = 6'b0; // number of disparity search comparisons performed
reg [5:0] numBlocks = 6'b0; // number of blocks within current search bounds
reg [5:0] blockIndex = 6'b0; // current block being searched in numBlocks
reg [7:0] min, index; // index and value of max number in disparity vector (this should be switched to min)
reg [1:0] pipe =2'b00; // pipeline control for FSM
reg done; // will be 1 if disparity is 100% done, 0 otherwise (used for next_state == IDLE)

// temporary memory
reg [7:0] template0 [0:BLOCK_SIZE0]; // template block
reg [7:0] template1 [0:BLOCK_SIZE0]; // template block
reg [7:0] template2 [0:BLOCK_SIZE0]; // template block
reg [7:0] template3 [0:BLOCK_SIZE0]; // template block
reg [7:0] template4 [0:BLOCK_SIZE0]; // template block
reg [7:0] template5 [0:BLOCK_SIZE0]; // template block
reg [7:0] template6 [0:BLOCK_SIZE0]; // template block
reg [7:0] block0 [0:BLOCK_SIZE0]; // search block
reg [7:0] block1 [0:BLOCK_SIZE0]; // search block
reg [7:0] block2 [0:BLOCK_SIZE0]; // search block
reg [7:0] block3 [0:BLOCK_SIZE0]; // search block
reg [7:0] block4 [0:BLOCK_SIZE0]; // search block
reg [7:0] block5 [0:BLOCK_SIZE0]; // search block
reg [7:0] block6 [0:BLOCK_SIZE0]; // search block
reg [7:0] SAD_diffs0 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [7:0] SAD_diffs1 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [7:0] SAD_diffs2 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [7:0] SAD_diffs3 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [7:0] SAD_diffs4 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [7:0] SAD_diffs5 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [7:0] SAD_diffs6 [0:BLOCK_SIZE0]; // block for holding abs(template-block)
reg [10:0] temp0; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [10:0] temp1; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [10:0] temp2; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [10:0] temp3; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [10:0] temp4; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [10:0] temp5; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [10:0] temp6; // block for holding sum(abs(template-block)) - up to 9x9 block size
reg [14:0] SAD_vector [0:SEARCH_RANGE]; // block for holding sum(sum(abs(template-block))) - up to 9x9 block size
reg [8:0] depth; // reg for holding (focal_length*baseline)/disparity
reg [7:0] line [0:95];
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
always @(current_state,enable,ccnt,dcnt,pipe,done,rcnt,maxd)//,buffer_ready)
	case(current_state)
	IDLE: 
		if(enable) 
			next_state = READ;
		else 
			next_state = IDLE;
	READ: 
		//if(buffer_ready)
			next_state = SEPARATE;
		//else
		//	next_state = READ;
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
	    if(~sw)
		  row_count <= 9'b0;
		else
		  row_count <= 9'd144;
		col_count <= 9'b0;
		dcnt <= 9'b0;
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
		if(ccnt <= (t_maxc-t_minc) && rcnt <= (maxr-minr)) // fully within template search bounds
			case(rcnt)
                 0:  template0[ccnt] <= ldata;
                 1:  template1[ccnt] <= ldata;
                 2:  template2[ccnt] <= ldata;
                 3:  template3[ccnt] <= ldata;
                 4:  template4[ccnt] <= ldata;
                 5:  template5[ccnt] <= ldata;
                 6:  template6[ccnt] <= ldata;
			 endcase
		else // outside tempate bounds
			case(rcnt)
                 0:  template0[ccnt] <= 8'h00;
                 1:  template1[ccnt] <= 8'h00;
                 2:  template2[ccnt] <= 8'h00;
                 3:  template3[ccnt] <= 8'h00;
                 4:  template4[ccnt] <= 8'h00;
                 5:  template5[ccnt] <= 8'h00;
                 6:  template6[ccnt] <= 8'h00;
             endcase
			
		// read in search image block
		if(ccnt <= (b_maxc-b_minc) && rcnt <= (maxr-minr)) // fully within template search bounds    
            case(rcnt)		
                0: block0[ccnt] <= rdata;
                1: block1[ccnt] <= rdata;
                2: block2[ccnt] <= rdata;
                3: block3[ccnt] <= rdata;
                4: block4[ccnt] <= rdata;
                5: block5[ccnt] <= rdata;
                6: block6[ccnt] <= rdata;
			endcase
		else // outside tempate bounds
			case(rcnt)		
                0: block0[ccnt] <= 8'h00;
                1: block1[ccnt] <= 8'h00;
                2: block2[ccnt] <= 8'h00;
                3: block3[ccnt] <= 8'h00;
                4: block4[ccnt] <= 8'h00;
                5: block5[ccnt] <= 8'h00;
                6: block6[ccnt] <= 8'h00;
            endcase

		// increment ccnt and rcnt to iterate through all pixels within blocks
		if(pipe == 2'b11) begin
		    pipe <= 2'b00;
            if(ccnt<(BLOCK_SIZE0))
                ccnt<=ccnt+1'b1;
            else if(rcnt<(BLOCK_SIZE0) && ccnt==(BLOCK_SIZE0)) begin
                rcnt <= rcnt+1'b1;
                ccnt <= 3'b0;
            end
		end
		else
		  pipe <= pipe + 1'b1;
		  
		// make sure pipe is clear for SAD
		if(next_state == SAD)begin
			pipe <= 2'b00;
			ccnt <= 3'b0;
			rcnt <= 9'b0;
			cdcnt <= 3'b0;
			rdcnt <= 3'b0;
		end
	end
	
	SAD:
	begin
    	// ~~~~~~~~~~~~~~~~ abs(template-block) ~~~~~~~~~~~~~~~~ 
		if (pipe == 2'b00) begin
			if(template0[ccnt]>block0[ccnt])
				SAD_diffs0[ccnt] <= template0[ccnt] - block0[ccnt];
			else
				SAD_diffs0[ccnt] <= block0[ccnt] - template0[ccnt];
		    
		    if(template1[ccnt]>block1[ccnt])
                SAD_diffs1[ccnt] <= template1[ccnt] - block1[ccnt];
            else
                SAD_diffs1[ccnt] <= block1[ccnt] - template1[ccnt];
            
            if(template2[ccnt]>block2[ccnt])
                SAD_diffs2[ccnt] <= template2[ccnt] - block2[ccnt];
            else
                SAD_diffs2[ccnt] <= block2[ccnt] - template2[ccnt];
            
            if(template3[ccnt]>block3[ccnt])
                SAD_diffs3[ccnt] <= template3[ccnt] - block3[ccnt];
            else
                SAD_diffs3[ccnt] <= block3[ccnt] - template3[ccnt];
                
            if(template4[ccnt]>block4[ccnt])
                SAD_diffs4[ccnt] <= template4[ccnt] - block4[ccnt];
            else
                SAD_diffs4[ccnt] <= block4[ccnt] - template4[ccnt];
            
            if(template5[ccnt]>block5[ccnt])
                SAD_diffs5[ccnt] <= template5[ccnt] - block5[ccnt];
            else
                SAD_diffs5[ccnt] <= block5[ccnt] - template5[ccnt];
            
            if(template6[ccnt]>block6[ccnt])
                SAD_diffs6[ccnt] <= template6[ccnt] - block6[ccnt];
            else
                SAD_diffs6[ccnt] <= block6[ccnt] - template6[ccnt];
               

			if(ccnt<(BLOCK_SIZE0))
				ccnt<=ccnt+1'b1;
			else  // ccnt == (BLOCK_SIZE-1) && rcnt == (BLOCK_SIZE-1)
				pipe <= 2'b01;
		end
		
		// ~~~~~~~~~~~~~~~~ sum(abs(template-block)) ~~~~~~~~~~~~~~~~ 
		//if (rcnt>1'b1 && pipe < 2'b10) begin // pipeline things
		if(pipe == 2'b01) begin
			if(cdcnt < BLOCK_SIZE) begin // 0 .. block_size-1
                case(rdcnt)
                    0: temp0 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
                    1: temp1 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
                    2: temp2 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
                    3: temp3 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
                    4: temp4 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
                    5: temp5 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
                    6: temp6 <= SAD_diffs0[cdcnt] + SAD_diffs1[cdcnt] + SAD_diffs2[cdcnt] + SAD_diffs3[cdcnt] + SAD_diffs4[cdcnt] + SAD_diffs5[cdcnt] + SAD_diffs6[cdcnt];
			    endcase
			end else begin// avg accross block width when one sum is done 
			    case(rdcnt)
                    0: temp0 <= (temp0/BLOCK_SIZE);
                    1: temp1 <= (temp1/BLOCK_SIZE);
                    2: temp2 <= (temp2/BLOCK_SIZE);
                    3: temp3 <= (temp3/BLOCK_SIZE);
                    4: temp4 <= (temp4/BLOCK_SIZE);
                    5: temp5 <= (temp5/BLOCK_SIZE);
                    6: temp6 <= (temp6/BLOCK_SIZE);
				endcase
		    end
			
			if(cdcnt<BLOCK_SIZE) // 0 .. block_size
				cdcnt<=cdcnt+1'b1;
		    else if(cdcnt == BLOCK_SIZE && rdcnt < BLOCK_SIZE0) begin
		        rdcnt <= rdcnt + 1'b1;
		        cdcnt <= 0;
			end else begin// ccnt == (BLOCK_SIZE) && rcnt == (BLOCK_SIZE-1)
				pipe <= 2'b10;
				ccnt <= 3'b0;
				rcnt <= 9'b0;
				cdcnt <= 3'b0;
				rdcnt <= 3'b0;
			end
		end
		
		// ~~~~~~~~~~~~~~~~ sum(sum(abs(template-block))) ~~~~~~~~~~~~~~~~ 
		if (pipe == 2'b10) begin // pipe = 2'b10
			if(ccnt<3'b001) begin
				SAD_vector[blockIndex] <= temp0+temp1+temp2+temp3+temp4+temp5+temp6;
				ccnt <= ccnt + 1'b1;
			end
			else begin
				SAD_vector[blockIndex] <= SAD_vector[blockIndex]/(BLOCK_SIZE);
				ccnt <= 3'b0;
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
			else if (~sw && col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count < HEIGHT) begin
					row_count <= row_count + 1'b1;
					col_count <= 9'b0;
			end
			if(~sw && col_count == (WIDTH-(HALF_BLOCK+1'b1)) && row_count == HEIGHT)
			   done <= 1'b1;
			else if (sw && col_count == (WIDTH-(HALF_BLOCK+1'b1)))
			   done <= 1'b1;    
			else
			   done <= 1'b0;
		end 
		if (next_state == SEPARATE) begin
			ccnt <= 3'b0;
			rcnt <= 9'b0;
			cdcnt <= 3'b0;
			rdcnt <= 3'b0;
			pipe <= 2'b00;
		end
	end
	
	FINALIZE:
	begin
		dcnt <= 9'b0;
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
            if(sw == 1'b0)
                result_data <= index;
            else
                if(index > 0 && pipe > 2'b00) // && col_count[1:0] == 2'b00
                    line[col_count[8:2]] <= line[col_count[8:2]] + ((FB/index)>>2);
                else if (index > 0)
                    line[col_count[8:2]] <= (FB/index) >> 2;
                else
                    line[col_count[8:2]] <= 8'h00;
            
            pipe <= pipe + 1'b1; // was 2'b11, changed to add a little extra time
		end
	end
endcase
        
always @(lineaddr)
    lineout = line[lineaddr];

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
		minr = (0 > $signed(row_count - HALF_BLOCK)) ? 9'b0 : (row_count - HALF_BLOCK);
		maxr = ((HEIGHT) < (row_count + HALF_BLOCK)) ? HEIGHT : (row_count + HALF_BLOCK);
		t_minc = (0 > $signed(col_count - HALF_BLOCK)) ? 9'b0 : (col_count - HALF_BLOCK);
		t_maxc = ((WIDTH) < (col_count + HALF_BLOCK)) ? WIDTH : (col_count + HALF_BLOCK);
		b_minc =(0 > $signed(dcnt - HALF_BLOCK+col_count)) ? 9'b0 : (dcnt - HALF_BLOCK + col_count);
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

// current state indicator LED
assign state_LED = current_state;

endmodule

