//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (lin64) Build 1682563 Mon Oct 10 19:07:26 MDT 2016
//Date        : Sun Nov 20 00:25:37 2016
//Host        : saturn running 64-bit Ubuntu 16.10
//Command     : generate_target Timing.bd
//Design      : Timing
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Timing,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Timing,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=8,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "Timing.hwdef" *) 
module Timing
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

  wire CLK_1;
  wire [10:0]CamTiming_0_ADRS;
  wire CamTiming_0_BANK0_WE;
  wire CamTiming_0_BANK1_WE;
  wire CamTiming_0_BANK2_WE;
  wire [7:0]CamTiming_0_DOUT;
  wire [11:0]CamTiming_0_HC;
  wire CamTiming_0_RESTART_H;
  wire CamTiming_0_RESTART_V;
  wire [11:0]CamTiming_0_VC;
  wire [7:0]DIN_1;
  wire [9:0]DelayAddr1_0_ADDR0;
  wire [9:0]DelayAddr1_0_ADDR1;
  wire [9:0]DelayAddr1_0_ADDR2;
  wire [9:0]DelayAddr1_0_ADDR3;
  wire [9:0]DelayAddr1_0_ADDR4;
  wire [9:0]DelayAddr1_0_ADDR5;
  wire [9:0]DelayAddr1_0_ADDR6;
  wire [9:0]DelayAddr1_0_ADDR7;
  wire [9:0]DelayAddr1_0_ADDR8;
  wire ENA_1;
  wire HSYNC_1;
  wire RST_N_1;
  wire [10:0]ReTiming1_0_ADRS;
  wire ReTiming1_0_RESTART_H_G;
  wire ReTiming1_0_RESTART_H_M;
  wire ReTiming1_0_RESTART_V_G;
  wire ReTiming1_0_RESTART_V_M;
  wire [1:0]ReTiming1_0_SEL;
  wire [6:0]ReTiming2_Grad_ADRS;
  wire ReTiming2_Grad_VALID;
  wire [6:0]ReTiming2_Mag_ADRS;
  wire ReTiming2_Mag_RESTART_H;
  wire ReTiming2_Mag_RESTART_V;
  wire ReTiming2_Mag_VALID;
  wire ReTiming3_0_RESTART_H;
  wire ReTiming3_0_RESTART_V;
  wire [6:0]ReTiming3_ADRS;
  wire ReTiming3_VALID;
  wire ReTiming4_0_RESTART_H;
  wire ReTiming4_0_RESTART_V;
  wire ReTiming4_0_SEL;
  wire [9:0]ReTiming4_ADRS;
  wire ReTiming4_VALID;
  wire [9:0]ReTiming5_1_ADRS;
  wire ReTiming5_1_RESTART_H;
  wire ReTiming5_1_RESTART_V;
  wire [3:0]ReTiming5_1_SEL;
  wire VSYNC_1;
  wire [11:0]xlconstant_1_dout;
  wire [11:0]xlconstant_2_dout;

  assign CAM_ADRS[10:0] = CamTiming_0_ADRS;
  assign CAM_BANK0_WE = CamTiming_0_BANK0_WE;
  assign CAM_BANK1_WE = CamTiming_0_BANK1_WE;
  assign CAM_BANK2_WE = CamTiming_0_BANK2_WE;
  assign CAM_DOUT[7:0] = CamTiming_0_DOUT;
  assign CAM_HC[11:0] = CamTiming_0_HC;
  assign CAM_VC[11:0] = CamTiming_0_VC;
  assign CLK_1 = CLK;
  assign DIN_1 = DIN[7:0];
  assign ENA_1 = ENA;
  assign HSYNC_1 = HSYNC;
  assign RST_N_1 = RST_N;
  assign RT1_ADRS[10:0] = ReTiming1_0_ADRS;
  assign RT1_SEL[1:0] = ReTiming1_0_SEL;
  assign RT2G_ADRS[6:0] = ReTiming2_Grad_ADRS;
  assign RT2G_VALID = ReTiming2_Grad_VALID;
  assign RT2M_ADRS[6:0] = ReTiming2_Mag_ADRS;
  assign RT2M_VALID = ReTiming2_Mag_VALID;
  assign RT3_ADRS[6:0] = ReTiming3_ADRS;
  assign RT3_VALID = ReTiming3_VALID;
  assign RT4_ADDR[9:0] = ReTiming4_ADRS;
  assign RT4_SEL = ReTiming4_0_SEL;
  assign RT4_VALID = ReTiming4_VALID;
  assign RT5_ADDR0[9:0] = DelayAddr1_0_ADDR0;
  assign RT5_ADDR1[9:0] = DelayAddr1_0_ADDR1;
  assign RT5_ADDR2[9:0] = DelayAddr1_0_ADDR2;
  assign RT5_ADDR3[9:0] = DelayAddr1_0_ADDR3;
  assign RT5_ADDR4[9:0] = DelayAddr1_0_ADDR4;
  assign RT5_ADDR5[9:0] = DelayAddr1_0_ADDR5;
  assign RT5_ADDR6[9:0] = DelayAddr1_0_ADDR6;
  assign RT5_ADDR7[9:0] = DelayAddr1_0_ADDR7;
  assign RT5_ADDR8[9:0] = DelayAddr1_0_ADDR8;
  assign RT5_RESTART_H = ReTiming5_1_RESTART_H;
  assign RT5_RESTART_V = ReTiming5_1_RESTART_V;
  assign RT5_SEL[3:0] = ReTiming5_1_SEL;
  assign VSYNC_1 = VSYNC;
  Timing_CamTiming_0_1 CamTiming
       (.ADRS(CamTiming_0_ADRS),
        .BANK0_WE(CamTiming_0_BANK0_WE),
        .BANK1_WE(CamTiming_0_BANK1_WE),
        .BANK2_WE(CamTiming_0_BANK2_WE),
        .CLK(CLK_1),
        .DIN(DIN_1),
        .DOUT(CamTiming_0_DOUT),
        .ENA(ENA_1),
        .HC(CamTiming_0_HC),
        .HSYNC(HSYNC_1),
        .RESTART_H(CamTiming_0_RESTART_H),
        .RESTART_V(CamTiming_0_RESTART_V),
        .RST_N(RST_N_1),
        .VC(CamTiming_0_VC),
        .VSYNC(VSYNC_1));
  Timing_Const_1280_0 Const_1280
       (.dout(xlconstant_1_dout));
  Timing_Const_720_0 Const_720
       (.dout(xlconstant_2_dout));
  Timing_DelayAddr1_0_0 DelayAddr1
       (.ADDR0(DelayAddr1_0_ADDR0),
        .ADDR1(DelayAddr1_0_ADDR1),
        .ADDR2(DelayAddr1_0_ADDR2),
        .ADDR3(DelayAddr1_0_ADDR3),
        .ADDR4(DelayAddr1_0_ADDR4),
        .ADDR5(DelayAddr1_0_ADDR5),
        .ADDR6(DelayAddr1_0_ADDR6),
        .ADDR7(DelayAddr1_0_ADDR7),
        .ADDR8(DelayAddr1_0_ADDR8),
        .ADDR_IN(ReTiming5_1_ADRS),
        .CLK(CLK_1),
        .RST_N(RST_N_1));
  Timing_ReTiming1_0_0 ReTiming1
       (.ADRS(ReTiming1_0_ADRS),
        .CLK(CLK_1),
        .HEIGHT(xlconstant_2_dout),
        .HSYNC(CamTiming_0_RESTART_H),
        .RESTART_H_G(ReTiming1_0_RESTART_H_G),
        .RESTART_H_M(ReTiming1_0_RESTART_H_M),
        .RESTART_V_G(ReTiming1_0_RESTART_V_G),
        .RESTART_V_M(ReTiming1_0_RESTART_V_M),
        .RST_N(RST_N_1),
        .SEL(ReTiming1_0_SEL),
        .VSYNC(CamTiming_0_RESTART_V),
        .WIDTH(xlconstant_1_dout));
  Timing_ReTiming2_Grad_0 ReTiming2_Grad
       (.ADRS(ReTiming2_Grad_ADRS),
        .CLK(CLK_1),
        .HEIGHT(xlconstant_2_dout),
        .HSYNC(ReTiming1_0_RESTART_H_G),
        .RST_N(RST_N_1),
        .VALID(ReTiming2_Grad_VALID),
        .VSYNC(ReTiming1_0_RESTART_V_G),
        .WIDTH(xlconstant_1_dout));
  Timing_ReTiming2_Mag_0 ReTiming2_Mag
       (.ADRS(ReTiming2_Mag_ADRS),
        .CLK(CLK_1),
        .HEIGHT(xlconstant_2_dout),
        .HSYNC(ReTiming1_0_RESTART_H_M),
        .RESTART_H(ReTiming2_Mag_RESTART_H),
        .RESTART_V(ReTiming2_Mag_RESTART_V),
        .RST_N(RST_N_1),
        .VALID(ReTiming2_Mag_VALID),
        .VSYNC(ReTiming1_0_RESTART_V_M),
        .WIDTH(xlconstant_1_dout));
  Timing_ReTiming3_0 ReTiming3
       (.ADRS(ReTiming3_ADRS),
        .CLK(CLK_1),
        .HEIGHT(xlconstant_2_dout),
        .HSYNC(ReTiming2_Mag_RESTART_H),
        .RESTART_H(ReTiming3_0_RESTART_H),
        .RESTART_V(ReTiming3_0_RESTART_V),
        .RST_N(RST_N_1),
        .VALID(ReTiming3_VALID),
        .VSYNC(ReTiming2_Mag_RESTART_V),
        .WIDTH(xlconstant_1_dout));
  Timing_ReTiming4_0_0 ReTiming4
       (.ADRS(ReTiming4_ADRS),
        .CLK(CLK_1),
        .HEIGHT(xlconstant_2_dout),
        .HSYNC(ReTiming3_0_RESTART_H),
        .RESTART_H(ReTiming4_0_RESTART_H),
        .RESTART_V(ReTiming4_0_RESTART_V),
        .RST_N(RST_N_1),
        .SEL(ReTiming4_0_SEL),
        .VALID(ReTiming4_VALID),
        .VSYNC(ReTiming3_0_RESTART_V),
        .WIDTH(xlconstant_1_dout));
  Timing_ReTiming5_1_0 ReTiming5
       (.ADRS(ReTiming5_1_ADRS),
        .CLK(CLK_1),
        .HEIGHT(xlconstant_2_dout),
        .HSYNC(ReTiming4_0_RESTART_H),
        .RESTART_H(ReTiming5_1_RESTART_H),
        .RESTART_V(ReTiming5_1_RESTART_V),
        .RST_N(RST_N_1),
        .SEL(ReTiming5_1_SEL),
        .VSYNC(ReTiming4_0_RESTART_V),
        .WIDTH(xlconstant_1_dout));
endmodule
