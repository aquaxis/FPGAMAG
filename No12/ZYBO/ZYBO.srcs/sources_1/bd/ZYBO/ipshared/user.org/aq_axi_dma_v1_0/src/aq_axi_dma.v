/*
 * Copyright (C)2014-2015 AQUAXIS TECHNOLOGY.
 *  Don't remove this header.
 * When you use this source, there is a need to inherit this header.
 *
 * License
 *  For no commercial -
 *   License:     The Open Software License 3.0
 *   License URI: http://www.opensource.org/licenses/OSL-3.0
 *
 *  For commmercial -
 *   License:     AQUAXIS License 1.0
 *   License URI: http://www.aquaxis.com/licenses
 *
 * For further information please contact.
 *	URI:    http://www.aquaxis.com/
 *	E-Mail: info(at)aquaxis.com
 */
module aq_axi_dma
  (
    input           ARESETN,

    // --------------------------------------------------
    // AXI4 Lite Interface
    // --------------------------------------------------
    input           LOCAL_CLK,
  input         LOCAL_CS,
  input         LOCAL_RNW,
  output        LOCAL_ACK,
  input [31:0]  LOCAL_ADDR,
  input [3:0]   LOCAL_BE,
  input [31:0]  LOCAL_WDATA,
  output [31:0] LOCAL_RDATA,

    // --------------------------------------------------
    // AXI4 Master
    // --------------------------------------------------
    // Reset, Clock
    input         M_AXI_ACLK,

    // Master Write Address
    output [0:0]  M_AXI_AWID,
    output [31:0] M_AXI_AWADDR,
    output [7:0]  M_AXI_AWLEN,
    output [2:0]  M_AXI_AWSIZE,
    output [1:0]  M_AXI_AWBURST,
    output        M_AXI_AWLOCK,
    output [3:0]  M_AXI_AWCACHE,
    output [2:0]  M_AXI_AWPROT,
    output [3:0]  M_AXI_AWQOS,
    output [0:0]  M_AXI_AWUSER,
    output        M_AXI_AWVALID,
    input         M_AXI_AWREADY,

    // Master Write Data
    output [63:0] M_AXI_WDATA,
    output [7:0]  M_AXI_WSTRB,
    output        M_AXI_WLAST,
    output [0:0]  M_AXI_WUSER,
    output        M_AXI_WVALID,
    input         M_AXI_WREADY,

    // Master Write Response
    input [0:0]   M_AXI_BID,
    input [1:0]   M_AXI_BRESP,
    input [0:0]   M_AXI_BUSER,
    input         M_AXI_BVALID,
    output        M_AXI_BREADY,

    // Master Read Address
    output [0:0]  M_AXI_ARID,
    output [31:0] M_AXI_ARADDR,
    output [7:0]  M_AXI_ARLEN,
    output [2:0]  M_AXI_ARSIZE,
    output [1:0]  M_AXI_ARBURST,
    output [1:0]  M_AXI_ARLOCK,
    output [3:0]  M_AXI_ARCACHE,
    output [2:0]  M_AXI_ARPROT,
    output [3:0]  M_AXI_ARQOS,
    output [0:0]  M_AXI_ARUSER,
    output        M_AXI_ARVALID,
    input         M_AXI_ARREADY,

    // Master Read Data
    input [0:0]   M_AXI_RID,
    input [63:0]  M_AXI_RDATA,
    input [1:0]   M_AXI_RRESP,
    input         M_AXI_RLAST,
    input [0:0]   M_AXI_RUSER,
    input         M_AXI_RVALID,
    output        M_AXI_RREADY,

    // FIFO
    output          FIFO_RST,

    input           FIFO_RD_CLK,
    input           FIFO_RD_EN,
    output [63:0]   FIFO_RD_DOUT,
    output          FIFO_RD_EMPTY,

    input           FIFO_WR_CLK,
    input [63:0]    FIFO_WR_DIN,
    input           FIFO_WR_EN,
    output          FIFO_WR_FULL,

    input           FSYNC,
    input           FSYNC_RST,

    output [31:0]   DEBUG
   );

  wire           local_cs;
  wire           local_rnw;
  wire           local_ack;
  wire [31:0]    local_addr;
  wire [3:0]     local_be;
  wire [31:0]    local_wdata;
  wire [31:0]    local_rdata;

  wire           wr_start;

  wire [31:0]    wr_adrs;
  wire [31:0]    wr_len;
  wire           wr_ready;
  wire           wr_fifo_re;
  wire           wr_fifo_empty;
  wire           wr_fifo_aempty;
  wire [63:0]    wr_fifo_data;

  wire           rd_start;
  wire [31:0]    rd_adrs;
  wire [31:0]    rd_len;
  wire           rd_ready;
  wire           rd_fifo_we;
  wire           rd_fifo_full;
  wire           rd_fifo_afull;
  wire [63:0]    rd_fifo_data;

  wire           rd_start_fsync;

  wire [31:0]    master_status;

  reg [31:0]      wr_fifo_wrcnt, wr_fifo_rdcnt, rd_fifo_wrcnt, rd_fifo_rdcnt;

  wire [31:0]    debug_slave, debug_ctl, debug_master;

  aq_axi_master u_aq_axi_master
    (
      .ARESETN(ARESETN),
      .ACLK(M_AXI_ACLK),

      .M_AXI_AWID(M_AXI_AWID),
      .M_AXI_AWADDR(M_AXI_AWADDR),
      .M_AXI_AWLEN(M_AXI_AWLEN),
      .M_AXI_AWSIZE(M_AXI_AWSIZE),
      .M_AXI_AWBURST(M_AXI_AWBURST),
      .M_AXI_AWLOCK(M_AXI_AWLOCK),
      .M_AXI_AWCACHE(M_AXI_AWCACHE),
      .M_AXI_AWPROT(M_AXI_AWPROT),
      .M_AXI_AWQOS(M_AXI_AWQOS),
      .M_AXI_AWUSER(M_AXI_AWUSER),
      .M_AXI_AWVALID(M_AXI_AWVALID),
      .M_AXI_AWREADY(M_AXI_AWREADY),

      .M_AXI_WDATA(M_AXI_WDATA),
      .M_AXI_WSTRB(M_AXI_WSTRB),
      .M_AXI_WLAST(M_AXI_WLAST),
      .M_AXI_WUSER(M_AXI_WUSER),
      .M_AXI_WVALID(M_AXI_WVALID),
      .M_AXI_WREADY(M_AXI_WREADY),

      .M_AXI_BID(M_AXI_BID),
      .M_AXI_BRESP(M_AXI_BRESP),
      .M_AXI_BUSER(M_AXI_BUSER),
      .M_AXI_BVALID(M_AXI_BVALID),
      .M_AXI_BREADY(M_AXI_BREADY),

      .M_AXI_ARID(M_AXI_ARID),
      .M_AXI_ARADDR(M_AXI_ARADDR),
      .M_AXI_ARLEN(M_AXI_ARLEN),
      .M_AXI_ARSIZE(M_AXI_ARSIZE),
      .M_AXI_ARBURST(M_AXI_ARBURST),
      .M_AXI_ARLOCK(M_AXI_ARLOCK),
      .M_AXI_ARCACHE(M_AXI_ARCACHE),
      .M_AXI_ARPROT(M_AXI_ARPROT),
      .M_AXI_ARQOS(M_AXI_ARQOS),
      .M_AXI_ARUSER(M_AXI_ARUSER),
      .M_AXI_ARVALID(M_AXI_ARVALID),
      .M_AXI_ARREADY(M_AXI_ARREADY),

      .M_AXI_RID(M_AXI_RID),
      .M_AXI_RDATA(M_AXI_RDATA),
      .M_AXI_RRESP(M_AXI_RRESP),
      .M_AXI_RLAST(M_AXI_RLAST),
      .M_AXI_RUSER(M_AXI_RUSER),
      .M_AXI_RVALID(M_AXI_RVALID),
      .M_AXI_RREADY(M_AXI_RREADY),

      .MASTER_RST(FIFO_RST),

      .WR_START(wr_start_fsync),
      .WR_ADRS(wr_adrs),
      .WR_LEN(wr_len),
      .WR_READY(wr_ready),
      .WR_FIFO_RE(wr_fifo_re),
      .WR_FIFO_EMPTY(wr_fifo_empty),
      .WR_FIFO_AEMPTY(wr_fifo_aempty),
      .WR_FIFO_DATA(wr_fifo_data),

      .RD_START(rd_start_fsync),
      .RD_ADRS(rd_adrs),
      .RD_LEN(rd_len),
      .RD_READY(rd_ready),
      .RD_FIFO_WE(rd_fifo_we),
      .RD_FIFO_FULL(rd_fifo_full),
      .RD_FIFO_AFULL(rd_fifo_afull),
      .RD_FIFO_DATA(rd_fifo_data),

      .DEBUG(debug_master)
    );

    assign rd_start_fsync = rd_start & FSYNC;
//    assign wr_start_fsync = wr_start & FSYNC;
    assign wr_start_fsync = wr_start;

  aq_fifo u_aq_wfifo
    (
      .RST(FIFO_RST),

      .WRCLK(M_AXI_ACLK),
      .WREN(rd_fifo_we),
      .DI(rd_fifo_data),
      .FULL(rd_fifo_full),
      .AFULL(rd_fifo_afull),
      .WRCOUNT(),

      .RDCLK(FIFO_RD_CLK),
      .RDEN(FIFO_RD_EN),
      .DO(FIFO_RD_DOUT),
      .EMPTY(FIFO_RD_EMPTY),
      .AEMPTY(),
      .RDCOUNT()
    );
  always @(posedge M_AXI_ACLK or posedge FIFO_RST) begin
    if(FIFO_RST) begin
      rd_fifo_wrcnt <= 32'd0;
    end else begin
      if(rd_fifo_we) begin
        rd_fifo_wrcnt <= rd_fifo_wrcnt +32'd1;
      end
    end
  end
  always @(posedge FIFO_RD_CLK or posedge FIFO_RST) begin
    if(FIFO_RST) begin
      rd_fifo_rdcnt <= 32'd0;
    end else begin
      if(FIFO_RD_EN) begin
        rd_fifo_rdcnt <= rd_fifo_rdcnt +32'd1;
      end
    end
  end

  wire fifo_wr_en_w;
  assign fifo_wr_en_w = FIFO_WR_EN & ~wr_ready;

  aq_fifo u_aq_rfifo
    (
      .RST(FIFO_RST),

      .WRCLK(FIFO_WR_CLK),
      .WREN(fifo_wr_en_w),
      .DI(FIFO_WR_DIN),
      .FULL(FIFO_WR_FULL),
      .AFULL(),
      .WRCOUNT(),

      .RDCLK(M_AXI_ACLK),
      .RDEN(wr_fifo_re),
      .DO(wr_fifo_data),
      .EMPTY(wr_fifo_empty),
      .AEMPTY(wr_fifo_aempty),
      .RDCOUNT()
    );
  always @(posedge FIFO_WR_CLK or posedge FIFO_RST) begin
    if(FIFO_RST) begin
      wr_fifo_wrcnt <= 32'd0;
    end else begin
      if(fifo_wr_en_w) begin
        wr_fifo_wrcnt <= wr_fifo_wrcnt +32'd1;
      end
    end
  end
  always @(posedge M_AXI_ACLK or posedge FIFO_RST) begin
    if(FIFO_RST) begin
      wr_fifo_rdcnt <= 32'd0;
    end else begin
      if(wr_fifo_re) begin
        wr_fifo_rdcnt <= wr_fifo_rdcnt +32'd1;
      end
    end
  end

  wire fifo_rst_w;

  aq_axi_dma_ctl u_aq_axi_dma_ctl
    (
      .RST_N(ARESETN),
      .CLK(LOCAL_CLK),

      .LOCAL_CS(LOCAL_CS),
      .LOCAL_RNW(LOCAL_RNW),
      .LOCAL_ACK(LOCAL_ACK),
      .LOCAL_ADDR(LOCAL_ADDR),
      .LOCAL_BE(LOCAL_BE),
      .LOCAL_WDATA(LOCAL_WDATA),
      .LOCAL_RDATA(LOCAL_RDATA),

      .CMD_CLK(M_AXI_ACLK),

      .WR_START(wr_start),
      .WR_ADRS(wr_adrs),
      .WR_COUNT(wr_len),
      .WR_READY(wr_ready),
      .WR_FIFO_EMPTY(wr_fifo_empty),
      .WR_FIFO_AEMPTY(wr_fifo_aempty),
      .WR_FIFO_FULL(FIFO_FULL),
      .WR_FIFO_AFULL(1'b0),

      .RD_START(rd_start),
      .RD_ADRS(rd_adrs),
      .RD_COUNT(rd_len),
      .RD_READY(rd_ready),
      .RD_FIFO_EMPTY(FIFO_EMPTY),
      .RD_FIFO_AEMPTY(1'b0),
      .RD_FIFO_FULL(rd_fifo_full),
      .RD_FIFO_AFULL(rd_fifo_afull),

      .MASTER_STATUS(debug_master),
      .FIFO_STATUS0(rd_fifo_wrcnt),
      .FIFO_STATUS1(rd_fifo_rdcnt),
      .FIFO_STATUS2(wr_fifo_wrcnt),
      .FIFO_STATUS3(wr_fifo_rdcnt),

      .FIFO_RST(fifo_rst_w),

      .DEBUG(debug_ctl)
    );

    assign FIFO_RST = fifo_rst_w | FSYNC_RST;
    assign DEBUG[31:0] = {32'd0};
endmodule

