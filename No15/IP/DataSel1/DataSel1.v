/*
 * 9つの入力から選択する回路
 */
module DataSel1
  (
   input 		 RST_N,
   input 		 CLK,

   input [3:0] 	 SEL0,
   input [3:0] 	 SEL1,

   input [31:0]  DIN,

   output [31:0] DOUT
   );

   assign DOUT[31:0] = (SEL0[3:0] == SEL1[3:0])?DIN[31:0]:32'd0;
endmodule
