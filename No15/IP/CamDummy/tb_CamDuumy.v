`timescale 1ns / 1ps
module tb_CamDummy;

   reg RST_N;
   reg CLK;

   wire LOCAL_CS;
   wire LOCAL_RNW;

   wire LOCAL_ACK;
   wire [31:0] LOCAL_ADDR;
   wire [3:0]  LOCAL_BE;
   wire [31:0] LOCAL_WDATA;
   wire [31:0] LOCAL_RDATA;

   wire        CAM_CLK;
   wire        CAM_ENA;
   wire        CAM_VSYNC;
   wire        CAM_HSYNC;
   wire [7:0]  CAM_DATA;

   wire        A_CLK;
   wire [9:0]  A_ADDR;
   wire [3:0]  A_WE;
   reg [31:0]  A_DI;
   wire [31:0] A_DO;

   wire        B_CLK;
   wire [11:0]  B_ADDR;
   reg [7:0]  B_DI;

   CamDummy u_CamDummy
	 (
	  .RST_N(RST_N),
	  .CLK(CLK),

	  .LOCAL_CS(LOCAL_CS),
	  .LOCAL_RNW(LOCAL_RNW),
	  .LOCAL_ACK(LOCAL_ACK),
	  .LOCAL_ADDR(LOCAL_ADDR),
	  .LOCAL_BE(LOCAL_BE),
	  .LOCAL_WDATA(LOCAL_WDATA),
	  .LOCAL_RDATA(LOCAL_RDATA),

      .CAM_CLK(CAM_CLK),
      .CAM_ENA(CAM_ENA),
      .CAM_VSYNC(CAM_VSYNC),
      .CAM_HSYNC(CAM_HSYNC),
      .CAM_DATA(CAM_DATA),
   
      .A_CLK(A_CLK),
      .A_ADDR(A_ADDR),
      .A_WE(A_WE),
      .A_DI(A_DI),
      .A_DO(A_DO),
   
      .B_CLK(B_CLK),
      .B_ADDR(B_ADDR),
      .B_DI(B_DI)
	  );

   local_bus_model u_local
	 (
	  .CLK(CLK),

	  .LOCAL_CS(LOCAL_CS),
	  .LOCAL_RNW(LOCAL_RNW),
	  .LOCAL_ACK(LOCAL_ACK),
	  .LOCAL_ADDR(LOCAL_ADDR),
	  .LOCAL_BE(LOCAL_BE),
	  .LOCAL_WDATA(LOCAL_WDATA),
	  .LOCAL_RDATA(LOCAL_RDATA)
	  );

   localparam CLK100M = 10;

   initial begin
	  RST_N <= 1'b0;
	  CLK <= 1'b0;
	  #100;

	  @(posedge CLK);
	  RST_N <= 1'b1;
	  $display("Simulatin Start");
   end

   always  begin
	  #(CLK100M/2) CLK <= ~CLK;
   end

  always @(posedge CLK) begin
    B_DI[7:0] <= B_ADDR[7:0];
  end

   initial begin
	  wait(LOCAL_ADDR == 32'hFFFF_FFFF);
	  $display("Simulatin Finish");
	  $finish();
   end

   initial begin
	  wait(RST_N);

	  @(posedge CLK);

	  $display("Process Start");

	  u_local.wdata(32'h0000_1000, 32'h3322_1100);
      u_local.wdata(32'h0000_1004, 32'h7766_5544);
      u_local.wdata(32'h0000_1008, 32'hBBAA_9988);
      u_local.wdata(32'h0000_100C, 32'hFFEE_DDCC);
	  u_local.wdata(32'h0000_1010, 32'h3322_1100);
      u_local.wdata(32'h0000_1014, 32'h7766_5544);
      u_local.wdata(32'h0000_1018, 32'hBBAA_9988);
      u_local.wdata(32'h0000_101C, 32'hFFEE_DDCC);
	  u_local.wdata(32'h0000_1020, 32'h3322_1100);
      u_local.wdata(32'h0000_1024, 32'h7766_5544);
      u_local.wdata(32'h0000_1028, 32'hBBAA_9988);
      u_local.wdata(32'h0000_102C, 32'hFFEE_DDCC);
	  u_local.wdata(32'h0000_1030, 32'h3322_1100);
      u_local.wdata(32'h0000_1034, 32'h7766_5544);
      u_local.wdata(32'h0000_1038, 32'hBBAA_9988);
      u_local.wdata(32'h0000_103C, 32'hFFEE_DDCC);

	  u_local.wdata(32'h0000_0004, 32'h0000_0500);
	  u_local.wdata(32'h0000_0008, 32'h0000_0000);
	  u_local.wdata(32'h0000_0000, 32'h0000_0000);

	  u_local.rdata(32'h0000_0000);

	  repeat (2000) @(posedge CAM_CLK);

	  u_local.wdata(32'h0000_0004, 32'h0000_0500);
	  u_local.wdata(32'h0000_0008, 32'h0000_0001);
	  u_local.wdata(32'h0000_0000, 32'h0000_0000);

	  repeat (2000) @(posedge CAM_CLK);

	  u_local.rdata(32'h0000_0000);

	  repeat (10) @(posedge CAM_CLK);

	  u_local.rdata(32'hFFFF_FFFF);

   end


endmodule

module local_bus_model
  (
   input CLK,

   output reg LOCAL_CS,
   output reg LOCAL_RNW,
   input LOCAL_ACK,
   output reg [31:0] LOCAL_ADDR,
   output reg [3:0] LOCAL_BE,
   output reg [31:0] LOCAL_WDATA,
   input [31:0] LOCAL_RDATA
   );

   initial begin
	  LOCAL_CS = 1'b0;
	  LOCAL_ADDR[31:0] = 32'd0;
	  LOCAL_BE[3:0] = 4'd0;
	  LOCAL_WDATA = 32'd0;
	  LOCAL_RNW = 1'b0;
   end

   task wdata;
	  input [31:0] addr;
	  input [31:0] data;
	  begin
		 @(negedge CLK);

		 LOCAL_CS <= 1'b1;
		 LOCAL_ADDR <= addr;
		 LOCAL_RNW <= 1'b0;
		 LOCAL_WDATA <= data;
		 $display("LOCAL Write[%08X]: %08X", addr, LOCAL_WDATA);

		 @(negedge CLK);

		 wait(LOCAL_ACK);
		 LOCAL_CS <= 1'b0;
		 LOCAL_ADDR <= 32'd0;
		 LOCAL_WDATA <= 32'd0;

		 @(negedge CLK);
	  end
   endtask

   task rdata;
	  input [31:0] addr;
	  begin
		 @(negedge CLK);

		 LOCAL_CS <= 1'b1;
		 LOCAL_ADDR <= addr;
		 LOCAL_RNW <= 1'b1;

		 @(negedge CLK);

		 wait(LOCAL_ACK);
		 LOCAL_CS <= 1'b0;
		 $display("LOCAL Read[%08X]: %08X", addr, LOCAL_RDATA);

		 @(negedge CLK);
	  end
   endtask

endmodule
