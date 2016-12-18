// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="CalcFAdd2,hls_ip_2016_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=4,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=205,HLS_SYN_LUT=390}" *)

module CalcFAdd2 (
        ap_clk,
        ap_rst,
        a,
        b,
        ap_return
);


input   ap_clk;
input   ap_rst;
input  [31:0] a;
input  [31:0] b;
output  [31:0] ap_return;

wire   [31:0] grp_fu_40_p2;

CalcFAdd2_fadd_32bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcFAdd2_fadd_32bkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(b),
    .din1(a),
    .ce(1'b1),
    .dout(grp_fu_40_p2)
);

assign ap_return = grp_fu_40_p2;

endmodule //CalcFAdd2
