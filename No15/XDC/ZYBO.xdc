




set_property PACKAGE_PIN U12 [get_ports cam_iic_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports cam_iic_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports cam_iic_sda_io]

#set_property IOSTANDARD LVCMOS33 [get_ports PIXCLK]
#set_property PACKAGE_PIN T10 [get_ports PIXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PIXCLK_IBUF]


#set_property PACKAGE_PIN T11 [get_ports CAM_HREF]
#set_property PACKAGE_PIN T12 [get_ports CAM_VSYNC]
set_property PACKAGE_PIN T10 [get_ports cam_iic_sda_io]
#set_property PACKAGE_PIN W19 [get_ports {CAM_DATA[7]}]
#set_property PACKAGE_PIN W20 [get_ports {CAM_DATA[6]}]
#set_property PACKAGE_PIN V20 [get_ports {CAM_DATA[4]}]
#set_property PACKAGE_PIN U20 [get_ports {CAM_DATA[2]}]
#set_property PACKAGE_PIN T20 [get_ports {CAM_DATA[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CAM_DATA[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports CAM_HREF]
#set_property IOSTANDARD LVCMOS33 [get_ports CAM_PCLK]
#set_property IOSTANDARD LVCMOS33 [get_ports CAM_VSYNC]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CAM_PCLK_IBUF]


set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks clk_fpga_1]
set_false_path -from [get_clocks clk_fpga_1] -to [get_clocks clk_fpga_0]


#set_property PACKAGE_PIN Y18 [get_ports {CAM_DATA[1]}]
#set_property PACKAGE_PIN Y19 [get_ports {CAM_DATA[3]}]
#set_property PACKAGE_PIN W18 [get_ports {CAM_DATA[5]}]

#set_property PACKAGE_PIN Y14 [get_ports CAM_PCLK]

#create_clock -period 40.000 -name CAM_PCLK -waveform {0.000 20.000} [get_ports CAM_PCLK]
