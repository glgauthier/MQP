`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module for reading from the AL422b FIFO and storing pixel line data in a 
// local buffer.
//////////////////////////////////////////////////////////////////////////////////
module imgbuf(
    input get_data, // trigger a new image capture
	input [16:0] laddr, // left camera bram read address: (640*vcount)+hcount
	input [16:0] raddr, // right camera bram read address: (640*vcount)+hcount 
	output [7:0] ldata, // left camera bram data
	output [7:0] rdata, // right camera bram data
	input [7:0] fifo_data, // 8 bit data in from fifo
	input fifo_rck, // AL422B FIFO read clock (~5MHz)
	input bram_rck, // bram read clock 
    output reg image_sel, // left/right camera select
	output reg fifo_rrst, // fifo read reset (reset read addr pointer to 0)
	output reg fifo_oe, // fifo output enable (allow for addr pointer to increment)
	output reg trigger, // MT9V034 camera trigger
	output reg buffer_ready // camera capture and storage sequence complete
   );

// left and right image bram write enables
reg wen_l, wen_r; 

// FSM states
parameter [1:0] ready = 2'b00;
parameter [1:0] read = 2'b01;
parameter [1:0] done = 2'b10;  
parameter [1:0] init = 2'b11;
reg [1:0] state = ready;
reg [1:0] prev_state, next_state = ready;

// number of pixels and horizontal lines read by the image buffer
reg [9:0] pixel = 10'b00_0000_0000;
reg [15:0] num_lines = 16'h0000;

// left bram write address (windowed to 384x288)
reg [16:0] lwrite;
always @(num_lines,pixel)
    if(128 <= pixel && pixel <= 512 && num_lines >= 96 && num_lines <= 384) 
        lwrite = (384*(num_lines-96))+(pixel-128);
    else
        lwrite = 17'd0;

// right bram write address (windowed to 384x288)
reg [16:0] rwrite;
always @(num_lines,pixel)
    if(128 <= pixel && pixel <= 512 && num_lines >= 96 && num_lines <= 384) 
        rwrite = (384*(num_lines-96))+(pixel-128);
    else
        rwrite = 17'd0;
        
// left image storage
wire [7:0] left_dout;
blk_mem_384_288 left(
    .clka(fifo_rck),
    .wea(wen_l),
    .addra(lwrite), // 19 bits
    .dina(fifo_data), // 8 bits
    .clkb(bram_rck), 
    .enb(1'b1),
    .addrb(laddr), // 19 bits
    .doutb(ldata) // 8 bits
);

// right image storage
wire [7:0] right_dout;
blk_mem_384_288 right(
    .clka(fifo_rck),
    .wea(wen_r),
    .addra(rwrite), // 19 bits
    .dina(fifo_data), // 8 bits
    .clkb(bram_rck), 
    .enb(1'b1),
    .addrb(raddr), // 19 bits
    .doutb(rdata) // 8 bits
);

// FSM overhead control
always @(posedge fifo_rck)
	state <= next_state;

// next_state logic
always @(state,get_data,num_lines,image_sel)	
	case(state)
		ready: // ready: wait for a new trigger sequence
			begin
				if(get_data) 
					next_state = init;
				else
					next_state = ready;
					
				prev_state = ready;
			end
		init: // initialize and proceed to reading from AL422B
			begin
				next_state = read;
				prev_state = init;
			end
		read: // read from AL422B into left or right image buffer
			begin
				if(num_lines == 479 && image_sel == 1'b1)
					next_state = done;
				else
					next_state = read;
					
				prev_state = read;
			end
		done: // finished a full AL422B read sequence
			begin
			    next_state = ready;
				prev_state = done;
			end
	endcase

// FSM internal logic
always @(posedge fifo_rck)
begin
    case(state)
        // allow for VGA controller to read from pixel_line
		ready:
		    begin 
		    buffer_ready <= 1'b0;
		    wen_l <= 1'b0;
		    wen_r <= 1'b0;
		    pixel <= 10'b00_0000_000;
            num_lines <= 16'h0000;
            // trigger a new image capture from the cameras
			if(next_state == init) 
			   trigger <= 1'b1;
			end
	   // prepare to read new data from the AL422 into local memory
		init: 
			begin
			fifo_rrst <= 1'b0; // allow for read addr to increment
			trigger <= 1'b0;
			pixel <= 10'b00_0000_000;
		    num_lines <= 16'h0000;
			buffer_ready <= 1'b0;
			fifo_oe <= 1'b0; // reset read pointer for next run
			image_sel <= 1'b0;
		end
		// read data in from the AL422 into local memory
		read: 
			begin
		    trigger <= 1'b0;
		    fifo_rrst <= 1'b1; // allow read pointer to increment
		    // truncate 752x480 image to CIF (384x288)
		    if(128<=pixel && pixel <= 512 && num_lines >= 96 && num_lines <= 384) begin
		      if(image_sel == 1'b0) begin
		          wen_l <= 1'b1;
		          wen_r <= 1'b0;
		          end
		      else begin
		          wen_l <= 1'b0;
                  wen_r <= 1'b1;
		          end
		      end
		    else begin
		      wen_l <= 1'b0;
              wen_r <= 1'b0;
		      end
		    
		    // turn off read enable if at end of read sequence
			if(next_state == done)
				fifo_oe <= 1'b1; 
			// cycle through pixel count
			else if(pixel < 751) 
				pixel <= pixel + 1'b1;
			else if(num_lines < 479)
				begin
				pixel <= 10'b00_0000_0000;
				num_lines <= num_lines + 1'b1;
				end
			// cycle from left -> right image
		    else if(num_lines == 479 && image_sel == 1'b0)
		       begin
		       fifo_rrst <= 1'b0; // reset read pointer
		       image_sel <= 1'b1;
		       pixel <= 10'b00_0000_0000;
		       num_lines <= 16'd0;
		       end
            end
     
		// close out read sequence before returning to ready state
		done:
			begin
			fifo_rrst <= 1'b0; // reset read addr to 0
			trigger <= 1'b0;
			buffer_ready <= 1'b1;
			end
		endcase
end 	
		
endmodule

