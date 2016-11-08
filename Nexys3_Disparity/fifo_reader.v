`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module for reading from the AL422b FIFO and storing pixel line data in a 
// local buffer.
//////////////////////////////////////////////////////////////////////////////////
module dual_image_buffer(
	input [10:0] href, // 0->(xmax-xmin), ideally 0-751
	input [10:0] vref, // 0->(ymax-ymin), ideally 0-479
	input blank,
	input [7:0] fifo_data, // 8 bit data in from fifo
	input fifo_rck, // Fifo read clock signal (1-5MHz for VGA/MCS)
	//input get_data, // enable a new read sequence (trigger)
	input image_sel, // left/right image data out
   output buffer_ready, // indicate that buffer has been filled
	output fifo_rrst1, // fifo read reset (reset read addr pointer to 0)
	output fifo_rden1, // fifo output enable (allow for addr pointer to increment)
	output fifo_rrst2, // fifo read reset (reset read addr pointer to 0)
	output fifo_rden2, // fifo output enable (allow for addr pointer to increment)
	output reg [7:0] pixel_value, // 8-bit value from internal buffer
	output reg trigger
   );

reg get_data; //internalized for VGA test, remove later and make input

// control lines connected to both camera rrst and rden lines based FSM sequence
reg fifo_rrst, fifo_rden;

// FSM states and controls
parameter [1:0] ready = 2'b00;
parameter [1:0] read = 2'b01;
parameter [1:0] done = 2'b10;  
parameter [1:0] init = 2'b11;
reg [1:0] state = ready;
reg [1:0] prev_state, next_state = ready;

// indicator that both camera images have been read in
reg [1:0] read_done;

// left and right image buffers (BRAM)
// NOTE: Index value(s) does not match array range for signal warnings
//		are due to the fact that the compiler doesn't know that my calculated
//		array indexes will fall in the right range.
reg [7:0] left_image [0:29][0:45]; 
reg [7:0] right_image [0:29][0:45];

// windowing constraints
parameter xmin = 329, xmax = 421;
parameter ymin = 209, ymax = 269;

// horizontal pixel count (0-751)
reg [9:0] pixel = 10'b00_0000_0000; 
// vertical pixel count (0-479)
reg [15:0] num_lines = 16'h0000; 

always @(posedge fifo_rck)
	state <= next_state;
	
always @(state,get_data,num_lines,pixel,read_done)	
	case(state)
		ready: 
			begin
				if(get_data || (read_done < 2'b10)) 
				begin
					trigger = 1'b0;
					next_state = init;
				end
				else
					next_state = ready;
					
				prev_state = ready;
			end
		init: 
			begin
				next_state = read;
				prev_state = init;
			end
		read: 
			begin
				if(num_lines == 280) // was pixel == 751
					next_state = done;
				else
					next_state = read;
					
				prev_state = read;
			end
		done: 
			begin
				next_state = ready;
				prev_state = done;
				trigger = 1'b1;
			end
	endcase

always @(posedge fifo_rck)
begin
		if(state==ready) // allow for MCS to read from pixel_line
			begin
			fifo_rrst <= 1'b1; // make sure read addr doesn't get reset
			end
		else if(state == init) // prepare to read new data from the AL422 into pixel_line
			begin
			if(read_done == 2'b10) // reset read_done if initiated by get_data (new sequence)
				read_done <= 2'b00;
			pixel <= 10'b00_0000_000;
			fifo_rden <= 1'b0; // allow for read pointer to increment
			end
		else if(state == read) // read data in from the AL422
			begin
			if(next_state == done)
				fifo_rden <= 1'b1; // turn off read enable
			
			if((prev_state != init) && (pixel < 751)) // one cycle delay between init and valid data
				// store image data in the temporary buffer if 
				if((pixel>=xmin && pixel <= xmax) && (num_lines >= ymin && num_lines <= ymax)) 
				begin
					if(read_done == 2'b00)
						left_image[(num_lines-xmin)][(pixel-ymin)] <= fifo_data;
					else
						right_image[(num_lines-xmin)][(pixel-ymin)] <= fifo_data;
					
					pixel <= pixel + 1'b1;
				end
				else
					pixel <= pixel + 1'b1;
			else if(prev_state != init)
				begin
				pixel <= 10'b00_0000_0000;
				num_lines <= num_lines + 1'b1;
				end
			end
		else if(state == done)
			begin
			fifo_rrst <= 1'b0;
			num_lines <= 16'h0000;
			read_done <= read_done + 1'b1;
			end
end

// indicate that the buffer is ready to be read from once both images have been stored
assign buffer_ready = (read_done >= 2'b10);

// allow for MCS to read stored pixel line at given addr if state==ready
always @ (buffer_ready, href, vref, blank, pixel_value)
begin
	if(blank)
		pixel_value [7:0] = 8'h00;
	else if ((274 <= href && href <= 319) && (209 <= vref && vref <= 239)) // && buffer_ready
		pixel_value [7:0] = left_image[vref-209][href-274]; // [vref-209][href-274]
	else if ((320 <= href && href <= 366) && (209 <= vref && vref <= 239)) // && buffer_ready
		pixel_value [7:0] = right_image[vref-209][href-320];
	else 
		pixel_value [7:0] = 8'h00;
		
	if (href == 600 && vref == 300)
		get_data = 1'b1;
	else 
		get_data = 1'b0;
end

// select the proper camera output based on the current sequence of the FSM
assign fifo_rrst1 = (read_done == 2'b00 ? fifo_rrst : 1'b1);
assign fifo_rrst2 = (read_done == 2'b01 ? fifo_rrst : 1'b1);
assign fifo_rden1 = (read_done == 2'b00 ? fifo_rden : 1'b1);
assign fifo_rden2 = (read_done == 2'b01 ? fifo_rden : 1'b1);

endmodule