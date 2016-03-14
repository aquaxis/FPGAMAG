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

-- IP VLNV: user.org:user:aq_axi_dma:1.0
-- IP Revision: 1

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT ZYBO_aq_axi_dma_0_0
  PORT (
    ARESETN : IN STD_LOGIC;
    LOCAL_CLK : IN STD_LOGIC;
    LOCAL_CS : IN STD_LOGIC;
    LOCAL_RNW : IN STD_LOGIC;
    LOCAL_ACK : OUT STD_LOGIC;
    LOCAL_ADDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    LOCAL_BE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    LOCAL_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    LOCAL_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M_AXI_ACLK : IN STD_LOGIC;
    M_AXI_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M_AXI_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M_AXI_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_AWLOCK : OUT STD_LOGIC;
    M_AXI_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_AWVALID : OUT STD_LOGIC;
    M_AXI_AWREADY : IN STD_LOGIC;
    M_AXI_WDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    M_AXI_WSTRB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M_AXI_WLAST : OUT STD_LOGIC;
    M_AXI_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_WVALID : OUT STD_LOGIC;
    M_AXI_WREADY : IN STD_LOGIC;
    M_AXI_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_BVALID : IN STD_LOGIC;
    M_AXI_BREADY : OUT STD_LOGIC;
    M_AXI_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M_AXI_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M_AXI_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_ARVALID : OUT STD_LOGIC;
    M_AXI_ARREADY : IN STD_LOGIC;
    M_AXI_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_RDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    M_AXI_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_RLAST : IN STD_LOGIC;
    M_AXI_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M_AXI_RVALID : IN STD_LOGIC;
    M_AXI_RREADY : OUT STD_LOGIC;
    FIFO_RST : OUT STD_LOGIC;
    FIFO_RD_CLK : IN STD_LOGIC;
    FIFO_RD_EN : IN STD_LOGIC;
    FIFO_RD_DOUT : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    FIFO_RD_EMPTY : OUT STD_LOGIC;
    FIFO_WR_CLK : IN STD_LOGIC;
    FIFO_WR_DIN : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    FIFO_WR_EN : IN STD_LOGIC;
    FIFO_WR_FULL : OUT STD_LOGIC;
    FSYNC : IN STD_LOGIC;
    FSYNC_RST : IN STD_LOGIC;
    DEBUG : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : ZYBO_aq_axi_dma_0_0
  PORT MAP (
    ARESETN => ARESETN,
    LOCAL_CLK => LOCAL_CLK,
    LOCAL_CS => LOCAL_CS,
    LOCAL_RNW => LOCAL_RNW,
    LOCAL_ACK => LOCAL_ACK,
    LOCAL_ADDR => LOCAL_ADDR,
    LOCAL_BE => LOCAL_BE,
    LOCAL_WDATA => LOCAL_WDATA,
    LOCAL_RDATA => LOCAL_RDATA,
    M_AXI_ACLK => M_AXI_ACLK,
    M_AXI_AWID => M_AXI_AWID,
    M_AXI_AWADDR => M_AXI_AWADDR,
    M_AXI_AWLEN => M_AXI_AWLEN,
    M_AXI_AWSIZE => M_AXI_AWSIZE,
    M_AXI_AWBURST => M_AXI_AWBURST,
    M_AXI_AWLOCK => M_AXI_AWLOCK,
    M_AXI_AWCACHE => M_AXI_AWCACHE,
    M_AXI_AWPROT => M_AXI_AWPROT,
    M_AXI_AWQOS => M_AXI_AWQOS,
    M_AXI_AWUSER => M_AXI_AWUSER,
    M_AXI_AWVALID => M_AXI_AWVALID,
    M_AXI_AWREADY => M_AXI_AWREADY,
    M_AXI_WDATA => M_AXI_WDATA,
    M_AXI_WSTRB => M_AXI_WSTRB,
    M_AXI_WLAST => M_AXI_WLAST,
    M_AXI_WUSER => M_AXI_WUSER,
    M_AXI_WVALID => M_AXI_WVALID,
    M_AXI_WREADY => M_AXI_WREADY,
    M_AXI_BID => M_AXI_BID,
    M_AXI_BRESP => M_AXI_BRESP,
    M_AXI_BUSER => M_AXI_BUSER,
    M_AXI_BVALID => M_AXI_BVALID,
    M_AXI_BREADY => M_AXI_BREADY,
    M_AXI_ARID => M_AXI_ARID,
    M_AXI_ARADDR => M_AXI_ARADDR,
    M_AXI_ARLEN => M_AXI_ARLEN,
    M_AXI_ARSIZE => M_AXI_ARSIZE,
    M_AXI_ARBURST => M_AXI_ARBURST,
    M_AXI_ARLOCK => M_AXI_ARLOCK,
    M_AXI_ARCACHE => M_AXI_ARCACHE,
    M_AXI_ARPROT => M_AXI_ARPROT,
    M_AXI_ARQOS => M_AXI_ARQOS,
    M_AXI_ARUSER => M_AXI_ARUSER,
    M_AXI_ARVALID => M_AXI_ARVALID,
    M_AXI_ARREADY => M_AXI_ARREADY,
    M_AXI_RID => M_AXI_RID,
    M_AXI_RDATA => M_AXI_RDATA,
    M_AXI_RRESP => M_AXI_RRESP,
    M_AXI_RLAST => M_AXI_RLAST,
    M_AXI_RUSER => M_AXI_RUSER,
    M_AXI_RVALID => M_AXI_RVALID,
    M_AXI_RREADY => M_AXI_RREADY,
    FIFO_RST => FIFO_RST,
    FIFO_RD_CLK => FIFO_RD_CLK,
    FIFO_RD_EN => FIFO_RD_EN,
    FIFO_RD_DOUT => FIFO_RD_DOUT,
    FIFO_RD_EMPTY => FIFO_RD_EMPTY,
    FIFO_WR_CLK => FIFO_WR_CLK,
    FIFO_WR_DIN => FIFO_WR_DIN,
    FIFO_WR_EN => FIFO_WR_EN,
    FIFO_WR_FULL => FIFO_WR_FULL,
    FSYNC => FSYNC,
    FSYNC_RST => FSYNC_RST,
    DEBUG => DEBUG
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

