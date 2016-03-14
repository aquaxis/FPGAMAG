
################################################################
# This is a generated script based on design: ZYBO
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ZYBO_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name ZYBO

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: VGA
proc create_hier_cell_VGA { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_VGA() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I -type clk ACLK
  create_bd_pin -dir I -from 0 -to 0 -type rst ARESETN
  create_bd_pin -dir O CLK_LOCKED
  create_bd_pin -dir O -from 7 -to 0 DOUT_B
  create_bd_pin -dir O -from 7 -to 0 DOUT_G
  create_bd_pin -dir O -from 7 -to 0 DOUT_R
  create_bd_pin -dir O HSYNC
  create_bd_pin -dir I -type clk M_AXI_ACLK
  create_bd_pin -dir O -from 3 -to 0 TMDS
  create_bd_pin -dir O -from 3 -to 0 TMDSB
  create_bd_pin -dir O VSYNC
  create_bd_pin -dir I -from 0 -to 0 -type rst reset

  # Create instance: aq_axi_dma_0, and set properties
  set aq_axi_dma_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_axi_dma:1.0 aq_axi_dma_0 ]

  # Create instance: aq_axi_lite_slave_0, and set properties
  set aq_axi_lite_slave_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_axi_lite_slave:1.0 aq_axi_lite_slave_0 ]

  # Create instance: aq_fifo6432_0, and set properties
  set aq_fifo6432_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_fifo6432:1.0 aq_fifo6432_0 ]

  # Create instance: aq_hdmi_enc_0, and set properties
  set aq_hdmi_enc_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_hdmi_enc:1.0 aq_hdmi_enc_0 ]

  # Create instance: aq_intreg_0, and set properties
  set aq_intreg_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_intreg:1.0 aq_intreg_0 ]

  # Create instance: aq_syncgen_0, and set properties
  set aq_syncgen_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_syncgen:1.0 aq_syncgen_0 ]

  # Create instance: aq_vga_0, and set properties
  set aq_vga_0 [ create_bd_cell -type ip -vlnv user.org:user:aq_vga:1.0 aq_vga_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKIN1_JITTER_PS {100.0} \
CONFIG.CLKOUT1_JITTER {343.397} \
CONFIG.CLKOUT1_PHASE_ERROR {320.324} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {65} \
CONFIG.CLKOUT2_JITTER {256.032} \
CONFIG.CLKOUT2_PHASE_ERROR {320.324} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {375} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {37.375} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {11.500} \
CONFIG.MMCM_CLKOUT1_DIVIDE {2} \
CONFIG.MMCM_DIVCLK_DIVIDE {5} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.PRIM_IN_FREQ {100} \
 ] $clk_wiz_0

  # Create interface connections
  connect_bd_intf_net -intf_net aq_axi_dma_0_M_AXI [get_bd_intf_pins M_AXI] [get_bd_intf_pins aq_axi_dma_0/M_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins aq_axi_lite_slave_0/S_AXI]

  # Create port connections
  connect_bd_net -net M_AXI_ACLK_1 [get_bd_pins M_AXI_ACLK] [get_bd_pins aq_axi_dma_0/M_AXI_ACLK]
  connect_bd_net -net aq_axi_dma_0_FIFO_RD_DOUT [get_bd_pins aq_axi_dma_0/FIFO_RD_DOUT] [get_bd_pins aq_fifo6432_0/WR_IN_DATA]
  connect_bd_net -net aq_axi_dma_0_FIFO_RD_EMPTY [get_bd_pins aq_axi_dma_0/FIFO_RD_EMPTY] [get_bd_pins aq_fifo6432_0/WR_IN_EMPTY]
  connect_bd_net -net aq_axi_dma_0_FIFO_RST [get_bd_pins aq_axi_dma_0/FIFO_RST] [get_bd_pins aq_fifo6432_0/RST]
  connect_bd_net -net aq_axi_dma_0_FIFO_WR_FULL [get_bd_pins aq_axi_dma_0/FIFO_WR_FULL] [get_bd_pins aq_fifo6432_0/RD_OUT_FULL]
  connect_bd_net -net aq_axi_dma_0_LOCAL_ACK [get_bd_pins aq_axi_dma_0/LOCAL_ACK] [get_bd_pins aq_axi_lite_slave_0/LOCAL_ACK]
  connect_bd_net -net aq_axi_dma_0_LOCAL_RDATA [get_bd_pins aq_axi_dma_0/LOCAL_RDATA] [get_bd_pins aq_axi_lite_slave_0/LOCAL_RDATA]
  connect_bd_net -net aq_axi_lite_slave_0_LOCAL_ADDR [get_bd_pins aq_axi_dma_0/LOCAL_ADDR] [get_bd_pins aq_axi_lite_slave_0/LOCAL_ADDR]
  connect_bd_net -net aq_axi_lite_slave_0_LOCAL_BE [get_bd_pins aq_axi_dma_0/LOCAL_BE] [get_bd_pins aq_axi_lite_slave_0/LOCAL_BE]
  connect_bd_net -net aq_axi_lite_slave_0_LOCAL_CS [get_bd_pins aq_axi_dma_0/LOCAL_CS] [get_bd_pins aq_axi_lite_slave_0/LOCAL_CS]
  connect_bd_net -net aq_axi_lite_slave_0_LOCAL_RNW [get_bd_pins aq_axi_dma_0/LOCAL_RNW] [get_bd_pins aq_axi_lite_slave_0/LOCAL_RNW]
  connect_bd_net -net aq_axi_lite_slave_0_LOCAL_WDATA [get_bd_pins aq_axi_dma_0/LOCAL_WDATA] [get_bd_pins aq_axi_lite_slave_0/LOCAL_WDATA]
  connect_bd_net -net aq_fifo6432_0_RD_OUT_DATA [get_bd_pins aq_axi_dma_0/FIFO_WR_DIN] [get_bd_pins aq_fifo6432_0/RD_OUT_DATA]
  connect_bd_net -net aq_fifo6432_0_WR_IN_RE [get_bd_pins aq_axi_dma_0/FIFO_RD_EN] [get_bd_pins aq_fifo6432_0/WR_IN_RE]
  connect_bd_net -net aq_fifo6432_0_WR_OUT_DO [get_bd_pins aq_fifo6432_0/WR_OUT_DO] [get_bd_pins aq_hdmi_enc_0/DIN] [get_bd_pins aq_vga_0/DIN]
  connect_bd_net -net aq_hdmi_enc_0_TMDS [get_bd_pins TMDS] [get_bd_pins aq_hdmi_enc_0/TMDS]
  connect_bd_net -net aq_hdmi_enc_0_TMDSB [get_bd_pins TMDSB] [get_bd_pins aq_hdmi_enc_0/TMDSB]
  connect_bd_net -net aq_intreg_0_INT [get_bd_pins aq_axi_dma_0/FSYNC] [get_bd_pins aq_intreg_0/INT]
  connect_bd_net -net aq_syncgen_0_ACTIVE [get_bd_pins aq_fifo6432_0/WR_OUT_RE] [get_bd_pins aq_hdmi_enc_0/DE] [get_bd_pins aq_syncgen_0/ACTIVE] [get_bd_pins aq_vga_0/ACTIVE]
  connect_bd_net -net aq_syncgen_0_FSYNC [get_bd_pins aq_intreg_0/DIN] [get_bd_pins aq_syncgen_0/FSYNC]
  connect_bd_net -net aq_syncgen_0_HSYNC [get_bd_pins aq_hdmi_enc_0/HSYNC] [get_bd_pins aq_syncgen_0/HSYNC] [get_bd_pins aq_vga_0/HIN]
  connect_bd_net -net aq_syncgen_0_VSYNC [get_bd_pins aq_hdmi_enc_0/VSYNC] [get_bd_pins aq_syncgen_0/VSYNC] [get_bd_pins aq_vga_0/VIN]
  connect_bd_net -net aq_vga_0_DOUT_B [get_bd_pins DOUT_B] [get_bd_pins aq_vga_0/DOUT_B]
  connect_bd_net -net aq_vga_0_DOUT_G [get_bd_pins DOUT_G] [get_bd_pins aq_vga_0/DOUT_G]
  connect_bd_net -net aq_vga_0_DOUT_R [get_bd_pins DOUT_R] [get_bd_pins aq_vga_0/DOUT_R]
  connect_bd_net -net aq_vga_0_HSYNC [get_bd_pins HSYNC] [get_bd_pins aq_vga_0/HSYNC]
  connect_bd_net -net aq_vga_0_VSYNC [get_bd_pins VSYNC] [get_bd_pins aq_vga_0/VSYNC]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins aq_axi_dma_0/FIFO_RD_CLK] [get_bd_pins aq_axi_dma_0/FIFO_WR_CLK] [get_bd_pins aq_fifo6432_0/RD_CLK] [get_bd_pins aq_fifo6432_0/WR_CLK] [get_bd_pins aq_hdmi_enc_0/PCLK] [get_bd_pins aq_intreg_0/CLKA] [get_bd_pins aq_syncgen_0/CLK] [get_bd_pins aq_vga_0/CLK] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins aq_hdmi_enc_0/PCLK2] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins CLK_LOCKED] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins ARESETN] [get_bd_pins aq_axi_dma_0/ARESETN] [get_bd_pins aq_axi_lite_slave_0/ARESETN] [get_bd_pins aq_hdmi_enc_0/RST_N] [get_bd_pins aq_intreg_0/RST_N] [get_bd_pins aq_syncgen_0/RST_N] [get_bd_pins aq_vga_0/RST_N]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins reset] [get_bd_pins clk_wiz_0/reset]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins ACLK] [get_bd_pins aq_axi_dma_0/LOCAL_CLK] [get_bd_pins aq_axi_lite_slave_0/ACLK] [get_bd_pins aq_intreg_0/CLKB] [get_bd_pins clk_wiz_0/clk_in1]

  # Perform GUI Layout
  regenerate_bd_layout -hierarchy [get_bd_cells /VGA] -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port VSYNC -pg 1 -y 510 -defaultsOSRD
preplace port HSYNC -pg 1 -y 490 -defaultsOSRD
preplace port ACLK -pg 1 -y 650 -defaultsOSRD
preplace port CLK_LOCKED -pg 1 -y 720 -defaultsOSRD
preplace port S_AXI -pg 1 -y 50 -defaultsOSRD
preplace port M_AXI -pg 1 -y 140 -defaultsOSRD
preplace port M_AXI_ACLK -pg 1 -y 190 -defaultsOSRD
preplace portBus DOUT_G -pg 1 -y 550 -defaultsOSRD
preplace portBus TMDS -pg 1 -y 830 -defaultsOSRD
preplace portBus ARESETN -pg 1 -y 540 -defaultsOSRD
preplace portBus TMDSB -pg 1 -y 850 -defaultsOSRD
preplace portBus DOUT_B -pg 1 -y 570 -defaultsOSRD
preplace portBus reset -pg 1 -y 720 -defaultsOSRD
preplace portBus DOUT_R -pg 1 -y 530 -defaultsOSRD
preplace inst aq_vga_0 -pg 1 -lvl 5 -y 530 -defaultsOSRD
preplace inst aq_hdmi_enc_0 -pg 1 -lvl 5 -y 840 -defaultsOSRD
preplace inst aq_intreg_0 -pg 1 -lvl 3 -y 430 -defaultsOSRD
preplace inst aq_syncgen_0 -pg 1 -lvl 2 -y 550 -defaultsOSRD
preplace inst aq_axi_dma_0 -pg 1 -lvl 5 -y 210 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y 710 -defaultsOSRD
preplace inst aq_fifo6432_0 -pg 1 -lvl 4 -y 290 -defaultsOSRD
preplace inst aq_axi_lite_slave_0 -pg 1 -lvl 3 -y 90 -defaultsOSRD
preplace netloc aq_syncgen_0_VSYNC 1 2 3 NJ 510 NJ 510 1190
preplace netloc clk_wiz_0_locked 1 1 5 NJ 720 NJ 720 NJ 720 NJ 720 NJ
preplace netloc aq_syncgen_0_HSYNC 1 2 3 NJ 530 NJ 530 1180
preplace netloc aq_axi_lite_slave_0_LOCAL_BE 1 3 2 NJ 100 1270
preplace netloc aq_axi_dma_0_LOCAL_ACK 1 2 4 440 240 NJ 450 NJ 420 1670
preplace netloc aq_axi_lite_slave_0_LOCAL_ADDR 1 3 2 NJ 80 1300
preplace netloc aq_vga_0_DOUT_B 1 5 1 NJ
preplace netloc aq_axi_lite_slave_0_LOCAL_WDATA 1 3 2 NJ 120 1260
preplace netloc aq_axi_dma_0_LOCAL_RDATA 1 2 4 450 200 NJ 20 NJ 20 1640
preplace netloc aq_vga_0_HSYNC 1 5 1 NJ
preplace netloc aq_hdmi_enc_0_TMDSB 1 5 1 NJ
preplace netloc aq_vga_0_VSYNC 1 5 1 NJ
preplace netloc aq_syncgen_0_FSYNC 1 2 1 420
preplace netloc aq_axi_dma_0_FIFO_WR_FULL 1 3 3 860 440 NJ 430 1660
preplace netloc aq_axi_dma_0_FIFO_RST 1 3 3 870 10 NJ 10 1650
preplace netloc aq_axi_dma_0_FIFO_RD_EMPTY 1 3 3 850 430 NJ 410 1640
preplace netloc aq_vga_0_DOUT_R 1 5 1 NJ
preplace netloc aq_fifo6432_0_WR_IN_RE 1 4 1 1220
preplace netloc aq_fifo6432_0_RD_OUT_DATA 1 4 1 1220
preplace netloc aq_axi_lite_slave_0_LOCAL_CS 1 3 2 NJ 40 1320
preplace netloc aq_axi_dma_0_M_AXI 1 5 1 NJ
preplace netloc clk_wiz_0_clk_out1 1 1 4 180 420 NJ 310 830 160 1230
preplace netloc aq_intreg_0_INT 1 3 2 790 460 NJ
preplace netloc clk_wiz_0_clk_out2 1 1 4 NJ 710 NJ 710 NJ 710 1200
preplace netloc aq_hdmi_enc_0_TMDS 1 5 1 NJ
preplace netloc proc_sys_reset_0_peripheral_reset 1 0 1 NJ
preplace netloc proc_sys_reset_0_peripheral_aresetn 1 0 5 NJ 540 190 400 420 210 NJ 140 1290
preplace netloc aq_vga_0_DOUT_G 1 5 1 NJ
preplace netloc aq_fifo6432_0_WR_OUT_DO 1 4 1 1210
preplace netloc aq_axi_lite_slave_0_LOCAL_RNW 1 3 2 NJ 60 1310
preplace netloc M_AXI_ACLK_1 1 0 5 NJ 190 NJ 190 NJ 190 NJ 150 NJ
preplace netloc processing_system7_0_FCLK_CLK0 1 0 5 0 460 NJ 460 430 220 NJ 130 1240
preplace netloc axi_interconnect_1_M00_AXI 1 0 3 NJ 50 NJ 50 NJ
preplace netloc aq_syncgen_0_ACTIVE 1 2 3 NJ 540 840 540 NJ
preplace netloc aq_axi_dma_0_FIFO_RD_DOUT 1 3 3 870 420 NJ 400 1650
levelinfo -pg 1 -20 100 320 630 1030 1480 1690 -top 0 -bot 950
",
}

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: GPIO
proc create_hier_cell_GPIO { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_GPIO() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 GPIO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 GPIO1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1

  # Create pins
  create_bd_pin -dir O -type intr ip2intc_irpt
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -from 0 -to 0 -type rst s_axi_aresetn

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_GPIO_WIDTH {4} \
CONFIG.C_INTERRUPT_PRESENT {1} \
 ] $axi_gpio_0

  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {0} \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {4} \
 ] $axi_gpio_1

  # Create interface connections
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_pins GPIO] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO [get_bd_intf_pins GPIO1] [get_bd_intf_pins axi_gpio_1/GPIO]
  connect_bd_intf_net -intf_net axi_interconnect_1_M01_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M02_AXI [get_bd_intf_pins S_AXI1] [get_bd_intf_pins axi_gpio_1/S_AXI]

  # Create port connections
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins ip2intc_irpt] [get_bd_pins axi_gpio_0/ip2intc_irpt]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_gpio_1/s_axi_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_gpio_1/s_axi_aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ARM
proc create_hier_cell_ARM { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_ARM() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_GP0
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_HP0

  # Create pins
  create_bd_pin -dir O -type clk FCLK_CLK0
  create_bd_pin -dir O -type clk FCLK_CLK1
  create_bd_pin -dir I -from 0 -to 0 In0
  create_bd_pin -dir O -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type rst interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_reset

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {DDR PLL} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {150} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_IMPORT_BOARD_PRESET {/home/hidemi/workspace/ZYBO/ZYBO_zynq_def.xml} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
CONFIG.PCW_UIPARAM_GENERATE_SUMMARY {NONE} \
CONFIG.PCW_USB0_RESET_ENABLE {1} \
CONFIG.PCW_USB0_RESET_IO {MIO 46} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
 ] $processing_system7_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {1} \
 ] $xlconcat_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins S_AXI_HP0] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins M_AXI_GP0] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins In0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins interconnect_aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins peripheral_reset] [get_bd_pins proc_sys_reset_0/peripheral_reset]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins FCLK_CLK0] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins FCLK_CLK1] [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]

  # Perform GUI Layout
  regenerate_bd_layout -hierarchy [get_bd_cells /ARM] -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port DDR -pg 1 -y 20 -defaultsOSRD
preplace port M_AXI_GP0 -pg 1 -y 80 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 40 -defaultsOSRD
preplace port FCLK_CLK0 -pg 1 -y 100 -defaultsOSRD
preplace port FCLK_CLK1 -pg 1 -y 60 -defaultsOSRD
preplace port ext_reset_in -pg 1 -y 120 -defaultsOSRD
preplace port S_AXI_HP0 -pg 1 -y 60 -defaultsOSRD
preplace portBus In0 -pg 1 -y 120 -defaultsOSRD
preplace portBus peripheral_aresetn -pg 1 -y 250 -defaultsOSRD
preplace portBus interconnect_aresetn -pg 1 -y 230 -defaultsOSRD
preplace portBus peripheral_reset -pg 1 -y 210 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 1 -y 120 -defaultsOSRD
preplace inst proc_sys_reset_0 -pg 1 -lvl 3 -y 210 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 2 -y 80 -defaultsOSRD
preplace netloc processing_system7_0_DDR 1 2 2 NJ 20 NJ
preplace netloc processing_system7_0_M_AXI_GP0 1 2 2 NJ 80 NJ
preplace netloc processing_system7_0_FCLK_RESET0_N 1 2 2 580 120 NJ
preplace netloc proc_sys_reset_0_interconnect_aresetn 1 3 1 NJ
preplace netloc xlconcat_0_dout 1 1 1 NJ
preplace netloc processing_system7_0_FIXED_IO 1 2 2 NJ 40 NJ
preplace netloc axi_interconnect_0_M00_AXI 1 0 2 NJ 60 NJ
preplace netloc proc_sys_reset_0_peripheral_reset 1 3 1 NJ
preplace netloc proc_sys_reset_0_peripheral_aresetn 1 3 1 NJ
preplace netloc axi_gpio_0_ip2intc_irpt 1 0 1 NJ
preplace netloc processing_system7_0_FCLK_CLK0 1 1 3 130 190 560 100 NJ
preplace netloc processing_system7_0_FCLK_CLK1 1 1 3 140 200 NJ 60 NJ
levelinfo -pg 1 -70 40 350 740 930 -top -20 -bot 300
",
}

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set LED [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 LED ]
  set TGL_SW [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 TGL_SW ]

  # Create ports
  set CLK_LOCKED [ create_bd_port -dir O CLK_LOCKED ]
  set DOUT_B [ create_bd_port -dir O -from 7 -to 0 DOUT_B ]
  set DOUT_G [ create_bd_port -dir O -from 7 -to 0 DOUT_G ]
  set DOUT_R [ create_bd_port -dir O -from 7 -to 0 DOUT_R ]
  set HSYNC [ create_bd_port -dir O HSYNC ]
  set TMDS [ create_bd_port -dir O -from 3 -to 0 TMDS ]
  set TMDSB [ create_bd_port -dir O -from 3 -to 0 TMDSB ]
  set VSYNC [ create_bd_port -dir O VSYNC ]

  # Create instance: ARM
  create_hier_cell_ARM [current_bd_instance .] ARM

  # Create instance: GPIO
  create_hier_cell_GPIO [current_bd_instance .] GPIO

  # Create instance: VGA
  create_hier_cell_VGA [current_bd_instance .] VGA

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axi_interconnect_1

  # Create interface connections
  connect_bd_intf_net -intf_net aq_axi_dma_0_M_AXI [get_bd_intf_pins VGA/M_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports TGL_SW] [get_bd_intf_pins GPIO/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO [get_bd_intf_ports LED] [get_bd_intf_pins GPIO/GPIO1]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins ARM/S_AXI_HP0] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins VGA/S_AXI] [get_bd_intf_pins axi_interconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M01_AXI [get_bd_intf_pins GPIO/S_AXI] [get_bd_intf_pins axi_interconnect_1/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M02_AXI [get_bd_intf_pins GPIO/S_AXI1] [get_bd_intf_pins axi_interconnect_1/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins ARM/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins ARM/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins ARM/M_AXI_GP0] [get_bd_intf_pins axi_interconnect_1/S00_AXI]

  # Create port connections
  connect_bd_net -net M00_ACLK_1 [get_bd_pins ARM/FCLK_CLK1] [get_bd_pins VGA/M_AXI_ACLK] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK]
  connect_bd_net -net VGA_TMDS [get_bd_ports TMDS] [get_bd_pins VGA/TMDS]
  connect_bd_net -net VGA_TMDSB [get_bd_ports TMDSB] [get_bd_pins VGA/TMDSB]
  connect_bd_net -net VGA_locked [get_bd_ports CLK_LOCKED] [get_bd_pins VGA/CLK_LOCKED]
  connect_bd_net -net aq_vga_0_DOUT_B [get_bd_ports DOUT_B] [get_bd_pins VGA/DOUT_B]
  connect_bd_net -net aq_vga_0_DOUT_G [get_bd_ports DOUT_G] [get_bd_pins VGA/DOUT_G]
  connect_bd_net -net aq_vga_0_DOUT_R [get_bd_ports DOUT_R] [get_bd_pins VGA/DOUT_R]
  connect_bd_net -net aq_vga_0_HSYNC [get_bd_ports HSYNC] [get_bd_pins VGA/HSYNC]
  connect_bd_net -net aq_vga_0_VSYNC [get_bd_ports VSYNC] [get_bd_pins VGA/VSYNC]
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins ARM/In0] [get_bd_pins GPIO/ip2intc_irpt]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins ARM/interconnect_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_1/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins ARM/peripheral_aresetn] [get_bd_pins GPIO/s_axi_aresetn] [get_bd_pins VGA/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/M01_ARESETN] [get_bd_pins axi_interconnect_1/M02_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins ARM/peripheral_reset] [get_bd_pins VGA/reset]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins ARM/FCLK_CLK0] [get_bd_pins GPIO/s_axi_aclk] [get_bd_pins VGA/ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/M01_ACLK] [get_bd_pins axi_interconnect_1/M02_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins ARM/ext_reset_in] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces ARM/processing_system7_0/Data] [get_bd_addr_segs VGA/aq_axi_lite_slave_0/S_AXI/reg0] SEG_aq_axi_lite_slave_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x40010000 [get_bd_addr_spaces ARM/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40020000 [get_bd_addr_spaces ARM/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_1/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces VGA/aq_axi_dma_0/M_AXI] [get_bd_addr_segs ARM/processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port DDR -pg 1 -y 50 -defaultsOSRD
preplace port VSYNC -pg 1 -y 470 -defaultsOSRD
preplace port HSYNC -pg 1 -y 450 -defaultsOSRD
preplace port CLK_LOCKED -pg 1 -y 550 -defaultsOSRD
preplace port LED -pg 1 -y 590 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 70 -defaultsOSRD
preplace port TGL_SW -pg 1 -y 570 -defaultsOSRD
preplace portBus DOUT_G -pg 1 -y 410 -defaultsOSRD
preplace portBus TMDS -pg 1 -y 510 -defaultsOSRD
preplace portBus TMDSB -pg 1 -y 530 -defaultsOSRD
preplace portBus DOUT_B -pg 1 -y 390 -defaultsOSRD
preplace portBus DOUT_R -pg 1 -y 430 -defaultsOSRD
preplace inst VGA -pg 1 -lvl 2 -y 460 -defaultsOSRD
preplace inst ARM -pg 1 -lvl 2 -y 120 -defaultsOSRD
preplace inst axi_interconnect_0 -pg 1 -lvl 1 -y 130 -defaultsOSRD
preplace inst axi_interconnect_1 -pg 1 -lvl 1 -y 440 -defaultsOSRD
preplace inst GPIO -pg 1 -lvl 2 -y 662 -defaultsOSRD
preplace netloc processing_system7_0_DDR 1 2 1 NJ
preplace netloc axi_interconnect_1_M01_AXI 1 1 1 370
preplace netloc processing_system7_0_M_AXI_GP0 1 0 3 20 -20 NJ -20 830
preplace netloc VGA_locked 1 2 1 860
preplace netloc VGA_TMDSB 1 2 1 NJ
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 3 40 270 NJ 270 830
preplace netloc aq_vga_0_DOUT_B 1 2 1 NJ
preplace netloc aq_vga_0_HSYNC 1 2 1 NJ
preplace netloc axi_interconnect_1_M02_AXI 1 1 1 360
preplace netloc proc_sys_reset_0_interconnect_aresetn 1 0 3 10 -30 NJ -30 840
preplace netloc aq_vga_0_VSYNC 1 2 1 NJ
preplace netloc aq_vga_0_DOUT_R 1 2 1 NJ
preplace netloc processing_system7_0_FIXED_IO 1 2 1 NJ
preplace netloc aq_axi_dma_0_M_AXI 1 0 3 30 260 NJ 260 810
preplace netloc VGA_TMDS 1 2 1 NJ
preplace netloc axi_gpio_0_GPIO 1 2 1 NJ
preplace netloc axi_interconnect_0_M00_AXI 1 1 1 390
preplace netloc proc_sys_reset_0_peripheral_reset 1 1 2 410 280 820
preplace netloc proc_sys_reset_0_peripheral_aresetn 1 0 3 50 600 400 740 840
preplace netloc axi_gpio_0_ip2intc_irpt 1 1 2 400 320 800
preplace netloc aq_vga_0_DOUT_G 1 2 1 NJ
preplace netloc processing_system7_0_FCLK_CLK0 1 0 3 40 610 380 750 850
preplace netloc axi_gpio_1_GPIO 1 2 1 NJ
preplace netloc axi_interconnect_1_M00_AXI 1 1 1 N
preplace netloc M00_ACLK_1 1 0 3 50 250 NJ 250 810
levelinfo -pg 1 -10 210 650 900 -top -40 -bot 780
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


