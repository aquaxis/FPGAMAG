/*
 * アドレスセレクタ
 */
module AddrSel1
  (
   input        RST_N,
   input        CLK,

   input        VALID_IN,
   input [9:0]  ADDR_IN,

   output       VALID_OUT,
   output [9:0] ADDR_OUT
   );

   reg          reg_valid;
   reg [9:0]    reg_addr;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         reg_valid <= 1'b0;
         reg_addr[9:0] <= 10'd0;
      end else begin
         reg_valid <= VALID_IN;
         reg_addr[9:0] <= ADDR_IN[9:0];
      end
   end

   assign VALID_OUT = reg_valid;
   assign ADDR_OUT[9:0] = (reg_valid)?reg_addr[9:0]:ADDR_IN[9:0];
endmodule
