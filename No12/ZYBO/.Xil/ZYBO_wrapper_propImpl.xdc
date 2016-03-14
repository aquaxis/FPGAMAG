set_property SRC_FILE_INFO {cfile:/home/hidemi/FM12/ZYBO/ZYBO.srcs/sources_1/bd/ZYBO/ip/ZYBO_processing_system7_0_1/ZYBO_processing_system7_0_1.xdc rfile:../ZYBO.srcs/sources_1/bd/ZYBO/ip/ZYBO_processing_system7_0_1/ZYBO_processing_system7_0_1.xdc id:1 order:EARLY scoped_inst:ZYBO_i/ARM/processing_system7_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/hidemi/FM12/ZYBO/ZYBO.srcs/sources_1/bd/ZYBO/ip/ZYBO_clk_wiz_0_0/ZYBO_clk_wiz_0_0.xdc rfile:../ZYBO.srcs/sources_1/bd/ZYBO/ip/ZYBO_clk_wiz_0_0/ZYBO_clk_wiz_0_0.xdc id:2 order:EARLY scoped_inst:ZYBO_i/VGA/clk_wiz_0/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_0 0.3
set_property src_info {type:SCOPED_XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
