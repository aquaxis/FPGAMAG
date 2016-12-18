/*
 * 9つの入力から選択する回路
 */
module DataSel4
  (
   input 		 RST_N,
   input 		 CLK,

   input [1:0] 	 SEL,

   input [7:0] DIN0,
   input [7:0] DIN1,
   input [7:0] DIN2,

   output [7:0] DOUT0,
   output [7:0] DOUT1,
   output [7:0] DOUT2
   );

   assign DOUT0 = (SEL == 0)?DIN2:(SEL == 1)?DIN0:(SEL == 2)?DIN1:8'd0;
   assign DOUT1 = (SEL == 0)?DIN0:(SEL == 1)?DIN1:(SEL == 2)?DIN2:8'd0;
   assign DOUT2 = (SEL == 0)?DIN1:(SEL == 1)?DIN2:(SEL == 2)?DIN0:8'd0;

endmodule
