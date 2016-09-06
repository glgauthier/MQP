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
// Filename:       axi_traffic_gen_v2_0_10_static_mrdwr.v
// Version : v1.0
// Description:    master write channel: Issue write commands based on the
// cmdgen block output
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_static_mrdwr #
(
  parameter C_M_AXI_THREAD_ID_WIDTH    = 1               ,
  parameter C_M_AXI_AWUSER_WIDTH       = 8               ,
  parameter C_M_AXI_ARUSER_WIDTH       = 8               ,
  parameter C_M_AXI_ADDR_WIDTH         = 32              ,
  parameter C_ATG_STATIC_RD_ADDRESS    = 32'h12A0_0000   ,
  parameter C_ATG_STATIC_WR_ADDRESS    = 32'h13A0_0000   ,
  parameter C_ATG_STATIC_WR_HIGH_ADDRESS = 32'h12A0_0FFF ,
  parameter C_ATG_STATIC_RD_HIGH_ADDRESS = 32'h13A0_0FFF ,  
  parameter C_ATG_STATIC_INCR          = 0               ,
  parameter C_ATG_STATIC_EN_READ       = 1               ,
  parameter C_ATG_STATIC_EN_WRITE      = 1               ,
  parameter C_ATG_STATIC_LENGTH        = 5               ,
  parameter C_ATG_STATIC_RD_SELFTEST   = 0               ,
  parameter C_ATG_STATIC_RD_PIPELINE   = 1               ,
  parameter C_ATG_STATIC_WR_PIPELINE   = 1               ,
  parameter C_ATG_STATIC_FREE_RUN      = 1               ,
  parameter C_ATG_STATIC_TRANGAP       = 32'd255,
  parameter C_ATG_HLTP_MODE            = 0               , //0-Custom,1-High Level Traffic.
  parameter C_M_AXI_DATA_WIDTH         = 32 
) (
// system
 input                                Clk                           ,
 input                                rst_l                         ,
//aw
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] awid_m                        ,
 output [C_M_AXI_ADDR_WIDTH-1:0]      awaddr_m                      ,
 output [7:0]                         awlen_m                       ,
 output [2:0]                         awsize_m                      ,
 output [1:0]                         awburst_m                     ,
 output [0:0]                         awlock_m                      ,
 output [3:0]                         awcache_m                     ,
 output [2:0]                         awprot_m                      ,
 output [3:0]                         awqos_m                       ,
 output [C_M_AXI_AWUSER_WIDTH-1:0]    awuser_m                      ,
 output                               awvalid_m                     ,
 input                                awready_m                     ,
//w
 output                               wlast_m                       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      wdata_m                       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    wstrb_m                       ,
 output                               wvalid_m                      ,
 input                                wready_m                      ,
//b
 input [C_M_AXI_THREAD_ID_WIDTH-1:0]  bid_m                         ,
 input [1:0]                          bresp_m                       ,
 input                                bvalid_m                      ,
 output                               bready_m                      ,


//ar
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] arid_m                        ,
 output [C_M_AXI_ADDR_WIDTH-1:0]      araddr_m                      ,
 output [7:0]                         arlen_m                       ,
 output [2:0]                         arsize_m                      ,
 output [1:0]                         arburst_m                     ,
 output [0:0]                         arlock_m                      ,
 output [3:0]                         arcache_m                     ,
 output [2:0]                         arprot_m                      ,
 output [3:0]                         arqos_m                       ,
 output [C_M_AXI_ARUSER_WIDTH-1:0]    aruser_m                      ,
 output                               arvalid_m                     ,
 input                                arready_m                     ,
//r
 input [C_M_AXI_THREAD_ID_WIDTH-1:0]  rid_m                         ,
 input                                rlast_m                       ,
 input [C_M_AXI_DATA_WIDTH-1:0]       rdata_m                       ,
 input [1:0]                          rresp_m                       ,
 input                                rvalid_m                      ,
 output                               rready_m                      ,

//register module
 input                                reg1_st_enable                ,
 output                               reg1_done                     ,
 input                                reset_reg1_done               ,
 input                                reset_reg1_en                 ,
 input [7:0]                          reg2_length                   ,
 input                                reg2_length_req               ,
 output [31:0]                        reg3_rdcnt                    , 
 output [31:0]                        reg4_wrcnt                    , 
 output [31:0]                        reg5_glcnt 
 
);

//**********************Enabling ATG*************************

localparam C_ATG_STATIC_WR_HIGH_ADDRESS_C = C_ATG_STATIC_WR_HIGH_ADDRESS + 'h1;
localparam C_ATG_STATIC_RD_HIGH_ADDRESS_C = C_ATG_STATIC_RD_HIGH_ADDRESS + 'h1;
reg  st_en_reg1, st_en_reg2 ;
wire st_en_reg_edge         ;
wire st_dis_reg_edge        ;
reg [7:0] burst_len         ;
reg st_mode_active          ;

reg done                    ;

assign reg1_done = done;
reg [31:0] glcnt_reg;
wire glcnt_done ;
generate if(C_ATG_STATIC_FREE_RUN == 0) begin : ATG_MODE_STATIC_DEBUG_ON_CNT_DONE
  assign glcnt_done = &glcnt_reg;
end
endgenerate 
generate if(C_ATG_STATIC_FREE_RUN == 1) begin : ATG_MODE_STATIC_DEBUG_OFF_CNT_DONE
  assign glcnt_done = 1'b0;
end
endgenerate 

// Increment addres based on the burst length 

wire [8:0] bl_addr_incr = (C_M_AXI_DATA_WIDTH==32)  ? 9'h4 :
                          (C_M_AXI_DATA_WIDTH==64)  ? 9'h8 :
                          (C_M_AXI_DATA_WIDTH==128) ? 9'h10 :
                          (C_M_AXI_DATA_WIDTH==256) ? 9'h20 :9'h40;


always @(posedge Clk) begin
   
   if (~rst_l) begin
   st_en_reg1 <= 1'b0;
   st_en_reg2 <= 1'b0;
   end
   else begin
   st_en_reg1 <= reg1_st_enable;
   st_en_reg2 <= st_en_reg1;
   end
end

assign st_en_reg_edge = st_en_reg1 & ~st_en_reg2;
assign st_dis_reg_edge = ~st_en_reg1 & st_en_reg2;
reg stop_generation;
always @(posedge Clk) begin
   if (~rst_l) begin
     stop_generation <= 1'b0;
   end else if (st_en_reg_edge | reset_reg1_done) begin
     stop_generation <= 1'b0;
   end else if (st_dis_reg_edge) begin
     stop_generation <= 1'b1;
   end
end

always @(posedge Clk) begin
   if (~rst_l) begin
     burst_len <= C_ATG_STATIC_LENGTH-1;
   end
   else if (reg2_length_req) begin
     burst_len <= reg2_length;
   end
end
//*************************** Write Master standard signal assignement*******************************

reg                          awvalid_m_reg ; 
reg [C_M_AXI_ADDR_WIDTH-1:0] awaddr_m_reg  ;
reg [C_M_AXI_ADDR_WIDTH-1:0] awaddr_m_reg_incr;
reg [12:0]                   cmdw_addrincr_ff;
reg [C_M_AXI_ADDR_WIDTH-1:0] awaddr_nxt_chk;
reg [7:0]                    awlen_m_reg   ;
reg                          wlast_reg     ;
reg [C_M_AXI_DATA_WIDTH-1:0] wdata_m_reg   ;
reg                          wvalid_m_reg  ;
reg [7:0]                    wlast_cnt_reg ;
reg                          bready_m_reg  ;
reg [2:0]                    wr_addr_pipe  ;
reg                          wr_addr_pend  ;
reg [2:0]                    wr_data_queue ;
reg [C_M_AXI_ADDR_WIDTH-1:0] write_four_k  ;


/*
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] awid_m                        ,
 output [31:0]                        awaddr_m                      ,
 output [7:0]                         awlen_m                       ,
 output [2:0]                         awsize_m                      ,
 output [1:0]                         awburst_m                     ,
 output [0:0]                         awlock_m                      ,
 output [3:0]                         awcache_m                     ,
 output [2:0]                         awprot_m                      ,
 output [3:0]                         awqos_m                       ,
 output [C_M_AXI_AWUSER_WIDTH-1:0]    awuser_m                      ,
 output                               awvalid_m                     ,
*/

   wire [3:0]  param_incr_shift = (C_M_AXI_DATA_WIDTH == 32) ? 4'h2 : (C_M_AXI_DATA_WIDTH == 64) ? 4'h3 : (C_M_AXI_DATA_WIDTH == 128) ? 4'h4 : (C_M_AXI_DATA_WIDTH == 256) ? 4'h5: 4'h6;
generate if(C_ATG_STATIC_EN_WRITE == 1) begin : ATG_MODE_STATIC_WR_ON

assign awid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = {C_M_AXI_THREAD_ID_WIDTH {1'b0}};
assign awaddr_m                            = (C_ATG_STATIC_INCR == 0) ? awaddr_m_reg : awaddr_m_reg_incr;
assign awlen_m                             = awlen_m_reg;
assign awprot_m                            = 3'b000;
assign awlock_m[0:0]                       = 1'b0; 
assign awcache_m                           = 4'b0011;
assign awuser_m[C_M_AXI_AWUSER_WIDTH-1:0]  = {C_M_AXI_AWUSER_WIDTH{1'b0}};
assign awqos_m[3:0]                        = 4'h0;
assign awburst_m                           = 2'b01; 
assign awsize_m                            = (C_M_AXI_DATA_WIDTH==32) ? 3'b010 :
                                             (C_M_AXI_DATA_WIDTH==64) ? 3'b011 :
                                             (C_M_AXI_DATA_WIDTH==128) ? 3'b100 :
                                             (C_M_AXI_DATA_WIDTH==256) ? 3'b101 :3'b110;
assign awvalid_m = awvalid_m_reg;
assign wlast_m   = wlast_reg;
assign wdata_m   = wdata_m_reg;              
assign wstrb_m   = {(C_M_AXI_DATA_WIDTH/8){1'b1}};
assign wvalid_m  = wvalid_m_reg;         
assign bready_m  = bready_m_reg;          
/////////////Auto INCR PR
wire [12:0] cmdw_addrincr = (burst_len+1) << param_incr_shift;

always @(posedge Clk) begin
   if (~rst_l) begin
     awaddr_nxt_chk       <= C_ATG_STATIC_WR_ADDRESS;
     cmdw_addrincr_ff     <= cmdw_addrincr;
   end
   else begin
     cmdw_addrincr_ff     <= cmdw_addrincr;
     awaddr_nxt_chk       <= cmdw_addrincr_ff + cmdw_addrincr_ff;
   end
end

//****************************Write Master Interface******************************
// Enable this based on generic C_ATG_STATIC_EN_WRITE

wire launch_nxt_wtrn;

// Write  Master Logic
always @(posedge Clk) begin
   
   if (~rst_l) begin
       awvalid_m_reg <= 1'b0;
       awaddr_m_reg <= 'h0;
       awaddr_m_reg_incr <= 'h0;
       awlen_m_reg  <= 8'b0;
       write_four_k <= 'b0;
   end else if (st_en_reg_edge) begin
       awvalid_m_reg <= 1'b1;
       awaddr_m_reg <= C_ATG_STATIC_WR_ADDRESS;
       awaddr_m_reg_incr <= C_ATG_STATIC_WR_ADDRESS;
       awlen_m_reg  <= burst_len;
       write_four_k <= C_ATG_STATIC_WR_ADDRESS + 32'd4096;
   end else if (awvalid_m_reg & ~awready_m) begin
       awvalid_m_reg <= awvalid_m_reg;
       awaddr_m_reg <= C_ATG_STATIC_WR_ADDRESS;
       awaddr_m_reg_incr <= awaddr_m_reg_incr;
       awlen_m_reg  <= burst_len;
       write_four_k <= write_four_k;
   end else if ((wr_addr_pipe == C_ATG_STATIC_WR_PIPELINE-1) && awvalid_m && awready_m ) begin
       awvalid_m_reg <= 1'b0;
       awaddr_m_reg <= 'h0;
       awaddr_m_reg_incr <= awaddr_m_reg_incr;
       awlen_m_reg  <= 8'b0;
       write_four_k <= write_four_k;
   end else if ((wr_addr_pipe < C_ATG_STATIC_WR_PIPELINE) ) begin
       awvalid_m_reg <= st_en_reg1 & ~glcnt_done & launch_nxt_wtrn;
       awaddr_m_reg <= C_ATG_STATIC_WR_ADDRESS;
       awlen_m_reg  <= burst_len;
       if (~(st_en_reg1 & ~glcnt_done & launch_nxt_wtrn)) begin
          awaddr_m_reg_incr <= awaddr_m_reg_incr;
          write_four_k <= write_four_k;
       end else if (awaddr_nxt_chk + awaddr_m_reg_incr > C_ATG_STATIC_WR_HIGH_ADDRESS_C) begin
          awaddr_m_reg_incr <= C_ATG_STATIC_WR_ADDRESS;
          write_four_k <= C_ATG_STATIC_WR_ADDRESS + 'd4096;
       end else if (awaddr_nxt_chk + awaddr_m_reg_incr > write_four_k) begin
          awaddr_m_reg_incr <= write_four_k;
          write_four_k <= write_four_k + 'd4096;
       end else begin
          awaddr_m_reg_incr <= awaddr_m_reg_incr + cmdw_addrincr;
          write_four_k <= write_four_k;
       end
    end
end


// Write Address Pipeline
wire btrns_complete;
wire wtrns_complete;
wire bwtrns_complete;
assign btrns_complete = bvalid_m & bready_m;

assign bwtrns_complete = (C_ATG_HLTP_MODE == 0)  ? btrns_complete : wtrns_complete;

always @(posedge Clk) begin
  if (~rst_l || st_en_reg_edge) begin
      wr_addr_pipe <=3'b0;
  end
  else if (awvalid_m_reg && awready_m && bwtrns_complete) begin
      wr_addr_pipe <= wr_addr_pipe;
  end    
  else if (awvalid_m_reg && awready_m) begin
      wr_addr_pipe <= wr_addr_pipe + 1;
  end    
  else if (bwtrns_complete) begin
      wr_addr_pipe <= wr_addr_pipe - 1;
  end    
end

always @(posedge Clk) begin
  if (~rst_l || st_en_reg_edge) begin
      wr_addr_pend <=1'b0;
  end
  else if (awvalid_m_reg && ~awready_m) begin
      wr_addr_pend <=1'b1;
  end    
  else if (awvalid_m_reg && awready_m) begin
      wr_addr_pend <= 1'b0;
  end    
end

wire launch_awaddr;
assign wtrns_complete = wlast_reg & wvalid_m & wready_m;
always @(posedge Clk) begin
  if (~rst_l || st_en_reg_edge) begin
      wr_data_queue <=3'b0;
  end
  else if (launch_awaddr & wtrns_complete) begin
      wr_data_queue <= wr_data_queue;
  end    
  else if (launch_awaddr ) begin
      wr_data_queue <= wr_data_queue + 1;
  end    
  else if (wtrns_complete) begin
      wr_data_queue <= wr_data_queue - 1;
  end    
end

wire [C_M_AXI_DATA_WIDTH-1:0] test_data ;
assign test_data= {
                        32'h12A0_A51F, 32'hCAFE_5AFE, 
                        32'hC001_A51F, 32'hC001_CA5E, 
                        32'hC001_12AF, 32'h5AFE_5AFE, 
                        32'hA51F_A51F, 32'h5AFE_CAFE, 
                        32'h12A0_12A0, 32'hCAFE_C001, 
                        32'hA51F_12A0, 32'hC001_CAFE, 
                        32'hCAA1_A51F, 32'hCAFE_A51F, 
                        32'hCAA1_12a0, 32'hC001_5AFE 
                        };
// WData logic
always @(posedge Clk) begin
   
   if (~rst_l ) begin
       wvalid_m_reg <= 1'b0;
       wdata_m_reg <= {C_M_AXI_DATA_WIDTH{1'b0}};
   end else if (wvalid_m_reg && wready_m && wlast_reg) begin
       wvalid_m_reg <= 1'b0;
   //end else if (((awvalid_m_reg && awready_m)|| (wr_addr_pipe > 0)) && ~wlast_reg) begin
   //end else if (((st_en_reg_edge)| 
   //              ((wr_addr_pipe == 3'h0 )&(launch_awaddr))|
   //              ((wr_addr_pipe > 0) &(wr_addr_pipe <C_ATG_STATIC_WR_PIPELINE))) && ~wlast_reg) begin
   end else if ( wr_data_queue >0 ) begin
       wvalid_m_reg <= 1'b1;
       wdata_m_reg <= test_data[C_M_AXI_DATA_WIDTH-1:0];
   //end else if ( wr_addr_pipe == 1 && wlast_reg && wready_m) begin
   //    wvalid_m_reg <= 1'b0;
   //    wdata_m_reg <= {C_M_AXI_DATA_WIDTH{1'b0}};
   end else begin
     wdata_m_reg  <= wdata_m_reg;
     wvalid_m_reg <= wvalid_m_reg;
   end
 
end


always @(posedge Clk) begin
   
   if (~rst_l) begin
        wlast_cnt_reg <= 8'b0;
        wlast_reg <= 1'b0;
   end
   else if (wlast_reg & wready_m & wvalid_m) begin 
       wlast_cnt_reg <= 8'b0;
       wlast_reg <= 1'b0;
   end
   // len=0 case, generate wlast along with wvalid
   //else if (((awvalid_m_reg && awready_m)|| wr_addr_pipe > 0) && ~wlast_reg && (burst_len == 0)) begin
   //else if (((st_en_reg_edge)|| wr_addr_pipe > 0) && ~wlast_reg && (burst_len == 0)) begin
   else if ( (wr_data_queue >0 )& (burst_len == 0) ) begin
       wlast_cnt_reg <= 8'b0;
       wlast_reg <= 1'b1;
   end
   else if (wvalid_m_reg && wready_m) begin 
       wlast_cnt_reg <= wlast_cnt_reg + 1;
       wlast_reg <= (wlast_cnt_reg + 1 == burst_len);
   end
end



// Write Response Logic
always @(posedge Clk) begin
   if (~rst_l) begin
       bready_m_reg <=1'b0;
   end
   else if (awvalid_m_reg) begin
       bready_m_reg <=1'b1;
   end    
   else if (bvalid_m) begin
       bready_m_reg <=1'b1;
    end
end

//
//2013.3: Traffic Profiles.
//Counter to count required no.of Clocks
//
reg [31:0] tran_gap_wcntr;
reg awvalid_m_reg_ff;
wire awaddr_sampled;
reg  awaddr_sampled_reg;

assign awaddr_sampled = awvalid_m & awready_m;
always @(posedge Clk) begin
   if (~rst_l ) begin
     awvalid_m_reg_ff <= 1'b0;
     awaddr_sampled_reg <= 1'b0;
   end else begin
     awvalid_m_reg_ff <= awvalid_m_reg;
     awaddr_sampled_reg <= awaddr_sampled;
   end
end
assign launch_awaddr = (awvalid_m_reg & ~awvalid_m_reg_ff) |(awaddr_sampled_reg & awvalid_m_reg);
always @(posedge Clk) begin
   if (~rst_l ) begin
     tran_gap_wcntr <= 32'h0;
   end else if (launch_awaddr) begin
     tran_gap_wcntr <= 32'h0;
   end else if (tran_gap_wcntr == C_ATG_STATIC_TRANGAP ) begin
     tran_gap_wcntr <= tran_gap_wcntr;
   end else begin
     tran_gap_wcntr <= tran_gap_wcntr + 1;
   end
end
assign launch_nxt_wtrn = (tran_gap_wcntr == C_ATG_STATIC_TRANGAP) ? 1'b1: 1'b0;

end
endgenerate // ATG_MODE_STATIC_WR_ON

generate if(C_ATG_STATIC_EN_WRITE == 0) begin : ATG_MODE_STATIC_WR_OFF

  assign awid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = 'h0; 
  assign awaddr_m                            = 'h0; 
  assign awlen_m                             = 'h0;
  assign awprot_m                            = 'h0;
  assign awlock_m[0:0]                       = 'h0;
  assign awcache_m                           = 'h0;
  assign awuser_m[C_M_AXI_AWUSER_WIDTH-1:0]  = 'h0;
  assign awqos_m[3:0]                        = 'h0;
  assign awburst_m                           = 'h0;
  assign awsize_m                            = 'h0;
  assign awvalid_m                           = 'h0;
  assign wlast_m                             = 'h0;
  assign wdata_m                             = 'h0;
  assign wstrb_m                             = 'h0;
  assign wvalid_m                            = 'h0;
  assign bready_m                            = 'h0;
  always @(posedge Clk) begin
     wr_addr_pipe <=3'b0;
     wr_addr_pend <=1'b0;
  end
end
endgenerate // ATG_MODE_STATIC_WR_OFF

//*************************** READ Master Interface*******************************
// Enable this based on generic C_ATG_STATIC_EN_READ

reg arvalid_m_reg; 
reg [C_M_AXI_ADDR_WIDTH-1:0] araddr_m_reg;
reg [C_M_AXI_ADDR_WIDTH-1:0] araddr_m_reg_incr;
reg [C_M_AXI_ADDR_WIDTH-1:0] araddr_nxt_chk;
reg [12:0] cmdr_addrincr_ff;
reg [C_M_AXI_ADDR_WIDTH-1:0] araddr_inc_reg;
reg [7:0]  arlen_m_reg;
reg rlast_reg;
reg [C_M_AXI_ADDR_WIDTH-1:0] read_four_k;

reg [7:0] rlast_cnt_reg;
reg rready_m_reg;

reg [2:0] rd_addr_pipe;
reg       rd_addr_pend;
wire [12:0] cmdr_addrincr = (burst_len+1) << param_incr_shift;

generate if(C_ATG_STATIC_EN_READ == 1) begin : ATG_MODE_STATIC_RD_ON

assign arid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] =  {C_M_AXI_THREAD_ID_WIDTH{1'b0}};
assign arlen_m[7:0]                        = arlen_m_reg;
assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = (C_ATG_STATIC_INCR == 0) ? araddr_m_reg : araddr_m_reg_incr;
assign arvalid_m                           = arvalid_m_reg;
assign arlock_m[0:0]                       = 1'b0; 
assign arburst_m[1:0]                      = 2'b01;
assign arprot_m[2:0]                       = 3'b000;
assign arcache_m[3:0]                      = 4'b0011;
assign aruser_m[C_M_AXI_ARUSER_WIDTH-1:0]  = {C_M_AXI_ARUSER_WIDTH{1'b0}};
assign arqos_m[3:0]                        = 4'h0; 
assign arsize_m                            = (C_M_AXI_DATA_WIDTH==32) ? 3'b010 :
                                             (C_M_AXI_DATA_WIDTH==64) ? 3'b011 :
                                             (C_M_AXI_DATA_WIDTH==128) ? 3'b100 :
                                             (C_M_AXI_DATA_WIDTH==256) ? 3'b101 :3'b110;
assign rready_m = rready_m_reg;
always @(posedge Clk) begin
   if (~rst_l) begin
     araddr_nxt_chk      <= C_ATG_STATIC_RD_ADDRESS;
     cmdr_addrincr_ff    <= cmdr_addrincr;
   end
   else begin
     cmdr_addrincr_ff    <= cmdr_addrincr;
     araddr_nxt_chk      <= cmdr_addrincr_ff + cmdr_addrincr_ff;
   end
end
// Read  Master Logic
wire launch_nxt_rtrn;
always @(posedge Clk) begin
   
   if (~rst_l) begin
       arvalid_m_reg <= 1'b0;
       araddr_m_reg <= 'h0;
       araddr_m_reg_incr <= 'h0;
       arlen_m_reg <= 8'b0;
       read_four_k <= 'b0;
   end else if (st_en_reg_edge) begin
       arvalid_m_reg <= 1'b1;
       araddr_m_reg <= C_ATG_STATIC_RD_ADDRESS;
       araddr_m_reg_incr <= C_ATG_STATIC_RD_ADDRESS;
       arlen_m_reg <= burst_len;
       read_four_k <= C_ATG_STATIC_RD_ADDRESS + 32'd4096;
   end else if (arvalid_m_reg & ~arready_m) begin
       arvalid_m_reg <= arvalid_m_reg;
       araddr_m_reg <= C_ATG_STATIC_RD_ADDRESS;
       araddr_m_reg_incr <= araddr_m_reg_incr;
       arlen_m_reg <= burst_len;
       read_four_k <= read_four_k;
   end else if (( rd_addr_pipe == C_ATG_STATIC_RD_PIPELINE-1) && arvalid_m && arready_m ) begin
       arvalid_m_reg <= 1'b0;
       araddr_m_reg <= 'h0;
       araddr_m_reg_incr <= araddr_m_reg_incr;
       arlen_m_reg <= 8'b0;
       read_four_k <= read_four_k;
   end else if ((rd_addr_pipe < C_ATG_STATIC_RD_PIPELINE) ) begin
       arvalid_m_reg <= st_en_reg1 & ~glcnt_done & launch_nxt_rtrn;
       araddr_m_reg <= C_ATG_STATIC_RD_ADDRESS;
       arlen_m_reg <= burst_len;
       if (~(st_en_reg1 & ~glcnt_done & launch_nxt_rtrn)) begin
          araddr_m_reg_incr <= araddr_m_reg_incr;
          read_four_k <= read_four_k;
       end else if (araddr_nxt_chk + araddr_m_reg_incr > C_ATG_STATIC_RD_HIGH_ADDRESS_C) begin
          araddr_m_reg_incr <= C_ATG_STATIC_RD_ADDRESS;
          read_four_k <= C_ATG_STATIC_RD_ADDRESS + 'd4096;
       end else if (araddr_nxt_chk + araddr_m_reg_incr > read_four_k) begin
          araddr_m_reg_incr <= read_four_k;
          read_four_k <= read_four_k + 'd4096;
       end else begin
          araddr_m_reg_incr <= araddr_m_reg_incr + cmdr_addrincr;
          read_four_k <= read_four_k;
       end       
   end
end

// Read Address Pipeline
always @(posedge Clk) begin
   
   if (~rst_l || st_en_reg_edge) begin
       rd_addr_pipe <=3'b0;
   end
   else if (arvalid_m_reg && arready_m && rlast_reg && rvalid_m && rready_m) begin
       rd_addr_pipe <= rd_addr_pipe;
   end    
   else if (arvalid_m_reg && arready_m) begin
       rd_addr_pipe <= rd_addr_pipe + 1;
   end    
   else if (rlast_reg  && rvalid_m && rready_m) begin
       rd_addr_pipe <= rd_addr_pipe - 1;
   end    
 
end

always @(posedge Clk) begin
  if (~rst_l || st_en_reg_edge) begin
      rd_addr_pend <=1'b0;
  end
  else if (arvalid_m_reg && ~arready_m) begin
      rd_addr_pend <=1'b1;
  end    
  else if (arvalid_m_reg && arready_m) begin
      rd_addr_pend <= 1'b0;
  end    
end

// Pend Read Logic
always @(posedge Clk) begin
   
   if (~rst_l || st_en_reg_edge) begin
       rready_m_reg <=1'b1;
   end else if (rlast_m && rvalid_m && rready_m && ~arvalid_m && (stop_generation || glcnt_done) && (rd_addr_pipe == 1)) begin
       rready_m_reg <= 1'b0;
   end else if (~arvalid_m && (stop_generation || glcnt_done) && (rd_addr_pipe == 0)) begin
       rready_m_reg <= 1'b0;
   end
end

always @(rlast_m) begin
  rlast_reg  = rlast_m;
end
//
//2013.3: Traffic Profiles.
//Counter to count required no.of Clocks
//
reg [31:0] tran_gap_rcntr;
reg arvalid_m_reg_ff;
wire araddr_sampled;
reg  araddr_sampled_reg;
wire launch_araddr;

assign araddr_sampled = arvalid_m & arready_m;
always @(posedge Clk) begin
   if (~rst_l ) begin
     arvalid_m_reg_ff <= 1'b0;
     araddr_sampled_reg <= 1'b0;
   end else begin
     arvalid_m_reg_ff   <= arvalid_m_reg;
     araddr_sampled_reg <= araddr_sampled;
   end
end
assign launch_araddr = (arvalid_m_reg & ~arvalid_m_reg_ff) |(araddr_sampled_reg & arvalid_m_reg);
always @(posedge Clk) begin
   if (~rst_l ) begin
     tran_gap_rcntr <= 32'h0;
   end else if (launch_araddr) begin
     tran_gap_rcntr <= 32'h0;
   end else if (tran_gap_rcntr == C_ATG_STATIC_TRANGAP ) begin
     tran_gap_rcntr <= tran_gap_rcntr;
   end else begin
     tran_gap_rcntr <= tran_gap_rcntr + 1;
   end
end
assign launch_nxt_rtrn = (tran_gap_rcntr == C_ATG_STATIC_TRANGAP) ? 1'b1: 1'b0;

end
endgenerate // ATG_MODE_STATIC_RD_ON

generate if(C_ATG_STATIC_EN_READ == 0) begin : ATG_MODE_STATIC_RD_OFF
  assign arid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = 'h0 ;  
  assign arlen_m[7:0]                        = 'h0 ; 
  assign araddr_m[31:0]                      = 'h0 ; 
  assign arvalid_m                           = 'h0 ;
  assign arlock_m[0:0]                       = 'h0 ;
  assign arburst_m[1:0]                      = 'h0 ;
  assign arprot_m[2:0]                       = 'h0 ;
  assign arcache_m[3:0]                      = 'h0 ;
  assign aruser_m[C_M_AXI_ARUSER_WIDTH-1:0]  = 'h0 ;
  assign arqos_m[3:0]                        = 'h0 ;
  assign arsize_m                            = 'h0 ;
  assign rready_m                            = 'h0 ;
  always @(posedge Clk) begin
    rd_addr_pipe <=3'b0;
    rd_addr_pend <=1'b0;
  end
end
endgenerate // ATG_MODE_STATIC_RD_OFF
//**********************Counter Logic*************************
//


reg [31:0] rdcnt_reg;
reg [31:0] wrcnt_reg;
generate if(C_ATG_STATIC_FREE_RUN == 0) begin : ATG_MODE_STATIC_DEBUG_ON
assign reg3_rdcnt = rdcnt_reg;
assign reg4_wrcnt = wrcnt_reg;
assign reg5_glcnt = glcnt_reg;
end
endgenerate // ATG_MODE_STATIC_DEBUG_ON


generate if(C_ATG_STATIC_FREE_RUN == 1) begin : ATG_MODE_STATIC_DEBUG_OFF
assign reg3_rdcnt = 32'h0;
assign reg4_wrcnt = 32'h0;
assign reg5_glcnt = 32'h0;
end
endgenerate // ATG_MODE_STATIC_DEBUG_ON

always @(posedge Clk) begin
   
   if (~rst_l || st_en_reg_edge) begin
     rdcnt_reg <= 32'b0;
   end else if (glcnt_done) begin
     rdcnt_reg <= rdcnt_reg ;
   end else if (rlast_reg && rvalid_m) begin
     rdcnt_reg <= rdcnt_reg + 1;
   end
end

always @(posedge Clk) begin
   
   if (~rst_l || st_en_reg_edge) begin
     wrcnt_reg <= 32'b0;
   end else if (glcnt_done) begin
     wrcnt_reg <= wrcnt_reg;
   end else if (wlast_reg && wready_m) begin
     wrcnt_reg <= wrcnt_reg + 1;
   end
end


always @(posedge Clk) begin
   
   if (~rst_l || st_en_reg_edge || reset_reg1_done) begin
     glcnt_reg <= 32'h0;
   end else if (glcnt_done) begin
     glcnt_reg <= 32'hFFFFFFFF;
   end else if (~done && st_en_reg1 ) begin
     glcnt_reg <= glcnt_reg + 1;
   end
end


//done- generation
generate if(C_ATG_STATIC_FREE_RUN == 1) begin : ATG_MODE_STATIC_DEBUG_OFF_DONE
  always @(posedge Clk) begin
     if (~rst_l ) begin
       done <= 1'b0;
     end else if ((st_en_reg_edge == 1'b1) || (reset_reg1_done == 1'b1)) begin
       done <= 1'b0;
     //set done bit when a. Core disabled
     //                  provided the last read/write transaction got completed.
     end else if ((stop_generation) &&
                  (~wvalid_m && ~wr_addr_pend && (wr_addr_pipe == 0)) && 
                  (~rready_m && ~rd_addr_pend && (rd_addr_pipe == 0)) 
                 ) begin
       done <= 1'b1;
     end
  end
end
endgenerate // ATG_MODE_STATIC_DEBUG_ON_DONE

generate if(C_ATG_STATIC_FREE_RUN == 0) begin : ATG_MODE_STATIC_DEBUG_ON_DONE
  always @(posedge Clk) begin
     if (~rst_l ) begin
       done <= 1'b0;
     end else if ((st_en_reg_edge == 1'b1) || (reset_reg1_done == 1'b1)) begin
       done <= 1'b0;
     //set done bit when a.Global counter reached max limit or b. Core disabled
     //                  provided the last read/write transaction got completed.
     end else if (((glcnt_done)||(stop_generation)) && 
                  (~wvalid_m && ~wr_addr_pend && (wr_addr_pipe == 0)) && 
                  (~rready_m && ~rd_addr_pend && (rd_addr_pipe == 0)) 
                 ) begin
       done <= 1'b1;
     end
  end
end
endgenerate // ATG_MODE_STATIC_DEBUG_OFF_DONE

endmodule
