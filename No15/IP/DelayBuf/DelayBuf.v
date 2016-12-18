 module DelayBuf
  (
   input 		 RST_N,
   input 		 CLK,

   input [31:0]  A,
   output [31:0] Q

   );

   reg [31:0] 	 d;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 d <= 0;
	  end else begin
		 d <= A;
	  end
   end
   assign Q = d;

endmodule // DelayBuf
