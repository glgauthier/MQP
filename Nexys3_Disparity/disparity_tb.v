`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:28 11/06/2016
// Design Name:   disparity
// Module Name:   C:/Users/georges/Documents/GitHub/MQP/Nexys3_Disparity/disparity_tb.v
// Project Name:  Nexys3_Disparity
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: disparity
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module disparity_tb;

	parameter WIDTH = 20;
	parameter HEIGHT = 7;
	parameter [2:0] READ = 3'b001, // read data from FIFO
					 SEPARATE = 3'b010, // separate search image into rows
					 SAD = 3'b011, // perfom sum of absolute diff's
					 FINALIZE = 3'b100, // search for max vector values, store in disparity matrix
					 IDLE = 3'b000; // wait for next read sequence
	reg [2:0] prev_state = IDLE;
	reg [7:0] left_vec [0:(WIDTH*HEIGHT)];
	reg [7:0] right_vec [0:(WIDTH*HEIGHT)];
	
	// Inputs
	reg clk;
	reg enable;
	reg reset;
	reg [7:0] image_data;
	reg buffer_ready;
	reg [9:0] disp_href, disp_vref;

	// Outputs
	wire [40:0] new_image;
	wire [9:0] buffer_href;
	wire [9:0] buffer_vref;
	wire image_sel;
	wire idle;
	wire [2:0] state_LED;
	wire [9:0] minr, maxr, t_minc, t_maxc, b_minc, b_maxc, mind,maxd,numBlocks;
	wire [9:0] rcnt, ccnt, dcnt, cdcnt,rdcnt,scnt;

	// Instantiate the Unit Under Test (UUT)
	disparity uut (
		.clk(clk), 
		.enable(enable), 
		.reset(reset), 
		.image_data(image_data), 
		.buffer_ready(buffer_ready),
		.disp_href(disp_href),
		.disp_vref(disp_vref),		
		.new_image(new_image), 
		.buffer_href(buffer_href), 
		.buffer_vref(buffer_vref), 
		.image_sel(image_sel), 
		.idle(idle),
		.state_LED(state_LED),
		.minr(minr), .maxr(maxr), .t_minc(t_minc), .t_maxc(t_maxc), .b_minc(b_minc),.b_maxc(b_maxc),.mind(mind),.maxd(maxd),.numBlocks(numBlocks),
		.rcnt(rcnt), .ccnt(ccnt), .dcnt(dcnt), .cdcnt(cdcnt),.rdcnt(rdcnt),.scnt(scnt)
		);

	always
	begin
		clk = 0;
		#5;
		clk = 1;
		#5;
	end

	integer i=0;
	
	always @(buffer_href, buffer_vref, image_sel)
	begin
		// these vals are 0 at start, so this is skipping left_vec[0]
		if(buffer_href == 0 && buffer_vref == 0 && ~image_sel)
			image_data = 8'hff;
		else if(~image_sel) // right image 
		begin
			image_data = left_vec[{(WIDTH*buffer_vref)+buffer_href}];
			//$display("sending left_img [%10d] with value %10d",{(WIDTH*buffer_vref)+buffer_href},image_data);
		end
		else // left image
			image_data = right_vec[{(WIDTH*buffer_vref)+buffer_href}];
	end
	   
	always @ (state_LED)
	begin
		case(state_LED)
		IDLE:begin
			if(prev_state == FINALIZE)
			$stop;
		end
		READ:begin
			prev_state = state_LED;
			//$display("Read");
		end
		SEPARATE:begin
			disp_href = 0;
			disp_vref = 2;
			prev_state = state_LED;
			//$display("Separate #%10d of %10d",dcnt,maxd);
		end
		SAD:begin
			disp_href = 2;
			disp_vref = 0;
			prev_state = state_LED;
			//$display("SAD for block (x,y) = (%10d:%10d,%10d:%10d)",b_minc,b_maxc,minr,maxr);
		end
		FINALIZE:begin
			//$display("FINALIZE #%10d",count);
		   prev_state = state_LED;
//			repeat(14) begin
//				#100;
//				i = i + 1'b1;
//			end
//			$display("SAD_value [%10d][%10d]= %10d",buffer_href,buffer_vref,image_data);
//			i = 0;
			//$stop;
		end
		endcase
	end
	
	initial begin
		// Initialize Inputs
		enable = 0;
		reset = 0;
		image_data = 0;
		buffer_ready = 1;
		disp_href = 0;
		disp_vref = 2;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		// setup input files
		$display("Reading files...");
      $readmemb("left_test.txt",left_vec);
		$readmemb("right_test.txt",right_vec);
		#100
		
		// Add stimulus here
		$display("FSM enabled");
		enable = 1;
		#10;
		enable = 0;
		
	end
      
endmodule

