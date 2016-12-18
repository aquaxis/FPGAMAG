`timescale 1ns / 1ps

module aq_axi_lite_slave_tb;

   reg RST_N, CLK;

    // Write Address Channel
    reg [15:0]  S_AXI_AWADDR;
    reg [3:0]   S_AXI_AWCACHE;  // 4'b0011
    reg [2:0]   S_AXI_AWPROT;   // 3'b000
    reg         S_AXI_AWVALID;
    wire        S_AXI_AWREADY;

    // Write Data Channel
    reg [31:0]  S_AXI_WDATA;
    reg [3:0]   S_AXI_WSTRB;
    reg         S_AXI_WVALID;
    wire        S_AXI_WREADY;

    // Write Response Channel
    wire        S_AXI_BVALID;
    reg         S_AXI_BREADY;
    wire [1:0]  S_AXI_BRESP;

    // Read Address Channel
    reg [15:0]  S_AXI_ARADDR;
    reg [3:0]   S_AXI_ARCACHE;  // 4'b0011
    reg [2:0]   S_AXI_ARPROT;   // 3'b000
    reg         S_AXI_ARVALID;
    wire        S_AXI_ARREADY;

    // Read Data Channel
    wire [31:0] S_AXI_RDATA;
    wire [1:0]  S_AXI_RRESP;
    wire        S_AXI_RVALID;
    reg         S_AXI_RREADY;

    // Local Interface
    wire        LOCAL_CS;
    wire        LOCAL_RNW;
    reg         LOCAL_ACK;
    wire [31:0] LOCAL_ADDR;
    wire [3:0]  LOCAL_BE;
    wire [31:0] LOCAL_WDATA;
    reg [31:0]  LOCAL_RDATA;

    wire [31:0] DEBUG;

   localparam CLK100M = 10;

initial begin
   RST_N <= 1'b0;
   CLK <= 1'b0;
   
   #100;

   @(posedge CLK);

   RST_N <= 1'b1;

   @(posedge CLK);

   $display("Simulatin Start");

   @(posedge CLK);

    S_AXI_ARADDR <= 16'h0123;
    S_AXI_ARVALID <= 1'b1;
    S_AXI_RREADY <= 1'b1;

   @(posedge CLK);


   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
end

always  begin
   #(CLK100M/2) CLK <= ~CLK;
end

initial begin
    wait(S_AXI_RVALID==1'b1);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   $display("Simulatin Finish");
   $finish();
end

initial begin
   wait(!RST_N);

   @(posedge CLK);

   $display("Process Start");

  wait(CLK);

end

reg reg_ack;
reg [31:0] reg_data;

always@(posedge CLK) begin
  reg_ack <= LOCAL_CS;
  reg_data <= LOCAL_ADDR;
end

aq_axi_lite_slave u_aq_axi_lite_slave
(
    // AXI4 Lite Interface
    .ARESETN(RST_N),
    .ACLK(CLK),

    // Write Address Channel
    .S_AXI_AWADDR(32'd0),
    .S_AXI_AWCACHE(4'b0011),  // 4'b0011
    .S_AXI_AWPROT(3'b000),   // 3'b000
    .S_AXI_AWVALID(1'b0),
    .S_AXI_AWREADY(),

    // Write Data Channel
    .S_AXI_WDATA(32'd0),
    .S_AXI_WSTRB(4'd0),
    .S_AXI_WVALID(1'b0),
    .S_AXI_WREADY(),

    // Write Response Channel
    .S_AXI_BVALID(),
    .S_AXI_BREADY(1'b0),
    .S_AXI_BRESP(),

    // Read Address Channel
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARCACHE(4'b0011),  // 4'b0011
    .S_AXI_ARPROT(3'b000),   // 3'b000
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARREADY(S_AXI_ARREADY),

    // Read Data Channel
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RREADY(S_AXI_RREADY),

    // Local Interface
    .LOCAL_CS(LOCAL_CS),
    .LOCAL_RNW(LOCAL_RNW),
    .LOCAL_ACK(reg_ack),
    .LOCAL_ADDR(LOCAL_ADDR),
    .LOCAL_BE(LOCAL_BE),
    .LOCAL_WDATA(LOCAL_WDATA),
    .LOCAL_RDATA(reg_data),

    .DEBUG()
  );
endmodule
