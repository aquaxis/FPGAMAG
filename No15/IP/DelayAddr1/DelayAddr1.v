module DelayAddr1
  (
   input RST_N,
   input CLK,

   input [9:0] ADDR_IN,

   output [9:0] ADDR0,
   output [9:0] ADDR1,
   output [9:0] ADDR2,
   output [9:0] ADDR3,
   output [9:0] ADDR4,
   output [9:0] ADDR5,
   output [9:0] ADDR6,
   output [9:0] ADDR7,
   output [9:0] ADDR8
   );

   reg [9:0] 	reg_addr0;
   reg [9:0] 	reg_addr1;
   reg [9:0] 	reg_addr2;
   reg [9:0] 	reg_addr3;
   reg [9:0] 	reg_addr4;
   reg [9:0] 	reg_addr5;
   reg [9:0] 	reg_addr6;
   reg [9:0] 	reg_addr7;
   reg [9:0] 	reg_addr8;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 reg_addr0[9:0] <= 10'd0;
		 reg_addr1[9:0] <= 10'd0;
		 reg_addr2[9:0] <= 10'd0;
		 reg_addr3[9:0] <= 10'd0;
		 reg_addr4[9:0] <= 10'd0;
		 reg_addr5[9:0] <= 10'd0;
		 reg_addr6[9:0] <= 10'd0;
		 reg_addr7[9:0] <= 10'd0;
		 reg_addr8[9:0] <= 10'd0;
	  end else begin // if (!RST_N)
		 reg_addr0[9:0] <= ADDR_IN[9:0];
		 reg_addr1[9:0] <= reg_addr0[9:0];
		 reg_addr2[9:0] <= reg_addr1[9:0];
		 reg_addr3[9:0] <= reg_addr2[9:0];
		 reg_addr4[9:0] <= reg_addr3[9:0];
		 reg_addr5[9:0] <= reg_addr4[9:0];
		 reg_addr6[9:0] <= reg_addr5[9:0];
		 reg_addr7[9:0] <= reg_addr6[9:0];
		 reg_addr8[9:0] <= reg_addr7[9:0];
	  end
   end

   assign ADDR0[9:0] = reg_addr0[9:0];
   assign ADDR1[9:0] = reg_addr1[9:0];
   assign ADDR2[9:0] = reg_addr2[9:0];
   assign ADDR3[9:0] = reg_addr3[9:0];
   assign ADDR4[9:0] = reg_addr4[9:0];
   assign ADDR5[9:0] = reg_addr5[9:0];
   assign ADDR6[9:0] = reg_addr6[9:0];
   assign ADDR7[9:0] = reg_addr7[9:0];
   assign ADDR8[9:0] = reg_addr8[9:0];

endmodule // DelayAddr1
