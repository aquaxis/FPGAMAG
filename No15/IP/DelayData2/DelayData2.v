module DelayData2
  (
   input RST_N,
   input CLK,

   input [3:0] DATA_IN,

   output [3:0] DATA_OUT
   );

   reg [3:0] 	 d00, d01, d02, d03, d04, d05, d06, d07, d08, d09;
   reg [3:0] 	 d10, d11, d12, d13, d14, d15, d16, d17, d18, d19;
   reg [3:0] 	 d20, d21, d22, d23, d24, d25, d26, d27, d28, d29;
   reg [3:0] 	 d30, d31, d32, d33, d34, d35, d36, d37, d38, d39;
   reg [3:0] 	 d40, d41, d42, d43, d44, d45, d46, d47, d48, d49;
   reg [3:0] 	 d50, d51, d52, d53, d54, d55, d56, d57;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 d00 <= 0;
	  end else begin // if (!RST_N)
		 d00 <= DATA_IN;
		 d01 <= d00;
		 d02 <= d01;
		 d03 <= d02;
		 d04 <= d03;
		 d05 <= d04;
		 d06 <= d05;
		 d07 <= d06;
		 d08 <= d07;
		 d09 <= d08;
		 d10 <= d09;
		 d11 <= d10;
		 d12 <= d11;
		 d13 <= d12;
		 d14 <= d13;
		 d15 <= d14;
		 d16 <= d15;
		 d17 <= d16;
		 d18 <= d17;
		 d19 <= d18;
		 d20 <= d19;
		 d21 <= d20;
		 d22 <= d21;
		 d23 <= d22;
		 d24 <= d23;
		 d25 <= d24;
		 d26 <= d25;
		 d27 <= d26;
		 d28 <= d27;
		 d29 <= d28;
		 d30 <= d29;
		 d31 <= d30;
		 d32 <= d31;
		 d33 <= d32;
		 d34 <= d33;
		 d35 <= d34;
		 d36 <= d35;
		 d37 <= d36;
		 d38 <= d37;
		 d39 <= d38;
		 d40 <= d39;
		 d41 <= d40;
		 d42 <= d41;
		 d43 <= d42;
		 d44 <= d43;
		 d45 <= d44;
		 d46 <= d45;
		 d47 <= d46;
		 d48 <= d47;
		 d49 <= d48;
		 d50 <= d49;
		 d51 <= d50;
		 d52 <= d51;
		 d53 <= d52;
		 d54 <= d53;
		 d55 <= d54;
		 d56 <= d55;
		 d57 <= d56;
	  end
   end

   assign DATA_OUT = d57;

endmodule // DelayData1
