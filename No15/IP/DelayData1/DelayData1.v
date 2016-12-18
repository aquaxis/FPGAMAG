/*
 * Copyright (C)2016 AQUAXIS TECHNOLOGY.
 *  Don't remove this header.
 * When you use this source, there is a need to inherit this header.
 *
 * License
 *  For no commercial -
 *   License:     The Open Software License 3.0
 *   License URI: http://www.opensource.org/licenses/OSL-3.0
 *
 *  For commmercial -
 *   License:     AQUAXIS License 1.0
 *   License URI: http://www.aquaxis.com/licenses
 *
 * For further information please contact.
 *	URI:    http://www.aquaxis.com/
 *	E-Mail: info(at)aquaxis.com
 */
/*
 * 55t delay buffer for CalcSumMag
 */
module DelayData1
  (
   input         RST_N,
   input         CLK,

   input         TIMING,
   input [31:0]  DATA_IN,

   output        RETIMING1,
   output        RETIMING2,
   output        RETIMING3,
   output        RETIMING4,
   output [31:0] DATA_OUT
   );

   reg [255:0]    reg_retiming;

   always @(posedge CLK) begin
      reg_retiming[255:0] <= {reg_retiming[254:0], TIMING};
   end

   assign RETIMING1  = reg_retiming[43-1];
   assign RETIMING2  = reg_retiming[43+9-1];
   assign RETIMING3  = reg_retiming[51+43+9-1];
   assign RETIMING4  = reg_retiming[0+51+43+9-1];

   localparam DELAY = (51+43+9-1+1);

   reg [7:0] addra, addrb;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         addra <= DELAY;
         addrb <= 0;
      end else begin
         if(addra == DELAY) begin
            addra <= 0;
         end else begin
            addra <= addra + 1;
         end
         if(addrb == DELAY) begin
            addrb <= 0;
         end else begin
            addrb <= addrb + 1;
         end
      end
   end

   blk_mem_gen_0 u_blk_mem_gen_0
     (
      .clka(CLK),
      .wea(1'b1),
      .addra(addra),
      .dina(DATA_IN),
      .douta(),
      .clkb(CLK),
      .web(1'b0),
      .addrb(addrb),
      .dinb(32'd0),
      .doutb(DATA_OUT)
      );

endmodule
