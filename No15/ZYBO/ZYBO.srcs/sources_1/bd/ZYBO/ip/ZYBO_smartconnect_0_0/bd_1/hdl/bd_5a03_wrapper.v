//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (lin64) Build 1682563 Mon Oct 10 19:07:26 MDT 2016
//Date        : Thu Oct 20 18:09:00 2016
//Host        : R02965 running 64-bit Ubuntu 16.10
//Command     : generate_target bd_5a03_wrapper.bd
//Design      : bd_5a03_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_5a03_wrapper
   (aclk,
    aresetn);
  input aclk;
  input aresetn;

  wire aclk;
  wire aresetn;

  bd_5a03 bd_5a03_i
       (.aclk(aclk),
        .aresetn(aresetn));
endmodule
