/*
 * 9つの入力から選択する回路
 */
module Selector9
  (
   input 		 RST_N,
   input 		 CLK,

   input [3:0] 	 SEL,

   input [31:0]  IN_0,
   input [31:0]  IN_1,
   input [31:0]  IN_2,
   input [31:0]  IN_3,
   input [31:0]  IN_4,
   input [31:0]  IN_5,
   input [31:0]  IN_6,
   input [31:0]  IN_7,
   input [31:0]  IN_8,

   output [31:0] OUT_0
   );

   reg [31:0] 	 d;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 d[31:0] <= 32'd0;
	  end else begin
		 case(SEL[3:0])
		   4'd0:    d[31:0] <= IN_0[31:0];
		   4'd1:    d[31:0] <= IN_1[31:0];
		   4'd2:    d[31:0] <= IN_2[31:0];
		   4'd3:    d[31:0] <= IN_3[31:0];
		   4'd4:    d[31:0] <= IN_4[31:0];
		   4'd5:    d[31:0] <= IN_5[31:0];
		   4'd6:    d[31:0] <= IN_6[31:0];
		   4'd7:    d[31:0] <= IN_7[31:0];
		   4'd8:    d[31:0] <= IN_8[31:0];
		   default: d[31:0] <= 32'd0;
		 endcase
	  end
   end
   
   assign OUT_0[31:0] = d[31:0];
endmodule
