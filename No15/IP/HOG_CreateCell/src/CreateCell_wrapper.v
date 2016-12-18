//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (lin64) Build 1682563 Mon Oct 10 19:07:26 MDT 2016
//Date        : Fri Oct 28 12:25:50 2016
//Host        : R02965 running 64-bit Ubuntu 16.10
//Command     : generate_target CreateCell_wrapper.bd
//Design      : CreateCell_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module CreateCell_wrapper
   (CALC_SEL,
    CLK,
    CONST_SEL,
    DOUT,
    GRAD_DIN,
    GRAD_SEL,
    RAM_DIN,
    RAM_SEL,
    RST_N);
  input CALC_SEL;
  input CLK;
  input [3:0]CONST_SEL;
  output [31:0]DOUT;
  input [31:0]GRAD_DIN;
  input [3:0]GRAD_SEL;
  input [31:0]RAM_DIN;
  input RAM_SEL;
  input RST_N;

  wire CALC_SEL;
  wire CLK;
  wire [3:0]CONST_SEL;
  wire [31:0]DOUT;
  wire [31:0]GRAD_DIN;
  wire [3:0]GRAD_SEL;
  wire [31:0]RAM_DIN;
  wire RAM_SEL;
  wire RST_N;

  CreateCell CreateCell_i
       (.CALC_SEL(CALC_SEL),
        .CLK(CLK),
        .CONST_SEL(CONST_SEL),
        .DOUT(DOUT),
        .GRAD_DIN(GRAD_DIN),
        .GRAD_SEL(GRAD_SEL),
        .RAM_DIN(RAM_DIN),
        .RAM_SEL(RAM_SEL),
        .RST_N(RST_N));
endmodule
