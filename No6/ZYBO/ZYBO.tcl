
################################################################
# This is a generated script based on design: DJPEG_ZYBO
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.2
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
# source DJPEG_ZYBO_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1


# CHANGE DESIGN NAME HERE
set design_name DJPEG_ZYBO

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

if { ${design_name} ne "" && ${cur_design} eq ${design_name} } {

   # Checks if design is empty or not
   if { $list_cells ne "" } {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 1
   } else {
      puts "INFO: Constructing design in IPI design <$design_name>..."
   }
} elseif { ${cur_design} ne "" && ${cur_design} ne ${design_name} } {

   if { $list_cells eq "" } {
      puts "INFO: You have an empty design <${cur_design}>. Will go ahead and create design..."
   } else {
      set errMsg "ERROR: Design <${cur_design}> is not empty! Please do not source this script on non-empty designs."
      set nRet 1
   }
} else {

   if { [get_files -quiet ${design_name}.bd] eq "" } {
      puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

      create_bd_design $design_name

      puts "INFO: Making design <$design_name> as current_bd_design."
      current_bd_design $design_name

   } else {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 3
   }

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

  # Create instance: aq_axi_djpeg_0, and set properties
  set aq_axi_djpeg_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_djpeg:1.0 aq_axi_djpeg_0 ]

  # Create instance: aq_axi_fifo_0, and set properties
  set aq_axi_fifo_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_axi_fifo:1.0 aq_axi_fifo_0 ]

  # Create instance: aq_fifo6432_0, and set properties
  set aq_fifo6432_0 [ create_bd_cell -type ip -vlnv aquaxis:user:aq_fifo6432:1.0 aq_fifo6432_0 ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list CONFIG.NUM_MI {1}  ] $axi_interconnect_1

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.4 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_IMPORT_BOARD_PRESET {/home/hidemi/DJPEG_IP/ZYBO_zynq_def.xml} CONFIG.PCW_USE_S_AXI_ACP {1}  ] $processing_system7_0

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]
  connect_bd_intf_net -intf_net aq_axi_fifo_0_M_AXI [get_bd_intf_pins aq_axi_fifo_0/M_AXI] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins aq_axi_fifo_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins aq_axi_djpeg_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_ACP]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]

  # Create port connections
  connect_bd_net -net aq_axi_djpeg_0_DATA_OUT [get_bd_pins aq_axi_djpeg_0/DATA_OUT] [get_bd_pins aq_fifo6432_0/RD_IN_DI]
  connect_bd_net -net aq_axi_djpeg_0_READ [get_bd_pins aq_axi_djpeg_0/READ] [get_bd_pins aq_fifo6432_0/WR_OUT_RE]
  connect_bd_net -net aq_axi_djpeg_0_WRITE [get_bd_pins aq_axi_djpeg_0/WRITE] [get_bd_pins aq_fifo6432_0/RD_IN_WE]
  connect_bd_net -net aq_axi_fifo_0_FIFO_DOUT [get_bd_pins aq_axi_fifo_0/FIFO_DOUT] [get_bd_pins aq_fifo6432_0/WR_IN_DATA]
  connect_bd_net -net aq_axi_fifo_0_FIFO_EMPTY [get_bd_pins aq_axi_fifo_0/FIFO_EMPTY] [get_bd_pins aq_fifo6432_0/WR_IN_EMPTY]
  connect_bd_net -net aq_axi_fifo_0_FIFO_FULL [get_bd_pins aq_axi_fifo_0/FIFO_FULL] [get_bd_pins aq_fifo6432_0/RD_OUT_FULL]
  connect_bd_net -net aq_axi_fifo_0_FIFO_RST [get_bd_pins aq_axi_fifo_0/FIFO_RST] [get_bd_pins aq_fifo6432_0/RST]
  connect_bd_net -net aq_fifo6432_0_RD_IN_FULL [get_bd_pins aq_axi_djpeg_0/FULL] [get_bd_pins aq_fifo6432_0/RD_IN_FULL]
  connect_bd_net -net aq_fifo6432_0_RD_OUT_DATA [get_bd_pins aq_axi_fifo_0/FIFO_DIN] [get_bd_pins aq_fifo6432_0/RD_OUT_DATA]
  connect_bd_net -net aq_fifo6432_0_RD_OUT_WE [get_bd_pins aq_axi_fifo_0/FIFO_WR_EN] [get_bd_pins aq_fifo6432_0/RD_OUT_WE]
  connect_bd_net -net aq_fifo6432_0_WR_IN_RE [get_bd_pins aq_axi_fifo_0/FIFO_RD_EN] [get_bd_pins aq_fifo6432_0/WR_IN_RE]
  connect_bd_net -net aq_fifo6432_0_WR_OUT_DO [get_bd_pins aq_axi_djpeg_0/DATA_IN] [get_bd_pins aq_fifo6432_0/WR_OUT_DO]
  connect_bd_net -net aq_fifo6432_0_WR_OUT_EMPTY [get_bd_pins aq_axi_djpeg_0/EMPTY] [get_bd_pins aq_fifo6432_0/WR_OUT_EMPTY]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins aq_axi_djpeg_0/RST_N] [get_bd_pins aq_axi_fifo_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins aq_axi_djpeg_0/CLK] [get_bd_pins aq_axi_djpeg_0/S_AXI_ACLK] [get_bd_pins aq_axi_fifo_0/FIFO_RD_CLK] [get_bd_pins aq_axi_fifo_0/FIFO_WR_CLK] [get_bd_pins aq_axi_fifo_0/M_AXI_ACLK] [get_bd_pins aq_axi_fifo_0/S_AXI_ACLK] [get_bd_pins aq_fifo6432_0/RD_CLK] [get_bd_pins aq_fifo6432_0/WR_CLK] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_ACP_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces aq_axi_fifo_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x400000 -offset 0xE0000000 [get_bd_addr_spaces aq_axi_fifo_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_IOP] SEG_processing_system7_0_ACP_IOP
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces aq_axi_fifo_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_M_AXI_GP0] SEG_processing_system7_0_ACP_M_AXI_GP0
  create_bd_addr_seg -range 0x1000000 -offset 0xFC000000 [get_bd_addr_spaces aq_axi_fifo_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_QSPI_LINEAR] SEG_processing_system7_0_ACP_QSPI_LINEAR
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs aq_axi_djpeg_0/S_AXI/reg0] SEG_aq_axi_djpeg_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x40010000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs aq_axi_fifo_0/S_AXI/reg0] SEG_aq_axi_fifo_0_reg0
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


