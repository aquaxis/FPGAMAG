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
 * 9x9 delay and selector
 */
module DelayData3
  (
   input 		 RST_N,
   input 		 CLK,

   input [31:0]  DATA_IN,

   output [31:0] DATA_O0,
   output [31:0] DATA_O1,
   output [31:0] DATA_O2,
   output [31:0] DATA_O3,
   output [31:0] DATA_O4,
   output [31:0] DATA_O5,
   output [31:0] DATA_O6,
   output [31:0] DATA_O7,
   output [31:0] DATA_O8
   );

   reg [31:0] 	reg_data0, reg_data1, reg_data2, reg_data3, reg_data4, reg_data5, reg_data6, reg_data7, reg_data8;

   // Delay Buffer
   always @(posedge CLK) begin
	  reg_data0[31:0] <= DATA_IN[31:0];
	  reg_data1[31:0] <= reg_data0[31:0];
	  reg_data2[31:0] <= reg_data1[31:0];
	  reg_data3[31:0] <= reg_data2[31:0];
	  reg_data4[31:0] <= reg_data3[31:0];
	  reg_data5[31:0] <= reg_data4[31:0];
	  reg_data6[31:0] <= reg_data5[31:0];
	  reg_data7[31:0] <= reg_data6[31:0];
	  reg_data8[31:0] <= reg_data7[31:0];
   end

   assign DATA_O0[31:0] = reg_data0[31:0];
   assign DATA_O1[31:0] = reg_data1[31:0];
   assign DATA_O2[31:0] = reg_data2[31:0];
   assign DATA_O3[31:0] = reg_data3[31:0];
   assign DATA_O4[31:0] = reg_data4[31:0];
   assign DATA_O5[31:0] = reg_data5[31:0];
   assign DATA_O6[31:0] = reg_data6[31:0];
   assign DATA_O7[31:0] = reg_data7[31:0];
   assign DATA_O8[31:0] = reg_data8[31:0];

endmodule
