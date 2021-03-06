// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="CalcSumMag2,hls_ip_2016_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=8.129000,HLS_SYN_LAT=51,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=16,HLS_SYN_FF=2525,HLS_SYN_LUT=4023}" *)

module CalcSumMag2 (
        ap_clk,
        ap_rst,
        x0,
        x1,
        x2,
        x3,
        x4,
        x5,
        x6,
        x7,
        x8,
        ap_return
);

parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;

input   ap_clk;
input   ap_rst;
input  [31:0] x0;
input  [31:0] x1;
input  [31:0] x2;
input  [31:0] x3;
input  [31:0] x4;
input  [31:0] x5;
input  [31:0] x6;
input  [31:0] x7;
input  [31:0] x8;
output  [31:0] ap_return;

reg   [31:0] x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter5_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter6_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter7_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter8_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter9_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter10_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter11_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter12_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter13_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter14_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter15_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter16_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter17_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter18_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter19_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter20_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter21_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter22_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter23_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter24_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter25_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter26_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter27_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter28_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter29_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter30_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter31_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter32_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter33_x8_read_reg_137;
reg   [31:0] ap_pipeline_reg_pp0_iter34_x8_read_reg_137;
reg   [31:0] x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter5_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter6_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter7_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter8_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter9_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter10_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter11_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter12_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter13_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter14_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter15_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter16_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter17_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter18_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter19_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter20_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter21_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter22_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter23_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter24_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter25_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter26_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter27_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter28_x7_read_reg_142;
reg   [31:0] ap_pipeline_reg_pp0_iter29_x7_read_reg_142;
reg   [31:0] x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter5_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter6_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter7_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter8_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter9_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter10_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter11_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter12_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter13_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter14_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter15_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter16_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter17_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter18_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter19_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter20_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter21_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter22_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter23_x6_read_reg_147;
reg   [31:0] ap_pipeline_reg_pp0_iter24_x6_read_reg_147;
reg   [31:0] x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter5_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter6_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter7_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter8_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter9_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter10_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter11_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter12_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter13_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter14_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter15_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter16_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter17_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter18_x5_read_reg_152;
reg   [31:0] ap_pipeline_reg_pp0_iter19_x5_read_reg_152;
reg   [31:0] x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter5_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter6_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter7_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter8_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter9_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter10_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter11_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter12_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter13_x4_read_reg_157;
reg   [31:0] ap_pipeline_reg_pp0_iter14_x4_read_reg_157;
reg   [31:0] x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter5_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter6_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter7_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter8_x3_read_reg_162;
reg   [31:0] ap_pipeline_reg_pp0_iter9_x3_read_reg_162;
reg   [31:0] x2_read_reg_167;
reg   [31:0] ap_pipeline_reg_pp0_iter1_x2_read_reg_167;
reg   [31:0] ap_pipeline_reg_pp0_iter2_x2_read_reg_167;
reg   [31:0] ap_pipeline_reg_pp0_iter3_x2_read_reg_167;
reg   [31:0] ap_pipeline_reg_pp0_iter4_x2_read_reg_167;
wire   [31:0] grp_fu_98_p2;
reg   [31:0] tmp_reg_182;
wire   [31:0] grp_fu_104_p2;
reg   [31:0] tmp_1_reg_187;
wire   [31:0] grp_fu_108_p2;
reg   [31:0] tmp_2_reg_192;
wire   [31:0] grp_fu_112_p2;
reg   [31:0] tmp_3_reg_197;
wire   [31:0] grp_fu_116_p2;
reg   [31:0] tmp_4_reg_202;
wire   [31:0] grp_fu_120_p2;
reg   [31:0] tmp_5_reg_207;
wire   [31:0] grp_fu_124_p2;
reg   [31:0] tmp_6_reg_212;
wire   [31:0] grp_fu_128_p2;
reg   [31:0] tmp_7_reg_217;
wire   [31:0] grp_fu_132_p2;

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(x0),
    .din1(x1),
    .ce(1'b1),
    .dout(grp_fu_98_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_reg_182),
    .din1(ap_pipeline_reg_pp0_iter4_x2_read_reg_167),
    .ce(1'b1),
    .dout(grp_fu_104_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U3(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_1_reg_187),
    .din1(ap_pipeline_reg_pp0_iter9_x3_read_reg_162),
    .ce(1'b1),
    .dout(grp_fu_108_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U4(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_2_reg_192),
    .din1(ap_pipeline_reg_pp0_iter14_x4_read_reg_157),
    .ce(1'b1),
    .dout(grp_fu_112_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U5(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_3_reg_197),
    .din1(ap_pipeline_reg_pp0_iter19_x5_read_reg_152),
    .ce(1'b1),
    .dout(grp_fu_116_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U6(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_4_reg_202),
    .din1(ap_pipeline_reg_pp0_iter24_x6_read_reg_147),
    .ce(1'b1),
    .dout(grp_fu_120_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U7(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_5_reg_207),
    .din1(ap_pipeline_reg_pp0_iter29_x7_read_reg_142),
    .ce(1'b1),
    .dout(grp_fu_124_p2)
);

CalcSumMag2_fadd_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fadd_bkb_U8(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_6_reg_212),
    .din1(ap_pipeline_reg_pp0_iter34_x8_read_reg_137),
    .ce(1'b1),
    .dout(grp_fu_128_p2)
);

CalcSumMag2_fsqrtcud #(
    .ID( 1 ),
    .NUM_STAGE( 12 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcSumMag2_fsqrtcud_U9(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(ap_const_lv32_0),
    .din1(tmp_7_reg_217),
    .ce(1'b1),
    .dout(grp_fu_132_p2)
);

always @ (posedge ap_clk) begin
    if ((1'b1 == 1'b1)) begin
        ap_pipeline_reg_pp0_iter10_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter9_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter10_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter9_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter10_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter9_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter10_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter9_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter10_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter9_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter11_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter10_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter11_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter10_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter11_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter10_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter11_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter10_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter11_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter10_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter12_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter11_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter12_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter11_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter12_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter11_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter12_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter11_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter12_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter11_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter13_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter12_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter13_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter12_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter13_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter12_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter13_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter12_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter13_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter12_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter14_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter13_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter14_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter13_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter14_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter13_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter14_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter13_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter14_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter13_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter15_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter14_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter15_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter14_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter15_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter14_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter15_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter14_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter16_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter15_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter16_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter15_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter16_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter15_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter16_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter15_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter17_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter16_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter17_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter16_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter17_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter16_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter17_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter16_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter18_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter17_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter18_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter17_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter18_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter17_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter18_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter17_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter19_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter18_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter19_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter18_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter19_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter18_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter19_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter18_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter1_x2_read_reg_167 <= x2_read_reg_167;
        ap_pipeline_reg_pp0_iter1_x3_read_reg_162 <= x3_read_reg_162;
        ap_pipeline_reg_pp0_iter1_x4_read_reg_157 <= x4_read_reg_157;
        ap_pipeline_reg_pp0_iter1_x5_read_reg_152 <= x5_read_reg_152;
        ap_pipeline_reg_pp0_iter1_x6_read_reg_147 <= x6_read_reg_147;
        ap_pipeline_reg_pp0_iter1_x7_read_reg_142 <= x7_read_reg_142;
        ap_pipeline_reg_pp0_iter1_x8_read_reg_137 <= x8_read_reg_137;
        ap_pipeline_reg_pp0_iter20_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter19_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter20_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter19_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter20_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter19_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter21_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter20_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter21_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter20_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter21_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter20_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter22_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter21_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter22_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter21_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter22_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter21_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter23_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter22_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter23_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter22_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter23_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter22_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter24_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter23_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter24_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter23_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter24_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter23_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter25_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter24_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter25_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter24_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter26_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter25_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter26_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter25_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter27_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter26_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter27_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter26_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter28_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter27_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter28_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter27_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter29_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter28_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter29_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter28_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter2_x2_read_reg_167 <= ap_pipeline_reg_pp0_iter1_x2_read_reg_167;
        ap_pipeline_reg_pp0_iter2_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter1_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter2_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter1_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter2_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter1_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter2_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter1_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter2_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter1_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter2_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter1_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter30_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter29_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter31_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter30_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter32_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter31_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter33_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter32_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter34_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter33_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter3_x2_read_reg_167 <= ap_pipeline_reg_pp0_iter2_x2_read_reg_167;
        ap_pipeline_reg_pp0_iter3_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter2_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter3_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter2_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter3_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter2_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter3_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter2_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter3_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter2_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter3_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter2_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter4_x2_read_reg_167 <= ap_pipeline_reg_pp0_iter3_x2_read_reg_167;
        ap_pipeline_reg_pp0_iter4_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter3_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter4_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter3_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter4_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter3_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter4_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter3_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter4_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter3_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter4_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter3_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter5_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter4_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter5_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter4_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter5_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter4_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter5_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter4_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter5_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter4_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter5_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter4_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter6_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter5_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter6_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter5_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter6_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter5_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter6_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter5_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter6_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter5_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter6_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter5_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter7_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter6_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter7_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter6_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter7_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter6_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter7_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter6_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter7_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter6_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter7_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter6_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter8_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter7_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter8_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter7_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter8_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter7_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter8_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter7_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter8_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter7_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter8_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter7_x8_read_reg_137;
        ap_pipeline_reg_pp0_iter9_x3_read_reg_162 <= ap_pipeline_reg_pp0_iter8_x3_read_reg_162;
        ap_pipeline_reg_pp0_iter9_x4_read_reg_157 <= ap_pipeline_reg_pp0_iter8_x4_read_reg_157;
        ap_pipeline_reg_pp0_iter9_x5_read_reg_152 <= ap_pipeline_reg_pp0_iter8_x5_read_reg_152;
        ap_pipeline_reg_pp0_iter9_x6_read_reg_147 <= ap_pipeline_reg_pp0_iter8_x6_read_reg_147;
        ap_pipeline_reg_pp0_iter9_x7_read_reg_142 <= ap_pipeline_reg_pp0_iter8_x7_read_reg_142;
        ap_pipeline_reg_pp0_iter9_x8_read_reg_137 <= ap_pipeline_reg_pp0_iter8_x8_read_reg_137;
        tmp_1_reg_187 <= grp_fu_104_p2;
        tmp_2_reg_192 <= grp_fu_108_p2;
        tmp_3_reg_197 <= grp_fu_112_p2;
        tmp_4_reg_202 <= grp_fu_116_p2;
        tmp_5_reg_207 <= grp_fu_120_p2;
        tmp_6_reg_212 <= grp_fu_124_p2;
        tmp_7_reg_217 <= grp_fu_128_p2;
        tmp_reg_182 <= grp_fu_98_p2;
        x2_read_reg_167 <= x2;
        x3_read_reg_162 <= x3;
        x4_read_reg_157 <= x4;
        x5_read_reg_152 <= x5;
        x6_read_reg_147 <= x6;
        x7_read_reg_142 <= x7;
        x8_read_reg_137 <= x8;
    end
end

assign ap_return = grp_fu_132_p2;

endmodule //CalcSumMag2
