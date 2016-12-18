/*
 * 9つの入力から選択する回路
 */
module DataSel3
  (
   input         RST_N,
   input         CLK,

   input         SEL,

   input [31:0]  DIN,
   output [31:0] DOUT
   );

   reg           buf_sel;
/*
   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_sel <= 1'b0;
      end else begin
         buf_sel <= SEL;
      end
   end
*/
//   assign DOUT[31:0] = (~buf_sel)?DIN[31:0]:32'd0;
   assign DOUT[31:0] = (~SEL)?DIN[31:0]:32'd0;
endmodule
