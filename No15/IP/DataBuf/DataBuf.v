module DataBuf
  (
   input         RST_N,
   input         CLK,

   input [31:0]  A,
   input         C,
   output [31:0] Q

   );

   reg [31:0] 	 d;

   always @(posedge CLK) begin
      if(C) begin
		 d <= A;
      end
   end
   assign Q = d;

endmodule
