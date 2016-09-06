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
// Filename:       axi_traffic_gen_v2_0_10_inferram.v
// Version : v1.0
// Description:    Generates address for the next beat in the transfer.
//                 used to index mstram to read/write data.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_inferram(clk, wea, web, addra, addrb, dia, dib, doa, dob);


   parameter C_FAMILY    = "virtex7";   
   parameter C_RAMINIT_F = "NONE";   
   parameter SIZE        = 1024;
   parameter ADDR_WIDTH  = 10;
   parameter COL_WIDTH   = 8;
   parameter NB_COL      = 4;
   parameter INFER_TYPE  = 0;  //0- Inferram template, 1- Blk_mem_gen_wrapper from proc_common.
   
   input                             clk; 
   input [NB_COL-1:0]                wea;
   input [NB_COL-1:0]                web;  
   input [ADDR_WIDTH-1:0]            addra;
   input [ADDR_WIDTH-1:0]            addrb;   
   input [NB_COL*COL_WIDTH-1:0]      dia;
   input [NB_COL*COL_WIDTH-1:0]      dib;   
   output [NB_COL*COL_WIDTH-1:0]     doa;
   output [NB_COL*COL_WIDTH-1:0]     dob;   
   
   reg [NB_COL*COL_WIDTH-1:0]        RAM [SIZE-1:0];
   
   integer k;
   
   
   
reg [NB_COL*COL_WIDTH-1:0]     doa_r;
reg [NB_COL*COL_WIDTH-1:0]     dob_r;   

generate if(INFER_TYPE == 0) begin : MEM_INFER_WR
   initial begin  
      if (C_RAMINIT_F == "NONE") begin    
        for (k=0; k<SIZE-1; k=k+1)   begin
          RAM[k] <= 0;
        end
      end else begin
        $readmemh(C_RAMINIT_F, RAM);
      end
   end // initial begin
   always @(posedge clk) begin 
     doa_r <= RAM[addra];
   end
  genvar i;
    for (i = 0; i < NB_COL; i = i+1) begin : ramwritea
      always @(posedge clk) begin  
        if (wea[i]) 
          RAM[addra][(i+1)*COL_WIDTH-1:i*COL_WIDTH]
      <= dia[(i+1)*COL_WIDTH-1:i*COL_WIDTH];
      end
    end
end
//NOTE:Un-commment if INFER-RAM is used
//assign doa = doa_r;
endgenerate

generate if(INFER_TYPE == 0) begin : MEM_INFER_RD
   always @(posedge clk) begin 
    dob_r <= RAM[addrb];     
   end
  genvar l;
    for (l = 0; l < NB_COL; l = l+1) begin : ramwriteb
      always @(posedge clk) begin  
        if (web[l]) 
          RAM[addrb][(l+1)*COL_WIDTH-1:l*COL_WIDTH]
          <= dib[(l+1)*COL_WIDTH-1:l*COL_WIDTH];
      end
    end
end
//NOTE:Un-commment if INFER-RAM is used
//assign dob = dob_r;
endgenerate



   task dumpRAM;
      input integer fileh;
      
      for (k=0; k<SIZE-1; k=k+1)   begin
        $fwrite(fileh,"%h\n",RAM[k]);
     end
   endtask



generate if(INFER_TYPE == 1) begin : MEM_INFER_BLK_MEM
   axi_traffic_gen_v2_0_10_bmg_wrap #(
       .c_family                 (C_FAMILY        ),
       .c_xdevicefamily          (C_FAMILY        ),
       .c_elaboration_dir        ("./"            ),
       .c_mem_type               (2               ),
       .c_algorithm              (1               ),
       .c_prim_type              (1               ),
       .c_byte_size              (8               ),
       .c_sim_collision_check    ("NONE"          ),
       .c_common_clk             (0               ),
       .c_disable_warn_bhv_coll  (0               ),
       .c_disable_warn_bhv_range (0               ),
       .c_load_init_file         (1               ),
       .c_init_file_name         (C_RAMINIT_F     ),
       .c_use_default_data       (1               ),
       .c_default_data           ("0"             ),
       .c_has_mem_output_regs_a  (0               ),
       .c_has_mux_output_regs_a  (0               ),
       .c_write_width_a          (NB_COL*COL_WIDTH),
       .c_read_width_a           (NB_COL*COL_WIDTH),
       .c_write_depth_a          (SIZE            ),
       .c_read_depth_a           (SIZE            ),
       .c_addra_width            (ADDR_WIDTH      ),
       .c_write_mode_a           ("READ_FIRST"    ),
       .c_has_ena                (0               ),
       .c_has_regcea             (0               ),
       .c_has_ssra               (0               ),
       .c_sinita_val             ("0"             ),
       .c_use_byte_wea           (1               ),
       .c_wea_width              (NB_COL          ),
       .c_has_mem_output_regs_b  (0               ),
       .c_has_mux_output_regs_b  (0               ),
       .c_write_width_b          (NB_COL*COL_WIDTH),
       .c_read_width_b           (NB_COL*COL_WIDTH),
       .c_write_depth_b          (SIZE            ),
       .c_read_depth_b           (SIZE            ),
       .c_addrb_width            (ADDR_WIDTH      ),
       .c_write_mode_b           ("READ_FIRST"    ),
       .c_has_enb                (0               ),
       .c_has_regceb             (0               ),
       .c_has_ssrb               (0               ),
       .c_sinitb_val             ("0"             ),
       .c_use_byte_web           (1               ),
       .c_web_width              (NB_COL          ),
       .c_mux_pipeline_stages    (0               ),
       .c_use_ecc                (0               ),
       .c_use_ramb16bwer_rst_bhv (0               ) 
       ) inst (
        .clka    (clk     ),
        .ssra    (1'b0    ),
        .ena     (1'b0    ),
        .regcea  (1'b0    ),
        .wea     (wea     ),
        .dina    (dia     ),
        .addra   (addra   ),
        .douta   (doa     ),
        .clkb    (clk     ),
        .ssrb    (1'b0    ),
        .enb     (1'b0    ),
        .regceb  (1'b0    ),
        .dinb    (dib     ),
        .addrb   (addrb   ),
        .web     (web     ),
        .doutb   (dob     ),
        .dbiterr (        ),
        .sbiterr (        ) 
       );
   //Direct-instance- blk_mem_gen_v8_0 #(
   //Direct-instance-   .C_FAMILY                   (C_FAMILY          ),
   //Direct-instance-   .C_XDEVICEFAMILY            (C_FAMILY          ),
   //Direct-instance-   .C_ELABORATION_DIR          ("./"               ),
   //Direct-instance-   .C_INTERFACE_TYPE           (0                  ),
   //Direct-instance-   .C_AXI_TYPE                 (1                  ),
   //Direct-instance-   .C_AXI_SLAVE_TYPE           (0                  ),
   //Direct-instance-   .C_HAS_AXI_ID               (0                  ),
   //Direct-instance-   .C_AXI_ID_WIDTH             (4                  ),
   //Direct-instance-   .C_MEM_TYPE                 (2                  ),
   //Direct-instance-   .C_BYTE_SIZE                (8                  ),
   //Direct-instance-   .C_ALGORITHM                (1                  ),
   //Direct-instance-   .C_PRIM_TYPE                (1                  ),
   //Direct-instance-   .C_LOAD_INIT_FILE           (1                  ),
   //Direct-instance-   .C_INIT_FILE_NAME           (C_RAMINIT_F        ),
   //Direct-instance-   .C_INIT_FILE                (""                 ),
   //Direct-instance-   .C_USE_DEFAULT_DATA         (1                  ),
   //Direct-instance-   .C_DEFAULT_DATA             ("0"                ),
   //Direct-instance-   .C_RST_TYPE                 ("SYNC"             ),
   //Direct-instance-   .C_HAS_RSTA                 (0                  ),
   //Direct-instance-   .C_RST_PRIORITY_A           ("CE"               ),
   //Direct-instance-   .C_RSTRAM_A                 (0                  ),
   //Direct-instance-   .C_INITA_VAL                ("0"                ),
   //Direct-instance-   .C_HAS_ENA                  (0                  ),
   //Direct-instance-   .C_HAS_REGCEA               (0                  ),
   //Direct-instance-   .C_USE_BYTE_WEA             (1                  ),
   //Direct-instance-   .C_WEA_WIDTH                (NB_COL             ),
   //Direct-instance-   .C_WRITE_MODE_A             ("WRITE_FIRST"      ),
   //Direct-instance-   .C_WRITE_WIDTH_A            (NB_COL*COL_WIDTH   ),
   //Direct-instance-   .C_READ_WIDTH_A             (NB_COL*COL_WIDTH   ),
   //Direct-instance-   .C_WRITE_DEPTH_A            (SIZE               ),
   //Direct-instance-   .C_READ_DEPTH_A             (SIZE               ),
   //Direct-instance-   .C_ADDRA_WIDTH              (ADDR_WIDTH         ),
   //Direct-instance-   .C_HAS_RSTB                 (0                  ),
   //Direct-instance-   .C_RST_PRIORITY_B           ("CE"               ),
   //Direct-instance-   .C_RSTRAM_B                 (0                  ),
   //Direct-instance-   .C_INITB_VAL                ("0"                ),
   //Direct-instance-   .C_HAS_ENB                  (0                  ),
   //Direct-instance-   .C_HAS_REGCEB               (0                  ),
   //Direct-instance-   .C_USE_BYTE_WEB             (1                  ),
   //Direct-instance-   .C_WEB_WIDTH                (NB_COL             ),
   //Direct-instance-   .C_WRITE_MODE_B             ("WRITE_FIRST"      ),
   //Direct-instance-   .C_WRITE_WIDTH_B            (NB_COL*COL_WIDTH   ),
   //Direct-instance-   .C_READ_WIDTH_B             (NB_COL*COL_WIDTH   ),
   //Direct-instance-   .C_WRITE_DEPTH_B            (SIZE               ),
   //Direct-instance-   .C_READ_DEPTH_B             (SIZE               ),
   //Direct-instance-   .C_ADDRB_WIDTH              (ADDR_WIDTH         ),
   //Direct-instance-   .C_HAS_MEM_OUTPUT_REGS_A    (0                  ),
   //Direct-instance-   .C_HAS_MEM_OUTPUT_REGS_B    (0                  ),
   //Direct-instance-   .C_HAS_MUX_OUTPUT_REGS_A    (0                  ),
   //Direct-instance-   .C_HAS_MUX_OUTPUT_REGS_B    (0                  ),
   //Direct-instance-   .C_MUX_PIPELINE_STAGES      (0                  ),
   //Direct-instance-   .C_HAS_SOFTECC_INPUT_REGS_A (0                  ),
   //Direct-instance-   .C_HAS_SOFTECC_OUTPUT_REGS_B(0                  ),
   //Direct-instance-   .C_USE_SOFTECC              (0                  ),
   //Direct-instance-   .C_USE_ECC                  (0                  ),
   //Direct-instance-   .C_HAS_INJECTERR            (0                  ),
   //Direct-instance-   .C_SIM_COLLISION_CHECK      ("ALL"              ),
   //Direct-instance-   .C_COMMON_CLK               (0                  ),
   //Direct-instance-   .C_ENABLE_32BIT_ADDRESS     (0                  ),
   //Direct-instance-   .C_DISABLE_WARN_BHV_COLL    (0                  ),
   //Direct-instance-   .C_DISABLE_WARN_BHV_RANGE   (0                  ),
   //Direct-instance-   .C_USE_BRAM_BLOCK           (0                  ),
   //Direct-instance-   .C_CTRL_ECC_ALGO            ("NONE"             )
   //Direct-instance- ) inst (
   //Direct-instance-   .clka               (clk  ),
   //Direct-instance-   .rsta               (1'B0 ),
   //Direct-instance-   .ena                (1'B0 ),
   //Direct-instance-   .regcea             (1'B0 ),
   //Direct-instance-   .wea                (wea  ),
   //Direct-instance-   .addra              (addra),
   //Direct-instance-   .dina               (dia  ),
   //Direct-instance-   .douta              (doa  ),
   //Direct-instance-   .clkb               (clk  ),
   //Direct-instance-   .rstb               (1'B0 ),
   //Direct-instance-   .enb                (1'B0 ),
   //Direct-instance-   .regceb             (1'B0 ),
   //Direct-instance-   .web                (web  ),
   //Direct-instance-   .addrb              (addrb),
   //Direct-instance-   .dinb               (dib  ),
   //Direct-instance-   .doutb              (dob  ),
   //Direct-instance-   .injectsbiterr      (1'B0 ),
   //Direct-instance-   .injectdbiterr      (1'B0 ),
   //Direct-instance-   .sbiterr            (     ),
   //Direct-instance-   .dbiterr            (     ),
   //Direct-instance-   .rdaddrecc          (     ),
   //Direct-instance-   .s_aclk             (1'B0 ),
   //Direct-instance-   .s_aresetn          (1'B0 ),
   //Direct-instance-   .s_axi_awid         (4'B0 ),
   //Direct-instance-   .s_axi_awaddr       (32'B0),
   //Direct-instance-   .s_axi_awlen        (8'B0 ),
   //Direct-instance-   .s_axi_awsize       (3'B0 ),
   //Direct-instance-   .s_axi_awburst      (2'B0 ),
   //Direct-instance-   .s_axi_awvalid      (1'B0 ),
   //Direct-instance-   .s_axi_awready      (     ),
   //Direct-instance-   .s_axi_wdata        (32'B0),
   //Direct-instance-   .s_axi_wstrb        (4'B0 ),
   //Direct-instance-   .s_axi_wlast        (1'B0 ),
   //Direct-instance-   .s_axi_wvalid       (1'B0 ),
   //Direct-instance-   .s_axi_wready       (     ),
   //Direct-instance-   .s_axi_bid          (     ),
   //Direct-instance-   .s_axi_bresp        (     ),
   //Direct-instance-   .s_axi_bvalid       (     ),
   //Direct-instance-   .s_axi_bready       (1'B0 ),
   //Direct-instance-   .s_axi_arid         (4'B0 ),
   //Direct-instance-   .s_axi_araddr       (32'B0),
   //Direct-instance-   .s_axi_arlen        (8'B0 ),
   //Direct-instance-   .s_axi_arsize       (3'B0 ),
   //Direct-instance-   .s_axi_arburst      (2'B0 ),
   //Direct-instance-   .s_axi_arvalid      (1'B0 ),
   //Direct-instance-   .s_axi_arready      (     ),
   //Direct-instance-   .s_axi_rid          (     ),
   //Direct-instance-   .s_axi_rdata        (     ),
   //Direct-instance-   .s_axi_rresp        (     ),
   //Direct-instance-   .s_axi_rlast        (     ),
   //Direct-instance-   .s_axi_rvalid       (     ),
   //Direct-instance-   .s_axi_rready       (1'B0 ),
   //Direct-instance-   .s_axi_injectsbiterr(1'B0 ),
   //Direct-instance-   .s_axi_injectdbiterr(1'B0 ),
   //Direct-instance-   .s_axi_sbiterr      (     ),
   //Direct-instance-   .s_axi_dbiterr      (     ),
   //Direct-instance-   .s_axi_rdaddrecc    (     )
   //Direct-instance- );
end
endgenerate
   
endmodule
