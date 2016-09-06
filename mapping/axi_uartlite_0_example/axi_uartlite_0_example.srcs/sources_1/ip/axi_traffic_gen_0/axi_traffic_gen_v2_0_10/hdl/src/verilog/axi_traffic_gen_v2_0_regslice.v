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
// Filename:       axi_traffic_gen_v2_0_10_regslice.v
// Version : v1.0
// Description:    To add registers slices to improve timing based on the 
//                 paramters passed.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------


// grahams : adding 
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_regslice
  #(
    parameter DWIDTH    = 64, 
    parameter IDWIDTH   = 64,     
    parameter DATADEPTH = 3 , 
    parameter IDDEPTH   = 2
    )
   (
    input  [DWIDTH-1:0 ]  din         ,
    output [DWIDTH-1:0 ]  dout        ,
    output [DWIDTH-1:0 ]  dout_early  , 
    input  [IDWIDTH-1:0]  idin        ,
    output [IDWIDTH-1:0]  idout       ,
    output                id_stable   ,
    output reg            id_stable_ff,
    output                data_stable , 
    input                 clk         ,
    input                 reset
    );
(* max_fanout = 500 *) wire reset_reg;
assign reset_reg = reset;

   reg [DWIDTH-1:0]          datapath [0:DATADEPTH-1];   
   reg [IDWIDTH-1:0]          idpath [0:IDDEPTH-1];
   reg [DATADEPTH-1:0]          din_newpath  ;
   reg [IDDEPTH-1:0]          idin_newpath  ;   
   
     
   integer                  ix;




   wire din_new  =  (din   != datapath[DATADEPTH-1]);
   wire idin_new =  (idin  != idpath[IDDEPTH-1]);  
   
   always @(posedge clk)
     begin

        if(reset_reg)
          begin             
             for(ix = 0; ix <DATADEPTH ; ix = ix + 1)
               datapath[ix] <= 0;
             
             for(ix = 0; ix <IDDEPTH ; ix = ix + 1)
               idpath[ix] <= 0;
             
             idin_newpath <= 0;
             din_newpath  <= 0;
                         
          end
        else
          begin             
             
             datapath[DATADEPTH-1]      <= din;
             idpath[IDDEPTH-1]          <= idin;
             din_newpath[DATADEPTH-1]   <= din_new;
             idin_newpath[IDDEPTH-1]    <= idin_new;
             
             for(ix = 0; ix <DATADEPTH-1 ; ix = ix + 1)
               datapath[ix] <= datapath[ix+1];

             for(ix = 0; ix <DATADEPTH-1 ; ix = ix + 1)
               din_newpath[ix] <= din_newpath[ix+1];
                                     
             for(ix = 0; ix <IDDEPTH-1 ; ix = ix + 1)
               idpath[ix] <= idpath[ix+1];

             for(ix = 0; ix <IDDEPTH-1 ; ix = ix + 1)
               idin_newpath[ix] <= idin_newpath[ix+1];

             id_stable_ff <= id_stable;
                          
          end

        
     end // always @ (posedge clk)

   generate
      if (DATADEPTH > 1) begin : g1
         assign dout_early        = datapath[1];
      end else begin : g2
         assign dout_early        = 0;      
      end              
   endgenerate
   
   
   assign dout              = datapath[0];
   assign idout             = idpath[0];
   assign id_stable         = (idin_newpath == 0) && (idin_new==0);
   assign data_stable       = (din_newpath == 0) &&  (din_newpath == 0);   

endmodule
