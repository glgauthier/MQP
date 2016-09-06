//-----------------------------------------------------------------------------
// (c) Copyright 2012 - 2013 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and 
//  international copyright and other intellectual property
//  laws.
//  
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//  
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//  
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
// Filename:       axi_traffic_gen_v2_0_10_slvram_v7.v
// Version : v1.0
// Description:    RAM instantiation.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_slvram_v7 #(
  parameter C_FAMILY    = "virtex7" ,
  parameter C_DATAWIDTH = 64        ,
  parameter C_SIZE      = 1024      ,
  parameter C_ADDR_WIDTH= 10        ,
  parameter C_INITRAM_F = "NONE"     
        
) (
input                      clk_a    ,
input  [C_DATAWIDTH/8-1:0] we_a     ,
input  [C_ADDR_WIDTH-1:0]  addr_a   ,
input  [C_DATAWIDTH-1:0]   wr_data_a,
output [C_DATAWIDTH-1:0]   rd_data_a,

input                      clk_b    ,
input  [C_DATAWIDTH/8-1:0] we_b     ,
input  [C_ADDR_WIDTH-1:0]  addr_b   ,
input  [C_DATAWIDTH-1:0]   wr_data_b,
output [C_DATAWIDTH-1:0]   rd_data_b
);


//generate
//if(C_DATAWIDTH == 32) begin: ram32b

axi_traffic_gen_v2_0_10_inferram #(
    .C_FAMILY   (C_FAMILY     ),
    .C_RAMINIT_F(C_INITRAM_F  ),
    .SIZE       (C_SIZE       ),    
    .ADDR_WIDTH (C_ADDR_WIDTH ),    
    .NB_COL     (C_DATAWIDTH/8),
    .COL_WIDTH  (8            ),
    .INFER_TYPE (1            ) 
) ram0 (
   .clk(clk_a),
   .wea(we_a),
   .web(we_b),
   .addra(addr_a),
   .addrb(addr_b),	 
   .dia(wr_data_a),
   .dib(wr_data_b),	 
   .doa(rd_data_a),
   .dob(rd_data_b)
);

//end // block: ram32b    
//endgenerate


//generate
//if(C_DATAWIDTH == 64) begin: ram64b
//axi_traffic_gen_v2_0_10_inferram #(
//    .C_FAMILY   (C_FAMILY   ),
//    .C_RAMINIT_F(C_INITRAM_F),
//    .NB_COL     (8          ),
//    .COL_WIDTH  (8          ),
//    .INFER_TYPE (1          )
//		     )
//   ram0 (
//	 .clk(clk_a),
//	 .wea(we_a),
//	 .web(we_b),
//	 .addra(addr_a),
//	 .addrb(addr_b),	 
//	 .dia(wr_data_a),
//	 .dib(wr_data_b),	 
//	 .doa(rd_data_a),
//	 .dob(rd_data_b)
//	 );
//
//end // block: ram64b    
//endgenerate

 
   
/*

generate
if(C_DATAWIDTH == 32) begin: ram32b

RAMB36 #(

                  `RAMB_INIT0
         .INIT_FILE    (C_INITRAM_F  ),
	 .SIM_COLLISION_CHECK("NONE"),
	 .WRITE_MODE_A("WRITE_FIRST"),
	 .WRITE_MODE_B("WRITE_FIRST"),
         .READ_WIDTH_A (36           ),
         .READ_WIDTH_B (36           ),
         .WRITE_WIDTH_A(36           ),
         .WRITE_WIDTH_B(36           ),         
         .INIT_A       (36'h000000000), 
         .INIT_B       (36'h000000000), 
         .SRVAL_A      ('h0          ),
         .SRVAL_B      ('h0          )
        )
        ramb36i (
        .CLKA  (clk_a             ),
        .ADDRA ({1'b0,addr_a,5'h0}),
        .ENA   (1'b1              ),
        .REGCEA(1'b0              ),
        .WEA   (we_a[3:0]         ),
        .SSRA  (1'b0              ),
        .DOA   (rd_data_a[31:0]   ),
        .DIA   (wr_data_a[31:0]   ),
        .DIPA  (4'b0              ),
                 
        .CLKB  (clk_b             ),
        .ADDRB ({1'b0,addr_b,5'h0}),
        .ENB   (1'b1              ),
        .REGCEB(1'b0              ),
        .WEB   (we_b[3:0]         ),
        .SSRB  (1'b0              ),
        .DOB   (rd_data_b[31:0]   ),
        .DIB   (wr_data_b[31:0]   ),
        .DIPB  (4'b0              )

);

end // block: ram32b    
endgenerate


generate
if(C_DATAWIDTH == 64) begin: ram64b

RAMB36 #(
                  `RAMB_INIT0
         .INIT_FILE    (C_INITRAM_F  ),
	 .SIM_COLLISION_CHECK("NONE"),
	 .WRITE_MODE_A("WRITE_FIRST"),
	 .WRITE_MODE_B("WRITE_FIRST"),
         .READ_WIDTH_A (36           ),
         .READ_WIDTH_B (36           ),
         .WRITE_WIDTH_A(36           ),
         .WRITE_WIDTH_B(36           ),        
         .INIT_A       (36'h000000000), 
         .INIT_B       (36'h000000000), 
         .SRVAL_A      ('h0          ),
         .SRVAL_B      ('h0          )
        )
        ramb36i (
        .CLKA  (clk_a             ),
        .ADDRA ({1'b0,addr_a,5'h0}),
        .ENA   (1'b1              ),
        .REGCEA(1'b0              ),
        .WEA   (we_a[3:0]         ),
        .SSRA  (1'b0              ),
        .DOA   (rd_data_a[31:0]   ),
        .DIA   (wr_data_a[31:0]   ),
        .DIPA  (4'b0              ),
                 
        .CLKB  (clk_b             ),
        .ADDRB ({1'b0,addr_b,5'h0}),
        .ENB   (1'b1              ),
        .REGCEB(1'b0              ),
        .WEB   (we_b[3:0]         ),
        .SSRB  (1'b0              ),
        .DOB   (rd_data_b[31:0]   ),
        .DIB   (wr_data_b[31:0]   ),
        .DIPB  (4'b0              )

);

   
RAMB36 #(
         `RAMB_INIT0
         .INIT_FILE    (C_INITRAM_F  ),         
	 .SIM_COLLISION_CHECK("NONE"),
	 .WRITE_MODE_A("WRITE_FIRST"),
	 .WRITE_MODE_B("WRITE_FIRST"),
         .READ_WIDTH_A (36           ),
         .READ_WIDTH_B (36           ),
         .WRITE_WIDTH_A(36           ),
         .WRITE_WIDTH_B(36           ),         
         .INIT_A       (36'h000000000), 
         .INIT_B       (36'h000000000), 
         .SRVAL_A      ('h0          ),
         .SRVAL_B      ('h0          )
        )
        ramb36ii (
        .CLKA  (clk_a              ),
        .ADDRA ({1'b0, addr_a,5'h0}),
        .ENA   (1'b1               ),
        .REGCEA(1'b0               ),
        .WEA   (we_a[7:4]          ),
        .SSRA  (1'b0               ),
        .DOA   (rd_data_a[63:32]   ),
        .DIA   (wr_data_a[63:32]   ),
        .DIPA  (4'b0               ),
                 
        .CLKB  (clk_b              ),
        .ADDRB ({1'b0,addr_b,5'h0} ),
        .ENB   (1'b1               ),
        .REGCEB(1'b0               ),
        .WEB   (we_b[7:4]          ),
        .SSRB  (1'b0               ),
        .DOB   (rd_data_b[63:32]   ),
        .DIB   (wr_data_b[63:32]   ),
        .DIPB  (4'b0               )

                 
);

end // block: ram64b    
endgenerate
*/




endmodule
