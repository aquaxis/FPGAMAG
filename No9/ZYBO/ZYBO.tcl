
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
set scripts_vivado_version 2014.4
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


# CHANGE DESIGN NAME HERE
set design_name ZYBO

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


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


# Hierarchical cell: VIDEO_OUT
proc create_hier_cell_VIDEO_OUT { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_VIDEO_OUT() - Empty argument(s)!"
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
  create_bd_pin -dir I CLKB
  create_bd_pin -dir O -from 3 -to 0 TMDS
  create_bd_pin -dir O -from 3 -to 0 TMDSB
  create_bd_pin -dir I clk_in1
  create_bd_pin -dir I -from 0 -to 0 -type rst resetn

  # Create instance: aq_axi_vdma_0, and set properties
  set aq_axi_vdma_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_vdma:1.0 aq_axi_vdma_0 ]

  # Create instance: aq_fifo6432_0, and set properties
  set aq_fifo6432_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_fifo6432:1.0 aq_fifo6432_0 ]

  # Create instance: aq_hdmi_enc_0, and set properties
  set aq_hdmi_enc_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_hdmi_enc:1.0 aq_hdmi_enc_0 ]

  # Create instance: aq_intreg_0, and set properties
  set aq_intreg_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_intreg:1.0 aq_intreg_0 ]

  # Create instance: aq_sg_0, and set properties
  set aq_sg_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_sg:1.0 aq_sg_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_JITTER {142.278} CONFIG.CLKOUT1_PHASE_ERROR {99.281} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {65} CONFIG.CLKOUT2_JITTER {104.357} CONFIG.CLKOUT2_PHASE_ERROR {99.281} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {325} CONFIG.CLKOUT2_USED {true} CONFIG.NUM_OUT_CLKS {2} CONFIG.PRIM_IN_FREQ {100.000} CONFIG.RESET_TYPE {ACTIVE_LOW}  ] $clk_wiz_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXI] [get_bd_intf_pins aq_axi_vdma_0/M_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI] [get_bd_intf_pins aq_axi_vdma_0/S_AXI]

  # Create port connections
  connect_bd_net -net CLKB_1 [get_bd_pins CLKB] [get_bd_pins aq_axi_vdma_0/M_AXI_ACLK] [get_bd_pins aq_axi_vdma_0/S_AXI_ACLK] [get_bd_pins aq_intreg_0/CLKB]
  connect_bd_net -net aq_axi_vdma_0_FIFO_RD_DOUT [get_bd_pins aq_axi_vdma_0/FIFO_RD_DOUT] [get_bd_pins aq_fifo6432_0/WR_IN_DATA]
  connect_bd_net -net aq_axi_vdma_0_FIFO_RD_EMPTY [get_bd_pins aq_axi_vdma_0/FIFO_RD_EMPTY] [get_bd_pins aq_fifo6432_0/WR_IN_EMPTY]
  connect_bd_net -net aq_axi_vdma_0_FIFO_RST [get_bd_pins aq_axi_vdma_0/FIFO_RST] [get_bd_pins aq_fifo6432_0/RST]
  connect_bd_net -net aq_fifo6432_0_WR_IN_RE [get_bd_pins aq_axi_vdma_0/FIFO_RD_EN] [get_bd_pins aq_fifo6432_0/WR_IN_RE]
  connect_bd_net -net aq_fifo6432_0_WR_OUT_DO [get_bd_pins aq_fifo6432_0/WR_OUT_DO] [get_bd_pins aq_hdmi_enc_0/DIN]
  connect_bd_net -net aq_hdmi_enc_0_TMDS [get_bd_pins TMDS] [get_bd_pins aq_hdmi_enc_0/TMDS]
  connect_bd_net -net aq_hdmi_enc_0_TMDSB [get_bd_pins TMDSB] [get_bd_pins aq_hdmi_enc_0/TMDSB]
  connect_bd_net -net aq_intreg_0_INT [get_bd_pins aq_axi_vdma_0/FSYNC] [get_bd_pins aq_intreg_0/INT]
  connect_bd_net -net aq_sg_0_ACTIVE [get_bd_pins aq_fifo6432_0/WR_OUT_RE] [get_bd_pins aq_hdmi_enc_0/DE] [get_bd_pins aq_sg_0/ACTIVE]
  connect_bd_net -net aq_sg_0_FSYNC [get_bd_pins aq_intreg_0/DIN] [get_bd_pins aq_sg_0/FSYNC]
  connect_bd_net -net aq_sg_0_HSYNC [get_bd_pins aq_hdmi_enc_0/HSYNC] [get_bd_pins aq_sg_0/HSYNC]
  connect_bd_net -net aq_sg_0_VSYNC [get_bd_pins aq_hdmi_enc_0/VSYNC] [get_bd_pins aq_sg_0/VSYNC]
  connect_bd_net -net clk_in1_1 [get_bd_pins clk_in1] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins aq_axi_vdma_0/FIFO_RD_CLK] [get_bd_pins aq_fifo6432_0/WR_CLK] [get_bd_pins aq_hdmi_enc_0/PCLK] [get_bd_pins aq_intreg_0/CLKA] [get_bd_pins aq_sg_0/CLK] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins aq_hdmi_enc_0/PCLK2] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins aq_hdmi_enc_0/RST_N] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net resetn_1 [get_bd_pins resetn] [get_bd_pins aq_axi_vdma_0/ARESETN] [get_bd_pins aq_intreg_0/RST_N] [get_bd_pins aq_sg_0/RST_N] [get_bd_pins clk_wiz_0/resetn]
  
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 GPIO2
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI2

  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -from 0 -to 0 -type rst s_axi_aresetn

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_GPIO_WIDTH {4}  ] $axi_gpio_0

  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {4}  ] $axi_gpio_1

  # Create instance: axi_gpio_2, and set properties
  set axi_gpio_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_2 ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {4}  ] $axi_gpio_2

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins GPIO] [get_bd_intf_pins axi_gpio_1/GPIO]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXI1] [get_bd_intf_pins axi_gpio_1/S_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S_AXI2] [get_bd_intf_pins axi_gpio_2/S_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins GPIO1] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins GPIO2] [get_bd_intf_pins axi_gpio_2/GPIO]

  # Create port connections
  connect_bd_net -net s_axi_aclk_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_gpio_1/s_axi_aclk] [get_bd_pins axi_gpio_2/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_gpio_1/s_axi_aresetn] [get_bd_pins axi_gpio_2/s_axi_aresetn]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: CPU
proc create_hier_cell_CPU { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_CPU() - Empty argument(s)!"
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
  create_bd_pin -dir O -type clk CLK100MHz
  create_bd_pin -dir O CLK100MHz_2
  create_bd_pin -dir O -type clk CLK12MHz
  create_bd_pin -dir O -from 0 -to 0 -type rst interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_EN_CLK1_PORT {1} CONFIG.PCW_EN_CLK2_PORT {1} CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {ARM PLL} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {12.288} CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} CONFIG.PCW_IMPORT_BOARD_PRESET {/home/hidemi/workspace/ZYBO/ZYBO_zynq_def.xml} CONFIG.PCW_USB0_RESET_ENABLE {1} CONFIG.PCW_USB0_RESET_IO {MIO 46} CONFIG.PCW_USE_S_AXI_HP0 {1}  ] $processing_system7_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI_HP0] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXI_GP0] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins DDR] [get_bd_intf_pins processing_system7_0/DDR]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins interconnect_aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins CLK100MHz] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins CLK100MHz_2] [get_bd_pins processing_system7_0/FCLK_CLK1]
  connect_bd_net -net processing_system7_0_FCLK_CLK2 [get_bd_pins CLK12MHz] [get_bd_pins processing_system7_0/FCLK_CLK2]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: AUDIO
proc create_hier_cell_AUDIO { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_AUDIO() - Empty argument(s)!"
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI2

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 -type rst ARESETN
  create_bd_pin -dir O BCLK
  create_bd_pin -dir IO I2C_SCL
  create_bd_pin -dir IO I2C_SDA
  create_bd_pin -dir I MCLK
  create_bd_pin -dir O MUTEN
  create_bd_pin -dir I -type clk M_AXI_ACLK
  create_bd_pin -dir O PBDAT
  create_bd_pin -dir O PBLRC
  create_bd_pin -dir I RECDAT
  create_bd_pin -dir O RECLRC

  # Create instance: aq_axi_fifo_0, and set properties
  set aq_axi_fifo_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_fifo:1.0 aq_axi_fifo_0 ]

  # Create instance: aq_axi_i2c_0, and set properties
  set aq_axi_i2c_0 [ create_bd_cell -type ip -vlnv com.aquaxis:user:aq_axi_i2c:1.0 aq_axi_i2c_0 ]

  # Create instance: aq_axi_ssm2603_0, and set properties
  set aq_axi_ssm2603_0 [ create_bd_cell -type ip -vlnv com.aquaxis:user:aq_axi_ssm2603:1.0 aq_axi_ssm2603_0 ]

  # Create instance: aq_fifo6432_0, and set properties
  set aq_fifo6432_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_fifo6432:1.0 aq_fifo6432_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins aq_axi_i2c_0/S_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI] [get_bd_intf_pins aq_axi_fifo_0/M_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXI1] [get_bd_intf_pins aq_axi_ssm2603_0/S_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S_AXI2] [get_bd_intf_pins aq_axi_fifo_0/S_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins aq_axi_fifo_0/ARESETN] [get_bd_pins aq_axi_i2c_0/ARESETN] [get_bd_pins aq_axi_ssm2603_0/ARESETN]
  connect_bd_net -net MCLK_1 [get_bd_pins MCLK] [get_bd_pins aq_axi_fifo_0/FIFO_RD_CLK] [get_bd_pins aq_axi_fifo_0/FIFO_WR_CLK] [get_bd_pins aq_axi_ssm2603_0/MCLK] [get_bd_pins aq_fifo6432_0/RD_CLK] [get_bd_pins aq_fifo6432_0/WR_CLK]
  connect_bd_net -net M_AXI_ACLK_1 [get_bd_pins M_AXI_ACLK] [get_bd_pins aq_axi_fifo_0/M_AXI_ACLK] [get_bd_pins aq_axi_fifo_0/S_AXI_ACLK] [get_bd_pins aq_axi_i2c_0/S_AXI_ACLK] [get_bd_pins aq_axi_ssm2603_0/ACLK]
  connect_bd_net -net Net [get_bd_pins I2C_SDA] [get_bd_pins aq_axi_i2c_0/I2C_SDA]
  connect_bd_net -net Net1 [get_bd_pins I2C_SCL] [get_bd_pins aq_axi_i2c_0/I2C_SCL]
  connect_bd_net -net RECDAT_1 [get_bd_pins RECDAT] [get_bd_pins aq_axi_ssm2603_0/RECDAT]
  connect_bd_net -net aq_axi_fifo_0_FIFO_RD_DO [get_bd_pins aq_axi_fifo_0/FIFO_RD_DO] [get_bd_pins aq_fifo6432_0/WR_IN_DATA]
  connect_bd_net -net aq_axi_fifo_0_FIFO_RD_EMPTY [get_bd_pins aq_axi_fifo_0/FIFO_RD_EMPTY] [get_bd_pins aq_fifo6432_0/WR_IN_EMPTY]
  connect_bd_net -net aq_axi_fifo_0_FIFO_RST [get_bd_pins aq_axi_fifo_0/FIFO_RST] [get_bd_pins aq_fifo6432_0/RST]
  connect_bd_net -net aq_axi_fifo_0_FIFO_WR_FULL [get_bd_pins aq_axi_fifo_0/FIFO_WR_FULL] [get_bd_pins aq_fifo6432_0/RD_OUT_FULL]
  connect_bd_net -net aq_axi_ssm2603_0_BCLK [get_bd_pins BCLK] [get_bd_pins aq_axi_ssm2603_0/BCLK]
  connect_bd_net -net aq_axi_ssm2603_0_FIFO_RD_ENA [get_bd_pins aq_axi_ssm2603_0/FIFO_RD_ENA] [get_bd_pins aq_fifo6432_0/WR_OUT_RE]
  connect_bd_net -net aq_axi_ssm2603_0_FIFO_WR_DATA [get_bd_pins aq_axi_ssm2603_0/FIFO_WR_DATA] [get_bd_pins aq_fifo6432_0/RD_IN_DI]
  connect_bd_net -net aq_axi_ssm2603_0_FIFO_WR_ENA [get_bd_pins aq_axi_ssm2603_0/FIFO_WR_ENA] [get_bd_pins aq_fifo6432_0/RD_IN_WE]
  connect_bd_net -net aq_axi_ssm2603_0_MUTEN [get_bd_pins MUTEN] [get_bd_pins aq_axi_ssm2603_0/MUTEN]
  connect_bd_net -net aq_axi_ssm2603_0_PBDAT [get_bd_pins PBDAT] [get_bd_pins aq_axi_ssm2603_0/PBDAT]
  connect_bd_net -net aq_axi_ssm2603_0_PBLRC [get_bd_pins PBLRC] [get_bd_pins aq_axi_ssm2603_0/PBLRC]
  connect_bd_net -net aq_axi_ssm2603_0_RECLRC [get_bd_pins RECLRC] [get_bd_pins aq_axi_ssm2603_0/RECLRC]
  connect_bd_net -net aq_fifo6432_0_RD_OUT_DATA [get_bd_pins aq_axi_fifo_0/FIFO_WR_DI] [get_bd_pins aq_fifo6432_0/RD_OUT_DATA]
  connect_bd_net -net aq_fifo6432_0_RD_OUT_WE [get_bd_pins aq_axi_fifo_0/FIFO_WR_EN] [get_bd_pins aq_fifo6432_0/RD_OUT_WE]
  connect_bd_net -net aq_fifo6432_0_WR_IN_RE [get_bd_pins aq_axi_fifo_0/FIFO_RD_EN] [get_bd_pins aq_fifo6432_0/WR_IN_RE]
  connect_bd_net -net aq_fifo6432_0_WR_OUT_DO [get_bd_pins aq_axi_ssm2603_0/FIFO_RD_DATA] [get_bd_pins aq_fifo6432_0/WR_OUT_DO]
  connect_bd_net -net aq_fifo6432_0_WR_OUT_EMPTY [get_bd_pins aq_axi_ssm2603_0/FIFO_RD_EMPTY] [get_bd_pins aq_fifo6432_0/WR_OUT_EMPTY]
  
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
  set PUSH_SW [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PUSH_SW ]
  set TGR_SW [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 TGR_SW ]

  # Create ports
  set BCLK [ create_bd_port -dir O BCLK ]
  set I2C_SCL [ create_bd_port -dir IO I2C_SCL ]
  set I2C_SDA [ create_bd_port -dir IO I2C_SDA ]
  set MCLK [ create_bd_port -dir O MCLK ]
  set MUTEN [ create_bd_port -dir O MUTEN ]
  set PBDAT [ create_bd_port -dir O PBDAT ]
  set PBLRC [ create_bd_port -dir O PBLRC ]
  set PROBE [ create_bd_port -dir I -from 7 -to 0 PROBE ]
  set RECDAT [ create_bd_port -dir I RECDAT ]
  set RECLRC [ create_bd_port -dir O RECLRC ]
  set TMDS [ create_bd_port -dir O -from 3 -to 0 TMDS ]
  set TMDSB [ create_bd_port -dir O -from 3 -to 0 TMDSB ]

  # Create instance: AUDIO
  create_hier_cell_AUDIO [current_bd_instance .] AUDIO

  # Create instance: CPU
  create_hier_cell_CPU [current_bd_instance .] CPU

  # Create instance: GPIO
  create_hier_cell_GPIO [current_bd_instance .] GPIO

  # Create instance: VIDEO_OUT
  create_hier_cell_VIDEO_OUT [current_bd_instance .] VIDEO_OUT

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {8}  ] $axi_gpio_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list CONFIG.NUM_MI {8}  ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list CONFIG.NUM_MI {1} CONFIG.NUM_SI {2}  ] $axi_interconnect_1

  # Create interface connections
  connect_bd_intf_net -intf_net CPU_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins CPU/DDR]
  connect_bd_intf_net -intf_net CPU_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins CPU/FIXED_IO]
  connect_bd_intf_net -intf_net GPIO_GPIO [get_bd_intf_ports TGR_SW] [get_bd_intf_pins GPIO/GPIO]
  connect_bd_intf_net -intf_net GPIO_GPIO1 [get_bd_intf_ports LED] [get_bd_intf_pins GPIO/GPIO1]
  connect_bd_intf_net -intf_net GPIO_GPIO2 [get_bd_intf_ports PUSH_SW] [get_bd_intf_pins GPIO/GPIO2]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins CPU/M_AXI_GP0] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins VIDEO_OUT/M_AXI] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins AUDIO/M_AXI] [get_bd_intf_pins axi_interconnect_1/S01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins VIDEO_OUT/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins GPIO/S_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins GPIO/S_AXI1] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins GPIO/S_AXI2] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins AUDIO/S_AXI2] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_pins AUDIO/S_AXI1] [get_bd_intf_pins axi_interconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins AUDIO/S_AXI] [get_bd_intf_pins axi_interconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M07_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M07_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins CPU/S_AXI_HP0] [get_bd_intf_pins axi_interconnect_1/M00_AXI]

  # Create port connections
  connect_bd_net -net AUDIO_BCLK [get_bd_ports BCLK] [get_bd_pins AUDIO/BCLK]
  connect_bd_net -net AUDIO_MUTEN [get_bd_ports MUTEN] [get_bd_pins AUDIO/MUTEN]
  connect_bd_net -net AUDIO_PBDAT [get_bd_ports PBDAT] [get_bd_pins AUDIO/PBDAT]
  connect_bd_net -net AUDIO_PBLRC [get_bd_ports PBLRC] [get_bd_pins AUDIO/PBLRC]
  connect_bd_net -net AUDIO_RECLRC [get_bd_ports RECLRC] [get_bd_pins AUDIO/RECLRC]
  connect_bd_net -net CPU_FCLK_CLK2 [get_bd_ports MCLK] [get_bd_pins AUDIO/MCLK] [get_bd_pins CPU/CLK12MHz]
  connect_bd_net -net Net [get_bd_ports I2C_SDA] [get_bd_pins AUDIO/I2C_SDA]
  connect_bd_net -net Net1 [get_bd_ports I2C_SCL] [get_bd_pins AUDIO/I2C_SCL]
  connect_bd_net -net PROBE_1 [get_bd_ports PROBE] [get_bd_pins axi_gpio_0/gpio_io_i]
  connect_bd_net -net RECDAT_1 [get_bd_ports RECDAT] [get_bd_pins AUDIO/RECDAT]
  connect_bd_net -net VIDEO_OUT_TMDS [get_bd_ports TMDS] [get_bd_pins VIDEO_OUT/TMDS]
  connect_bd_net -net VIDEO_OUT_TMDSB [get_bd_ports TMDSB] [get_bd_pins VIDEO_OUT/TMDSB]
  connect_bd_net -net clk_in1_1 [get_bd_pins CPU/CLK100MHz_2] [get_bd_pins VIDEO_OUT/clk_in1]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins CPU/interconnect_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_1/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins AUDIO/ARESETN] [get_bd_pins CPU/peripheral_aresetn] [get_bd_pins GPIO/s_axi_aresetn] [get_bd_pins VIDEO_OUT/resetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_interconnect_1/S01_ARESETN]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins AUDIO/M_AXI_ACLK] [get_bd_pins CPU/CLK100MHz] [get_bd_pins GPIO/s_axi_aclk] [get_bd_pins VIDEO_OUT/CLKB] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_interconnect_1/S01_ACLK]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces AUDIO/aq_axi_fifo_0/M_AXI] [get_bd_addr_segs CPU/processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x10000 -offset 0x42000000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs AUDIO/aq_axi_fifo_0/S_AXI/reg0] SEG_aq_axi_fifo_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x42020000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs AUDIO/aq_axi_i2c_0/S_AXI/reg0] SEG_aq_axi_i2c_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x42010000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs AUDIO/aq_axi_ssm2603_0/S_AXI/reg0] SEG_aq_axi_ssm2603_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs VIDEO_OUT/aq_axi_vdma_0/S_AXI/REG] SEG_aq_axi_vdma_0_REG
  create_bd_addr_seg -range 0x10000 -offset 0x41000000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43000000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg1
  create_bd_addr_seg -range 0x10000 -offset 0x41010000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_1/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41020000 [get_bd_addr_spaces CPU/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_2/S_AXI/Reg] SEG_axi_gpio_2_Reg
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces VIDEO_OUT/aq_axi_vdma_0/M_AXI] [get_bd_addr_segs CPU/processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


