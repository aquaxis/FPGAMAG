// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="CalcPreGrad,hls_ip_2016_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.090000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=16}" *)

module CalcPreGrad (
        x,
        ap_return
);

parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv8_0 = 8'b00000000;

input  [15:0] x;
output  [7:0] ap_return;

wire   [7:0] tmp_1_fu_38_p1;
wire   [0:0] tmp_fu_30_p3;
wire   [7:0] tmp_3_fu_42_p2;

assign ap_return = ((tmp_fu_30_p3[0:0] === 1'b1) ? tmp_3_fu_42_p2 : tmp_1_fu_38_p1);

assign tmp_1_fu_38_p1 = x[7:0];

assign tmp_3_fu_42_p2 = (ap_const_lv8_0 - tmp_1_fu_38_p1);

assign tmp_fu_30_p3 = x[ap_const_lv32_F];

endmodule //CalcPreGrad
