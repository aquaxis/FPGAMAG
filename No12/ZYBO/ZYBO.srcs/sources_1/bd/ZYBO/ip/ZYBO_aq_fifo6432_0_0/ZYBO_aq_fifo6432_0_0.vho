-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.org:user:aq_fifo6432:1.0
-- IP Revision: 1

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT ZYBO_aq_fifo6432_0_0
  PORT (
    RST : IN STD_LOGIC;
    WR_CLK : IN STD_LOGIC;
    WR_IN_EMPTY : IN STD_LOGIC;
    WR_IN_RE : OUT STD_LOGIC;
    WR_IN_DATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    WR_OUT_RE : IN STD_LOGIC;
    WR_OUT_DO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    WR_OUT_EMPTY : OUT STD_LOGIC;
    RD_CLK : IN STD_LOGIC;
    RD_OUT_FULL : IN STD_LOGIC;
    RD_OUT_WE : OUT STD_LOGIC;
    RD_OUT_DATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    RD_IN_WE : IN STD_LOGIC;
    RD_IN_DI : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RD_IN_FULL : OUT STD_LOGIC;
    DEBUG : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : ZYBO_aq_fifo6432_0_0
  PORT MAP (
    RST => RST,
    WR_CLK => WR_CLK,
    WR_IN_EMPTY => WR_IN_EMPTY,
    WR_IN_RE => WR_IN_RE,
    WR_IN_DATA => WR_IN_DATA,
    WR_OUT_RE => WR_OUT_RE,
    WR_OUT_DO => WR_OUT_DO,
    WR_OUT_EMPTY => WR_OUT_EMPTY,
    RD_CLK => RD_CLK,
    RD_OUT_FULL => RD_OUT_FULL,
    RD_OUT_WE => RD_OUT_WE,
    RD_OUT_DATA => RD_OUT_DATA,
    RD_IN_WE => RD_IN_WE,
    RD_IN_DI => RD_IN_DI,
    RD_IN_FULL => RD_IN_FULL,
    DEBUG => DEBUG
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

