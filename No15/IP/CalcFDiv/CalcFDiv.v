// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="CalcFDiv,hls_ip_2016_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg225-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=6.075000,HLS_SYN_LAT=15,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=761,HLS_SYN_LUT=994}" *)

module CalcFDiv (
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

CalcFDiv_fdiv_32nbkb #(
    .ID( 1 ),
    .NUM_STAGE( 16 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
CalcFDiv_fdiv_32nbkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(a),
    .din1(b),
    .ce(1'b1),
    .dout(grp_fu_40_p2)
);

assign ap_return = grp_fu_40_p2;

endmodule //CalcFDiv