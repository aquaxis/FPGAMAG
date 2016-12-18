/*
 * 9つの入力から選択する回路
 */
module DataSel2
  (
   input 		 RST_N,
   input 		 CLK,

   input  	 SEL,

   input [31:0]  DIN,

   output [31:0] DOUT
   );

   assign DOUT[31:0] = (SEL)?DIN[31:0]:32'd0;
endmodule
