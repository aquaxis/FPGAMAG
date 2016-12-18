/*
 * 9bit Shift
 */
module BitCreate
  (
   input 		RST_N,
   input 		CLK,

   input 		DIN,

   output [8:0] DATA

   );

   reg [8:0] 	reg_buf;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 reg_buf[8:0] <= 9'd0;
	  end else begin
		 reg_buf[8:0] <= {DIN, reg_buf[8:1]};
	  end
   end

   assign DATA[8:0] = reg_buf[8:0];
endmodule
