//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (lin64) Build 1682563 Mon Oct 10 19:07:26 MDT 2016
//Date        : Fri Oct 28 12:25:50 2016
//Host        : R02965 running 64-bit Ubuntu 16.10
//Command     : generate_target CreateCell.bd
//Design      : CreateCell
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "CreateCell,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=CreateCell,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=7,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "CreateCell.hwdef" *) 
module CreateCell
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

  wire CALC_SEL_1;
  wire CLK_1;
  wire [3:0]CONST_SEL_1;
  wire [31:0]CalcFAdd_0_ap_return;
  wire [31:0]CalcFAdd_1_ap_return;
  wire [31:0]DataSel1_0_DOUT;
  wire [31:0]DataSel2_0_DOUT;
  wire [31:0]DataSel3_0_DOUT;
  wire [31:0]DelayBuf_0_Q;
  wire [31:0]DelayBuf_1_Q;
  wire [31:0]GRAD_DIN_1;
  wire [3:0]GRAD_SEL_1;
  wire [31:0]RAM_DIN_1;
  wire RAM_SEL_1;
  wire RST_N_1;
  wire [0:0]RST_Res;

  assign CALC_SEL_1 = CALC_SEL;
  assign CLK_1 = CLK;
  assign CONST_SEL_1 = CONST_SEL[3:0];
  assign DOUT[31:0] = CalcFAdd_1_ap_return;
  assign GRAD_DIN_1 = GRAD_DIN[31:0];
  assign GRAD_SEL_1 = GRAD_SEL[3:0];
  assign RAM_DIN_1 = RAM_DIN[31:0];
  assign RAM_SEL_1 = RAM_SEL;
  assign RST_N_1 = RST_N;
  CreateCell_CalcFAdd2_0_1 CalcFAdd2_0
       (.a(DataSel1_0_DOUT),
        .ap_clk(CLK_1),
        .ap_return(CalcFAdd_0_ap_return),
        .ap_rst(RST_Res),
        .b(DataSel3_0_DOUT));
  CreateCell_CalcFAdd_1_0 CalcFAdd_1
       (.a(CalcFAdd_0_ap_return),
        .ap_clk(CLK_1),
        .ap_return(CalcFAdd_1_ap_return),
        .ap_rst(RST_Res),
        .b(DataSel2_0_DOUT));
  CreateCell_DataSel1_0_0 DataSel1_0
       (.CLK(CLK_1),
        .DIN(GRAD_DIN_1),
        .DOUT(DataSel1_0_DOUT),
        .RST_N(RST_N_1),
        .SEL0(CONST_SEL_1),
        .SEL1(GRAD_SEL_1));
  CreateCell_DataSel2_0_0 DataSel2_0
       (.CLK(CLK_1),
        .DIN(RAM_DIN_1),
        .DOUT(DataSel2_0_DOUT),
        .RST_N(RST_N_1),
        .SEL(DelayBuf_1_Q[0]));
  CreateCell_DataSel3_0_0 DataSel3_0
       (.CLK(CLK_1),
        .DIN(CalcFAdd_0_ap_return),
        .DOUT(DataSel3_0_DOUT),
        .RST_N(RST_N_1),
        .SEL(DelayBuf_0_Q[0]));
  CreateCell_DelayBuf_0_0 DelayBuf_0
       (.A({CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1,CALC_SEL_1}),
        .CLK(CLK_1),
        .Q(DelayBuf_0_Q),
        .RST_N(RST_N_1));
  CreateCell_DelayBuf_1_0 DelayBuf_1
       (.A({RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1,RAM_SEL_1}),
        .CLK(CLK_1),
        .Q(DelayBuf_1_Q),
        .RST_N(RST_N_1));
  CreateCell_RST_0 RST
       (.Op1(RST_N_1),
        .Res(RST_Res));
endmodule
