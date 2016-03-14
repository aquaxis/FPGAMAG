// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: user.org:user:aq_axi_dma:1.0
// IP Revision: 1

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
ZYBO_aq_axi_dma_0_0 your_instance_name (
  .ARESETN(ARESETN),              // input wire ARESETN
  .LOCAL_CLK(LOCAL_CLK),          // input wire LOCAL_CLK
  .LOCAL_CS(LOCAL_CS),            // input wire LOCAL_CS
  .LOCAL_RNW(LOCAL_RNW),          // input wire LOCAL_RNW
  .LOCAL_ACK(LOCAL_ACK),          // output wire LOCAL_ACK
  .LOCAL_ADDR(LOCAL_ADDR),        // input wire [31 : 0] LOCAL_ADDR
  .LOCAL_BE(LOCAL_BE),            // input wire [3 : 0] LOCAL_BE
  .LOCAL_WDATA(LOCAL_WDATA),      // input wire [31 : 0] LOCAL_WDATA
  .LOCAL_RDATA(LOCAL_RDATA),      // output wire [31 : 0] LOCAL_RDATA
  .M_AXI_ACLK(M_AXI_ACLK),        // input wire M_AXI_ACLK
  .M_AXI_AWID(M_AXI_AWID),        // output wire [0 : 0] M_AXI_AWID
  .M_AXI_AWADDR(M_AXI_AWADDR),    // output wire [31 : 0] M_AXI_AWADDR
  .M_AXI_AWLEN(M_AXI_AWLEN),      // output wire [7 : 0] M_AXI_AWLEN
  .M_AXI_AWSIZE(M_AXI_AWSIZE),    // output wire [2 : 0] M_AXI_AWSIZE
  .M_AXI_AWBURST(M_AXI_AWBURST),  // output wire [1 : 0] M_AXI_AWBURST
  .M_AXI_AWLOCK(M_AXI_AWLOCK),    // output wire M_AXI_AWLOCK
  .M_AXI_AWCACHE(M_AXI_AWCACHE),  // output wire [3 : 0] M_AXI_AWCACHE
  .M_AXI_AWPROT(M_AXI_AWPROT),    // output wire [2 : 0] M_AXI_AWPROT
  .M_AXI_AWQOS(M_AXI_AWQOS),      // output wire [3 : 0] M_AXI_AWQOS
  .M_AXI_AWUSER(M_AXI_AWUSER),    // output wire [0 : 0] M_AXI_AWUSER
  .M_AXI_AWVALID(M_AXI_AWVALID),  // output wire M_AXI_AWVALID
  .M_AXI_AWREADY(M_AXI_AWREADY),  // input wire M_AXI_AWREADY
  .M_AXI_WDATA(M_AXI_WDATA),      // output wire [63 : 0] M_AXI_WDATA
  .M_AXI_WSTRB(M_AXI_WSTRB),      // output wire [7 : 0] M_AXI_WSTRB
  .M_AXI_WLAST(M_AXI_WLAST),      // output wire M_AXI_WLAST
  .M_AXI_WUSER(M_AXI_WUSER),      // output wire [0 : 0] M_AXI_WUSER
  .M_AXI_WVALID(M_AXI_WVALID),    // output wire M_AXI_WVALID
  .M_AXI_WREADY(M_AXI_WREADY),    // input wire M_AXI_WREADY
  .M_AXI_BID(M_AXI_BID),          // input wire [0 : 0] M_AXI_BID
  .M_AXI_BRESP(M_AXI_BRESP),      // input wire [1 : 0] M_AXI_BRESP
  .M_AXI_BUSER(M_AXI_BUSER),      // input wire [0 : 0] M_AXI_BUSER
  .M_AXI_BVALID(M_AXI_BVALID),    // input wire M_AXI_BVALID
  .M_AXI_BREADY(M_AXI_BREADY),    // output wire M_AXI_BREADY
  .M_AXI_ARID(M_AXI_ARID),        // output wire [0 : 0] M_AXI_ARID
  .M_AXI_ARADDR(M_AXI_ARADDR),    // output wire [31 : 0] M_AXI_ARADDR
  .M_AXI_ARLEN(M_AXI_ARLEN),      // output wire [7 : 0] M_AXI_ARLEN
  .M_AXI_ARSIZE(M_AXI_ARSIZE),    // output wire [2 : 0] M_AXI_ARSIZE
  .M_AXI_ARBURST(M_AXI_ARBURST),  // output wire [1 : 0] M_AXI_ARBURST
  .M_AXI_ARLOCK(M_AXI_ARLOCK),    // output wire [1 : 0] M_AXI_ARLOCK
  .M_AXI_ARCACHE(M_AXI_ARCACHE),  // output wire [3 : 0] M_AXI_ARCACHE
  .M_AXI_ARPROT(M_AXI_ARPROT),    // output wire [2 : 0] M_AXI_ARPROT
  .M_AXI_ARQOS(M_AXI_ARQOS),      // output wire [3 : 0] M_AXI_ARQOS
  .M_AXI_ARUSER(M_AXI_ARUSER),    // output wire [0 : 0] M_AXI_ARUSER
  .M_AXI_ARVALID(M_AXI_ARVALID),  // output wire M_AXI_ARVALID
  .M_AXI_ARREADY(M_AXI_ARREADY),  // input wire M_AXI_ARREADY
  .M_AXI_RID(M_AXI_RID),          // input wire [0 : 0] M_AXI_RID
  .M_AXI_RDATA(M_AXI_RDATA),      // input wire [63 : 0] M_AXI_RDATA
  .M_AXI_RRESP(M_AXI_RRESP),      // input wire [1 : 0] M_AXI_RRESP
  .M_AXI_RLAST(M_AXI_RLAST),      // input wire M_AXI_RLAST
  .M_AXI_RUSER(M_AXI_RUSER),      // input wire [0 : 0] M_AXI_RUSER
  .M_AXI_RVALID(M_AXI_RVALID),    // input wire M_AXI_RVALID
  .M_AXI_RREADY(M_AXI_RREADY),    // output wire M_AXI_RREADY
  .FIFO_RST(FIFO_RST),            // output wire FIFO_RST
  .FIFO_RD_CLK(FIFO_RD_CLK),      // input wire FIFO_RD_CLK
  .FIFO_RD_EN(FIFO_RD_EN),        // input wire FIFO_RD_EN
  .FIFO_RD_DOUT(FIFO_RD_DOUT),    // output wire [63 : 0] FIFO_RD_DOUT
  .FIFO_RD_EMPTY(FIFO_RD_EMPTY),  // output wire FIFO_RD_EMPTY
  .FIFO_WR_CLK(FIFO_WR_CLK),      // input wire FIFO_WR_CLK
  .FIFO_WR_DIN(FIFO_WR_DIN),      // input wire [63 : 0] FIFO_WR_DIN
  .FIFO_WR_EN(FIFO_WR_EN),        // input wire FIFO_WR_EN
  .FIFO_WR_FULL(FIFO_WR_FULL),    // output wire FIFO_WR_FULL
  .FSYNC(FSYNC),                  // input wire FSYNC
  .FSYNC_RST(FSYNC_RST),          // input wire FSYNC_RST
  .DEBUG(DEBUG)                  // output wire [31 : 0] DEBUG
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

