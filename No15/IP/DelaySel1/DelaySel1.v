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
module DelaySel1
  (
   input         RST_N,
   input         CLK,

   input [3:0]   SEL,

   input [31:0]  DATA_I0,
   input [31:0]  DATA_I1,
   input [31:0]  DATA_I2,
   input [31:0]  DATA_I3,
   input [31:0]  DATA_I4,
   input [31:0]  DATA_I5,
   input [31:0]  DATA_I6,
   input [31:0]  DATA_I7,
   input [31:0]  DATA_I8,

   output        RETIMING,

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

   reg [31:0] 	reg_data00, reg_data01, reg_data02, reg_data03, reg_data04, reg_data05, reg_data06, reg_data07, reg_data08;
   reg [31:0] 	reg_data10, reg_data11, reg_data12, reg_data13, reg_data14, reg_data15, reg_data16, reg_data17, reg_data18;
   reg [31:0] 	reg_data20, reg_data21, reg_data22, reg_data23, reg_data24, reg_data25, reg_data26, reg_data27, reg_data28;
   reg [31:0] 	reg_data30, reg_data31, reg_data32, reg_data33, reg_data34, reg_data35, reg_data36, reg_data37, reg_data38;
   reg [31:0] 	reg_data40, reg_data41, reg_data42, reg_data43, reg_data44, reg_data45, reg_data46, reg_data47, reg_data48;
   reg [31:0] 	reg_data50, reg_data51, reg_data52, reg_data53, reg_data54, reg_data55, reg_data56, reg_data57, reg_data58;
   reg [31:0] 	reg_data60, reg_data61, reg_data62, reg_data63, reg_data64, reg_data65, reg_data66, reg_data67, reg_data68;
   reg [31:0] 	reg_data70, reg_data71, reg_data72, reg_data73, reg_data74, reg_data75, reg_data76, reg_data77, reg_data78;
   reg [31:0] 	reg_data80, reg_data81, reg_data82, reg_data83, reg_data84, reg_data85, reg_data86, reg_data87, reg_data88;
   reg [3:0] 	reg_sel0, reg_sel1, reg_sel2, reg_sel3, reg_sel4, reg_sel5, reg_sel6, reg_sel7, reg_sel8;
   reg [31:0] 	reg_data0, reg_data1, reg_data2, reg_data3, reg_data4, reg_data5, reg_data6, reg_data7, reg_data8;
   reg          reg_retiming;

   // Delay Buffer
   always @(posedge CLK) begin
	  reg_sel0[3:0] <= SEL[3:0];
	  reg_sel1[3:0] <= reg_sel0[3:0];
	  reg_sel2[3:0] <= reg_sel1[3:0];
	  reg_sel3[3:0] <= reg_sel2[3:0];
	  reg_sel4[3:0] <= reg_sel3[3:0];
	  reg_sel5[3:0] <= reg_sel4[3:0];
	  reg_sel6[3:0] <= reg_sel5[3:0];
	  reg_sel7[3:0] <= reg_sel6[3:0];
	  reg_sel8[3:0] <= reg_sel7[3:0];

	  reg_data00[31:0] <= DATA_I0[31:0];
	  reg_data01[31:0] <= reg_data00[31:0];
	  reg_data02[31:0] <= reg_data01[31:0];
	  reg_data03[31:0] <= reg_data02[31:0];
	  reg_data04[31:0] <= reg_data03[31:0];
	  reg_data05[31:0] <= reg_data04[31:0];
	  reg_data06[31:0] <= reg_data05[31:0];
	  reg_data07[31:0] <= reg_data06[31:0];
	  reg_data08[31:0] <= reg_data07[31:0];

	  reg_data10[31:0] <= DATA_I1[31:0];
	  reg_data11[31:0] <= reg_data10[31:0];
	  reg_data12[31:0] <= reg_data11[31:0];
	  reg_data13[31:0] <= reg_data12[31:0];
	  reg_data14[31:0] <= reg_data13[31:0];
	  reg_data15[31:0] <= reg_data14[31:0];
	  reg_data16[31:0] <= reg_data15[31:0];
	  reg_data17[31:0] <= reg_data16[31:0];
	  reg_data18[31:0] <= reg_data17[31:0];

	  reg_data20[31:0] <= DATA_I2[31:0];
	  reg_data21[31:0] <= reg_data20[31:0];
	  reg_data22[31:0] <= reg_data21[31:0];
	  reg_data23[31:0] <= reg_data22[31:0];
	  reg_data24[31:0] <= reg_data23[31:0];
	  reg_data25[31:0] <= reg_data24[31:0];
	  reg_data26[31:0] <= reg_data25[31:0];
	  reg_data27[31:0] <= reg_data26[31:0];
	  reg_data28[31:0] <= reg_data27[31:0];

	  reg_data30[31:0] <= DATA_I3[31:0];
	  reg_data31[31:0] <= reg_data30[31:0];
	  reg_data32[31:0] <= reg_data31[31:0];
	  reg_data33[31:0] <= reg_data32[31:0];
	  reg_data34[31:0] <= reg_data33[31:0];
	  reg_data35[31:0] <= reg_data34[31:0];
	  reg_data36[31:0] <= reg_data35[31:0];
	  reg_data37[31:0] <= reg_data36[31:0];
	  reg_data38[31:0] <= reg_data37[31:0];

	  reg_data40[31:0] <= DATA_I4[31:0];
	  reg_data41[31:0] <= reg_data40[31:0];
	  reg_data42[31:0] <= reg_data41[31:0];
	  reg_data43[31:0] <= reg_data42[31:0];
	  reg_data44[31:0] <= reg_data43[31:0];
	  reg_data45[31:0] <= reg_data44[31:0];
	  reg_data46[31:0] <= reg_data45[31:0];
	  reg_data47[31:0] <= reg_data46[31:0];
	  reg_data48[31:0] <= reg_data47[31:0];

	  reg_data50[31:0] <= DATA_I5[31:0];
	  reg_data51[31:0] <= reg_data50[31:0];
	  reg_data52[31:0] <= reg_data51[31:0];
	  reg_data53[31:0] <= reg_data52[31:0];
	  reg_data54[31:0] <= reg_data53[31:0];
	  reg_data55[31:0] <= reg_data54[31:0];
	  reg_data56[31:0] <= reg_data55[31:0];
	  reg_data57[31:0] <= reg_data56[31:0];
	  reg_data58[31:0] <= reg_data57[31:0];

	  reg_data60[31:0] <= DATA_I6[31:0];
	  reg_data61[31:0] <= reg_data60[31:0];
	  reg_data62[31:0] <= reg_data61[31:0];
	  reg_data63[31:0] <= reg_data62[31:0];
	  reg_data64[31:0] <= reg_data63[31:0];
	  reg_data65[31:0] <= reg_data64[31:0];
	  reg_data66[31:0] <= reg_data65[31:0];
	  reg_data67[31:0] <= reg_data66[31:0];
	  reg_data68[31:0] <= reg_data67[31:0];

	  reg_data70[31:0] <= DATA_I7[31:0];
	  reg_data71[31:0] <= reg_data70[31:0];
	  reg_data72[31:0] <= reg_data71[31:0];
	  reg_data73[31:0] <= reg_data72[31:0];
	  reg_data74[31:0] <= reg_data73[31:0];
	  reg_data75[31:0] <= reg_data74[31:0];
	  reg_data76[31:0] <= reg_data75[31:0];
	  reg_data77[31:0] <= reg_data76[31:0];
	  reg_data78[31:0] <= reg_data77[31:0];

	  reg_data80[31:0] <= DATA_I8[31:0];
	  reg_data81[31:0] <= reg_data80[31:0];
	  reg_data82[31:0] <= reg_data81[31:0];
	  reg_data83[31:0] <= reg_data82[31:0];
	  reg_data84[31:0] <= reg_data83[31:0];
	  reg_data85[31:0] <= reg_data84[31:0];
	  reg_data86[31:0] <= reg_data85[31:0];
	  reg_data87[31:0] <= reg_data86[31:0];
	  reg_data88[31:0] <= reg_data87[31:0];
   end

   // Selector
   always @(posedge CLK) begin
      reg_retiming <= (reg_sel8[3:0] == 4'd0)?1'b1:1'b0;
	  case(reg_sel8[3:0])
		4'd0:
		  begin
			 reg_data0[31:0] <= reg_data00[31:0];
			 reg_data1[31:0] <= reg_data01[31:0];
			 reg_data2[31:0] <= reg_data02[31:0];
			 reg_data3[31:0] <= reg_data03[31:0];
			 reg_data4[31:0] <= reg_data04[31:0];
			 reg_data5[31:0] <= reg_data05[31:0];
			 reg_data6[31:0] <= reg_data06[31:0];
			 reg_data7[31:0] <= reg_data07[31:0];
			 reg_data8[31:0] <= reg_data08[31:0];
		  end
		4'd1:
		  begin
			 reg_data0[31:0] <= reg_data10[31:0];
			 reg_data1[31:0] <= reg_data11[31:0];
			 reg_data2[31:0] <= reg_data12[31:0];
			 reg_data3[31:0] <= reg_data13[31:0];
			 reg_data4[31:0] <= reg_data14[31:0];
			 reg_data5[31:0] <= reg_data15[31:0];
			 reg_data6[31:0] <= reg_data16[31:0];
			 reg_data7[31:0] <= reg_data17[31:0];
			 reg_data8[31:0] <= reg_data18[31:0];
		  end
		4'd2:
		  begin
			 reg_data0[31:0] <= reg_data20[31:0];
			 reg_data1[31:0] <= reg_data21[31:0];
			 reg_data2[31:0] <= reg_data22[31:0];
			 reg_data3[31:0] <= reg_data23[31:0];
			 reg_data4[31:0] <= reg_data24[31:0];
			 reg_data5[31:0] <= reg_data25[31:0];
			 reg_data6[31:0] <= reg_data26[31:0];
			 reg_data7[31:0] <= reg_data27[31:0];
			 reg_data8[31:0] <= reg_data28[31:0];
		  end
		4'd3:
		  begin
			 reg_data0[31:0] <= reg_data30[31:0];
			 reg_data1[31:0] <= reg_data31[31:0];
			 reg_data2[31:0] <= reg_data32[31:0];
			 reg_data3[31:0] <= reg_data33[31:0];
			 reg_data4[31:0] <= reg_data34[31:0];
			 reg_data5[31:0] <= reg_data35[31:0];
			 reg_data6[31:0] <= reg_data36[31:0];
			 reg_data7[31:0] <= reg_data37[31:0];
			 reg_data8[31:0] <= reg_data38[31:0];
		  end
		4'd4:
		  begin
			 reg_data0[31:0] <= reg_data40[31:0];
			 reg_data1[31:0] <= reg_data41[31:0];
			 reg_data2[31:0] <= reg_data42[31:0];
			 reg_data3[31:0] <= reg_data43[31:0];
			 reg_data4[31:0] <= reg_data44[31:0];
			 reg_data5[31:0] <= reg_data45[31:0];
			 reg_data6[31:0] <= reg_data46[31:0];
			 reg_data7[31:0] <= reg_data47[31:0];
			 reg_data8[31:0] <= reg_data48[31:0];
		  end
		4'd5:
		  begin
			 reg_data0[31:0] <= reg_data50[31:0];
			 reg_data1[31:0] <= reg_data51[31:0];
			 reg_data2[31:0] <= reg_data52[31:0];
			 reg_data3[31:0] <= reg_data53[31:0];
			 reg_data4[31:0] <= reg_data54[31:0];
			 reg_data5[31:0] <= reg_data55[31:0];
			 reg_data6[31:0] <= reg_data56[31:0];
			 reg_data7[31:0] <= reg_data57[31:0];
			 reg_data8[31:0] <= reg_data58[31:0];
		  end
		4'd6:
		  begin
			 reg_data0[31:0] <= reg_data60[31:0];
			 reg_data1[31:0] <= reg_data61[31:0];
			 reg_data2[31:0] <= reg_data62[31:0];
			 reg_data3[31:0] <= reg_data63[31:0];
			 reg_data4[31:0] <= reg_data64[31:0];
			 reg_data5[31:0] <= reg_data65[31:0];
			 reg_data6[31:0] <= reg_data66[31:0];
			 reg_data7[31:0] <= reg_data67[31:0];
			 reg_data8[31:0] <= reg_data68[31:0];
		  end
		4'd7:
		  begin
			 reg_data0[31:0] <= reg_data70[31:0];
			 reg_data1[31:0] <= reg_data71[31:0];
			 reg_data2[31:0] <= reg_data72[31:0];
			 reg_data3[31:0] <= reg_data73[31:0];
			 reg_data4[31:0] <= reg_data74[31:0];
			 reg_data5[31:0] <= reg_data75[31:0];
			 reg_data6[31:0] <= reg_data76[31:0];
			 reg_data7[31:0] <= reg_data77[31:0];
			 reg_data8[31:0] <= reg_data78[31:0];
		  end
		4'd8:
		  begin
			 reg_data0[31:0] <= reg_data80[31:0];
			 reg_data1[31:0] <= reg_data81[31:0];
			 reg_data2[31:0] <= reg_data82[31:0];
			 reg_data3[31:0] <= reg_data83[31:0];
			 reg_data4[31:0] <= reg_data84[31:0];
			 reg_data5[31:0] <= reg_data85[31:0];
			 reg_data6[31:0] <= reg_data86[31:0];
			 reg_data7[31:0] <= reg_data87[31:0];
			 reg_data8[31:0] <= reg_data88[31:0];
		  end // case: 4'd0
		default:
		  begin
			 reg_data0[31:0] <= 32'd0;
			 reg_data1[31:0] <= 32'd0;
			 reg_data2[31:0] <= 32'd0;
			 reg_data3[31:0] <= 32'd0;
			 reg_data4[31:0] <= 32'd0;
			 reg_data5[31:0] <= 32'd0;
			 reg_data6[31:0] <= 32'd0;
			 reg_data7[31:0] <= 32'd0;
			 reg_data8[31:0] <= 32'd0;
		  end
		 endcase
   end

   assign RETIMING = reg_retiming;

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
