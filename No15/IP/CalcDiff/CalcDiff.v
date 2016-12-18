// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="CalcDiff,hls_ip_2016_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=1.720000,HLS_SYN_LAT=0,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=9}" *)

module CalcDiff (
        a,
        b,
        ap_return
);


input  [7:0] a;
input  [7:0] b;
output  [15:0] ap_return;

wire   [8:0] tmp_cast_fu_40_p1;
wire   [8:0] tmp_1_cast_fu_44_p1;
wire   [8:0] tmp_2_fu_48_p2;

assign ap_return = $signed(tmp_2_fu_48_p2);

assign tmp_1_cast_fu_44_p1 = a;

assign tmp_2_fu_48_p2 = (tmp_cast_fu_40_p1 - tmp_1_cast_fu_44_p1);

assign tmp_cast_fu_40_p1 = b;

endmodule //CalcDiff