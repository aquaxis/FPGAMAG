//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (lin64) Build 1682563 Mon Oct 10 19:07:26 MDT 2016
//Date        : Sun Nov 20 00:25:37 2016
//Host        : saturn running 64-bit Ubuntu 16.10
//Command     : generate_target Timing_wrapper.bd
//Design      : Timing_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Timing_wrapper
   (CAM_ADRS,
    CAM_BANK0_WE,
    CAM_BANK1_WE,
    CAM_BANK2_WE,
    CAM_DOUT,
    CAM_HC,
    CAM_VC,
    CLK,
    DIN,
    ENA,
    HSYNC,
    RST_N,
    RT1_ADRS,
    RT1_SEL,
    RT2G_ADRS,
    RT2G_VALID,
    RT2M_ADRS,
    RT2M_VALID,
    RT3_ADRS,
    RT3_VALID,
    RT4_ADDR,
    RT4_SEL,
    RT4_VALID,
    RT5_ADDR0,
    RT5_ADDR1,
    RT5_ADDR2,
    RT5_ADDR3,
    RT5_ADDR4,
    RT5_ADDR5,
    RT5_ADDR6,
    RT5_ADDR7,
    RT5_ADDR8,
    RT5_RESTART_H,
    RT5_RESTART_V,
    RT5_SEL,
    VSYNC);
  output [10:0]CAM_ADRS;
  output CAM_BANK0_WE;
  output CAM_BANK1_WE;
  output CAM_BANK2_WE;
  output [7:0]CAM_DOUT;
  output [11:0]CAM_HC;
  output [11:0]CAM_VC;
  input CLK;
  input [7:0]DIN;
  input ENA;
  input HSYNC;
  input RST_N;
  output [10:0]RT1_ADRS;
  output [1:0]RT1_SEL;
  output [6:0]RT2G_ADRS;
  output RT2G_VALID;
  output [6:0]RT2M_ADRS;
  output RT2M_VALID;
  output [6:0]RT3_ADRS;
  output RT3_VALID;
  output [9:0]RT4_ADDR;
  output RT4_SEL;
  output RT4_VALID;
  output [9:0]RT5_ADDR0;
  output [9:0]RT5_ADDR1;
  output [9:0]RT5_ADDR2;
  output [9:0]RT5_ADDR3;
  output [9:0]RT5_ADDR4;
  output [9:0]RT5_ADDR5;
  output [9:0]RT5_ADDR6;
  output [9:0]RT5_ADDR7;
  output [9:0]RT5_ADDR8;
  output RT5_RESTART_H;
  output RT5_RESTART_V;
  output [3:0]RT5_SEL;
  input VSYNC;

  wire [10:0]CAM_ADRS;
  wire CAM_BANK0_WE;
  wire CAM_BANK1_WE;
  wire CAM_BANK2_WE;
  wire [7:0]CAM_DOUT;
  wire [11:0]CAM_HC;
  wire [11:0]CAM_VC;
  wire CLK;
  wire [7:0]DIN;
  wire ENA;
  wire HSYNC;
  wire RST_N;
  wire [10:0]RT1_ADRS;
  wire [1:0]RT1_SEL;
  wire [6:0]RT2G_ADRS;
  wire RT2G_VALID;
  wire [6:0]RT2M_ADRS;
  wire RT2M_VALID;
  wire [6:0]RT3_ADRS;
  wire RT3_VALID;
  wire [9:0]RT4_ADDR;
  wire RT4_SEL;
  wire RT4_VALID;
  wire [9:0]RT5_ADDR0;
  wire [9:0]RT5_ADDR1;
  wire [9:0]RT5_ADDR2;
  wire [9:0]RT5_ADDR3;
  wire [9:0]RT5_ADDR4;
  wire [9:0]RT5_ADDR5;
  wire [9:0]RT5_ADDR6;
  wire [9:0]RT5_ADDR7;
  wire [9:0]RT5_ADDR8;
  wire RT5_RESTART_H;
  wire RT5_RESTART_V;
  wire [3:0]RT5_SEL;
  wire VSYNC;

  Timing Timing_i
       (.CAM_ADRS(CAM_ADRS),
        .CAM_BANK0_WE(CAM_BANK0_WE),
        .CAM_BANK1_WE(CAM_BANK1_WE),
        .CAM_BANK2_WE(CAM_BANK2_WE),
        .CAM_DOUT(CAM_DOUT),
        .CAM_HC(CAM_HC),
        .CAM_VC(CAM_VC),
        .CLK(CLK),
        .DIN(DIN),
        .ENA(ENA),
        .HSYNC(HSYNC),
        .RST_N(RST_N),
        .RT1_ADRS(RT1_ADRS),
        .RT1_SEL(RT1_SEL),
        .RT2G_ADRS(RT2G_ADRS),
        .RT2G_VALID(RT2G_VALID),
        .RT2M_ADRS(RT2M_ADRS),
        .RT2M_VALID(RT2M_VALID),
        .RT3_ADRS(RT3_ADRS),
        .RT3_VALID(RT3_VALID),
        .RT4_ADDR(RT4_ADDR),
        .RT4_SEL(RT4_SEL),
        .RT4_VALID(RT4_VALID),
        .RT5_ADDR0(RT5_ADDR0),
        .RT5_ADDR1(RT5_ADDR1),
        .RT5_ADDR2(RT5_ADDR2),
        .RT5_ADDR3(RT5_ADDR3),
        .RT5_ADDR4(RT5_ADDR4),
        .RT5_ADDR5(RT5_ADDR5),
        .RT5_ADDR6(RT5_ADDR6),
        .RT5_ADDR7(RT5_ADDR7),
        .RT5_ADDR8(RT5_ADDR8),
        .RT5_RESTART_H(RT5_RESTART_H),
        .RT5_RESTART_V(RT5_RESTART_V),
        .RT5_SEL(RT5_SEL),
        .VSYNC(VSYNC));
endmodule
