
################################################################
# This is a generated script based on design: Zybo
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.3
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
# source Zybo_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1


# CHANGE DESIGN NAME HERE
set design_name Zybo

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

  # Create ports
  set TMDS [ create_bd_port -dir O -from 3 -to 0 TMDS ]
  set TMDSB [ create_bd_port -dir O -from 3 -to 0 TMDSB ]
  set V_B [ create_bd_port -dir O -from 4 -to 0 V_B ]
  set V_G [ create_bd_port -dir O -from 5 -to 0 -type data V_G ]
  set V_HSYNC [ create_bd_port -dir O V_HSYNC ]
  set V_R [ create_bd_port -dir O -from 4 -to 0 V_R ]
  set V_VSYNC [ create_bd_port -dir O V_VSYNC ]

  # Create instance: aq_axi_djpeg_0, and set properties
  set aq_axi_djpeg_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_djpeg:1.0 aq_axi_djpeg_0 ]
  set_property -dict [ list CONFIG.C_BASEADRS {0x40010000}  ] $aq_axi_djpeg_0

  # Create instance: aq_axi_fifo_0, and set properties
  set aq_axi_fifo_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_fifo:1.0 aq_axi_fifo_0 ]
  set_property -dict [ list CONFIG.C_ADRSWIDTH {16}  ] $aq_axi_fifo_0

  # Create instance: aq_axi_vdma_0, and set properties
  set aq_axi_vdma_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_vdma:1.0 aq_axi_vdma_0 ]
  set_property -dict [ list CONFIG.C_ADRSWIDTH {16} CONFIG.C_BASEADRS {0x40020000}  ] $aq_axi_vdma_0

  # Create instance: aq_fifo6432_0, and set properties
  set aq_fifo6432_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_fifo6432:1.0 aq_fifo6432_0 ]

  # Create instance: aq_fifo6432_1, and set properties
  set aq_fifo6432_1 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_fifo6432:1.0 aq_fifo6432_1 ]

  # Create instance: aq_hdmi_enc_0, and set properties
  set aq_hdmi_enc_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_hdmi_enc:1.0 aq_hdmi_enc_0 ]

  # Create instance: aq_intreg_0, and set properties
  set aq_intreg_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_intreg:1.0 aq_intreg_0 ]

  # Create instance: aq_sg_0, and set properties
  set aq_sg_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_sg:1.0 aq_sg_0 ]

  # Create instance: aq_zybo_vga_0, and set properties
  set aq_zybo_vga_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_zybo_vga:1.0 aq_zybo_vga_0 ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list CONFIG.NUM_MI {3}  ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list CONFIG.NUM_MI {1} CONFIG.NUM_SI {2}  ] $axi_interconnect_1

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {65} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {325} CONFIG.CLKOUT2_USED {true} CONFIG.CLKOUT3_USED {false} CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} CONFIG.OVERRIDE_MMCM {false} CONFIG.PRIMITIVE {PLL} CONFIG.RESET_TYPE {ACTIVE_LOW} CONFIG.USE_LOCKED {true}  ] $clk_wiz_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_EN_CLK1_PORT {0} CONFIG.PCW_EN_CLK3_PORT {0} CONFIG.PCW_EN_RST1_PORT {0} CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {50} CONFIG.PCW_IMPORT_BOARD_PRESET {ZYBO_zynq_def.xml} CONFIG.PCW_USE_S_AXI_HP0 {1}  ] $processing_system7_0

  # Create interface connections
  connect_bd_intf_net -intf_net aq_axi_fifo_0_M_AXI [get_bd_intf_pins aq_axi_fifo_0/M_AXI] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net aq_axi_vdma_0_M_AXI [get_bd_intf_pins aq_axi_vdma_0/M_AXI] [get_bd_intf_pins axi_interconnect_1/S01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins aq_axi_djpeg_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins aq_axi_fifo_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins aq_axi_vdma_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net aq_axi_djpeg_0_DATA_OUT [get_bd_pins aq_axi_djpeg_0/DATA_OUT] [get_bd_pins aq_fifo6432_0/RD_IN_DI]
  connect_bd_net -net aq_axi_djpeg_0_READ [get_bd_pins aq_axi_djpeg_0/READ] [get_bd_pins aq_fifo6432_0/WR_OUT_RE]
  connect_bd_net -net aq_axi_djpeg_0_WRITE [get_bd_pins aq_axi_djpeg_0/WRITE] [get_bd_pins aq_fifo6432_0/RD_IN_WE]
  connect_bd_net -net aq_axi_fifo_0_FIFO_DOUT [get_bd_pins aq_axi_fifo_0/FIFO_DOUT] [get_bd_pins aq_fifo6432_0/WR_IN_DATA]
  connect_bd_net -net aq_axi_fifo_0_FIFO_EMPTY [get_bd_pins aq_axi_fifo_0/FIFO_EMPTY] [get_bd_pins aq_fifo6432_0/WR_IN_EMPTY]
  connect_bd_net -net aq_axi_fifo_0_FIFO_FULL [get_bd_pins aq_axi_fifo_0/FIFO_FULL] [get_bd_pins aq_fifo6432_0/RD_OUT_FULL]
  connect_bd_net -net aq_axi_fifo_0_FIFO_RST [get_bd_pins aq_axi_fifo_0/FIFO_RST] [get_bd_pins aq_fifo6432_0/RST]
  connect_bd_net -net aq_axi_vdma_0_FIFO_RD_DOUT1 [get_bd_pins aq_axi_vdma_0/FIFO_RD_DOUT] [get_bd_pins aq_fifo6432_1/WR_IN_DATA]
  connect_bd_net -net aq_axi_vdma_0_FIFO_RD_EMPTY1 [get_bd_pins aq_axi_vdma_0/FIFO_RD_EMPTY] [get_bd_pins aq_fifo6432_1/WR_IN_EMPTY]
  connect_bd_net -net aq_axi_vdma_0_FIFO_RST [get_bd_pins aq_axi_vdma_0/FIFO_RST] [get_bd_pins aq_fifo6432_1/RST]
  connect_bd_net -net aq_fifo6432_0_DO [get_bd_pins aq_axi_djpeg_0/DATA_IN] [get_bd_pins aq_fifo6432_0/WR_OUT_DO]
  connect_bd_net -net aq_fifo6432_0_EMPTY [get_bd_pins aq_axi_djpeg_0/EMPTY] [get_bd_pins aq_fifo6432_0/WR_OUT_EMPTY]
  connect_bd_net -net aq_fifo6432_0_FULL [get_bd_pins aq_axi_djpeg_0/FULL] [get_bd_pins aq_fifo6432_0/RD_IN_FULL]
  connect_bd_net -net aq_fifo6432_0_RD_DATA [get_bd_pins aq_axi_fifo_0/FIFO_DIN] [get_bd_pins aq_fifo6432_0/RD_OUT_DATA]
  connect_bd_net -net aq_fifo6432_0_RD_WE [get_bd_pins aq_axi_fifo_0/FIFO_WR_EN] [get_bd_pins aq_fifo6432_0/RD_OUT_WE]
  connect_bd_net -net aq_fifo6432_0_WR_RE [get_bd_pins aq_axi_fifo_0/FIFO_RD_EN] [get_bd_pins aq_fifo6432_0/WR_IN_RE]
  connect_bd_net -net aq_fifo6432_1_DO [get_bd_pins aq_fifo6432_1/WR_OUT_DO] [get_bd_pins aq_hdmi_enc_0/DIN] [get_bd_pins aq_zybo_vga_0/DIN]
  connect_bd_net -net aq_fifo6432_1_WR_RE [get_bd_pins aq_axi_vdma_0/FIFO_RD_EN] [get_bd_pins aq_fifo6432_1/WR_IN_RE]
  connect_bd_net -net aq_hdmi_enc_0_TMDS [get_bd_ports TMDS] [get_bd_pins aq_hdmi_enc_0/TMDS]
  connect_bd_net -net aq_hdmi_enc_0_TMDSB [get_bd_ports TMDSB] [get_bd_pins aq_hdmi_enc_0/TMDSB]
  connect_bd_net -net aq_intreg_0_INT [get_bd_pins aq_axi_vdma_0/FSYNC] [get_bd_pins aq_intreg_0/INT]
  connect_bd_net -net aq_sg_0_ACTIVE [get_bd_pins aq_fifo6432_1/WR_OUT_RE] [get_bd_pins aq_hdmi_enc_0/DE] [get_bd_pins aq_sg_0/ACTIVE] [get_bd_pins aq_zybo_vga_0/ACTIVE]
  connect_bd_net -net aq_sg_0_FSYNC [get_bd_pins aq_intreg_0/DIN] [get_bd_pins aq_sg_0/FSYNC]
  connect_bd_net -net aq_sg_0_HSYNC [get_bd_pins aq_hdmi_enc_0/HSYNC] [get_bd_pins aq_sg_0/HSYNC] [get_bd_pins aq_zybo_vga_0/HIN]
  connect_bd_net -net aq_sg_0_VSYNC [get_bd_pins aq_hdmi_enc_0/VSYNC] [get_bd_pins aq_sg_0/VSYNC] [get_bd_pins aq_zybo_vga_0/VIN]
  connect_bd_net -net aq_zybo_vga_0_DOUT_B [get_bd_ports V_B] [get_bd_pins aq_zybo_vga_0/DOUT_B]
  connect_bd_net -net aq_zybo_vga_0_DOUT_G [get_bd_ports V_G] [get_bd_pins aq_zybo_vga_0/DOUT_G]
  connect_bd_net -net aq_zybo_vga_0_DOUT_R [get_bd_ports V_R] [get_bd_pins aq_zybo_vga_0/DOUT_R]
  connect_bd_net -net aq_zybo_vga_0_HSYNC [get_bd_ports V_HSYNC] [get_bd_pins aq_zybo_vga_0/HSYNC]
  connect_bd_net -net aq_zybo_vga_0_VSYNC [get_bd_ports V_VSYNC] [get_bd_pins aq_zybo_vga_0/VSYNC]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins aq_axi_vdma_0/FIFO_RD_CLK] [get_bd_pins aq_fifo6432_1/RD_CLK] [get_bd_pins aq_fifo6432_1/WR_CLK] [get_bd_pins aq_hdmi_enc_0/PCLK] [get_bd_pins aq_intreg_0/CLKA] [get_bd_pins aq_sg_0/CLK] [get_bd_pins aq_zybo_vga_0/CLK] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins aq_hdmi_enc_0/PCLK2] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins aq_hdmi_enc_0/RST_N] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins aq_axi_djpeg_0/CLK] [get_bd_pins aq_axi_djpeg_0/S_AXI_ACLK] [get_bd_pins aq_axi_fifo_0/FIFO_RD_CLK] [get_bd_pins aq_axi_fifo_0/FIFO_WR_CLK] [get_bd_pins aq_axi_fifo_0/M_AXI_ACLK] [get_bd_pins aq_axi_fifo_0/S_AXI_ACLK] [get_bd_pins aq_axi_vdma_0/FIFO_WR_CLK] [get_bd_pins aq_axi_vdma_0/M_AXI_ACLK] [get_bd_pins aq_axi_vdma_0/S_AXI_ACLK] [get_bd_pins aq_fifo6432_0/RD_CLK] [get_bd_pins aq_fifo6432_0/WR_CLK] [get_bd_pins aq_intreg_0/CLKB] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_interconnect_1/S01_ACLK] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins clk_wiz_0/resetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N1 [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net processing_system7_0_FCLK_RESET1_N [get_bd_pins aq_axi_djpeg_0/RST_N] [get_bd_pins aq_axi_fifo_0/ARESETN] [get_bd_pins aq_axi_vdma_0/ARESETN] [get_bd_pins aq_intreg_0/RST_N] [get_bd_pins aq_sg_0/RST_N] [get_bd_pins aq_zybo_vga_0/RST_N] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_interconnect_1/S01_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces aq_axi_fifo_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces aq_axi_vdma_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x10000 -offset 0x40010000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs aq_axi_djpeg_0/S_AXI/reg0] SEG_aq_axi_djpeg_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs aq_axi_fifo_0/S_AXI/reg0] SEG_aq_axi_fifo_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x40020000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs aq_axi_vdma_0/S_AXI/REG] SEG_aq_axi_vdma_0_reg0
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


