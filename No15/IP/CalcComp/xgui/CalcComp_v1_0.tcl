# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ap_const_lv23_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_const_lv32_17" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_const_lv32_1E" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_const_lv32_3E19999A" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_const_lv5_3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_const_lv8_FF" -parent ${Page_0}


}

proc update_PARAM_VALUE.ap_const_lv23_0 { PARAM_VALUE.ap_const_lv23_0 } {
	# Procedure called to update ap_const_lv23_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv23_0 { PARAM_VALUE.ap_const_lv23_0 } {
	# Procedure called to validate ap_const_lv23_0
	return true
}

proc update_PARAM_VALUE.ap_const_lv32_17 { PARAM_VALUE.ap_const_lv32_17 } {
	# Procedure called to update ap_const_lv32_17 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv32_17 { PARAM_VALUE.ap_const_lv32_17 } {
	# Procedure called to validate ap_const_lv32_17
	return true
}

proc update_PARAM_VALUE.ap_const_lv32_1E { PARAM_VALUE.ap_const_lv32_1E } {
	# Procedure called to update ap_const_lv32_1E when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv32_1E { PARAM_VALUE.ap_const_lv32_1E } {
	# Procedure called to validate ap_const_lv32_1E
	return true
}

proc update_PARAM_VALUE.ap_const_lv32_3E19999A { PARAM_VALUE.ap_const_lv32_3E19999A } {
	# Procedure called to update ap_const_lv32_3E19999A when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv32_3E19999A { PARAM_VALUE.ap_const_lv32_3E19999A } {
	# Procedure called to validate ap_const_lv32_3E19999A
	return true
}

proc update_PARAM_VALUE.ap_const_lv5_3 { PARAM_VALUE.ap_const_lv5_3 } {
	# Procedure called to update ap_const_lv5_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv5_3 { PARAM_VALUE.ap_const_lv5_3 } {
	# Procedure called to validate ap_const_lv5_3
	return true
}

proc update_PARAM_VALUE.ap_const_lv8_FF { PARAM_VALUE.ap_const_lv8_FF } {
	# Procedure called to update ap_const_lv8_FF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv8_FF { PARAM_VALUE.ap_const_lv8_FF } {
	# Procedure called to validate ap_const_lv8_FF
	return true
}


proc update_MODELPARAM_VALUE.ap_const_lv32_3E19999A { MODELPARAM_VALUE.ap_const_lv32_3E19999A PARAM_VALUE.ap_const_lv32_3E19999A } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv32_3E19999A}] ${MODELPARAM_VALUE.ap_const_lv32_3E19999A}
}

proc update_MODELPARAM_VALUE.ap_const_lv32_17 { MODELPARAM_VALUE.ap_const_lv32_17 PARAM_VALUE.ap_const_lv32_17 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv32_17}] ${MODELPARAM_VALUE.ap_const_lv32_17}
}

proc update_MODELPARAM_VALUE.ap_const_lv32_1E { MODELPARAM_VALUE.ap_const_lv32_1E PARAM_VALUE.ap_const_lv32_1E } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv32_1E}] ${MODELPARAM_VALUE.ap_const_lv32_1E}
}

proc update_MODELPARAM_VALUE.ap_const_lv8_FF { MODELPARAM_VALUE.ap_const_lv8_FF PARAM_VALUE.ap_const_lv8_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv8_FF}] ${MODELPARAM_VALUE.ap_const_lv8_FF}
}

proc update_MODELPARAM_VALUE.ap_const_lv23_0 { MODELPARAM_VALUE.ap_const_lv23_0 PARAM_VALUE.ap_const_lv23_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv23_0}] ${MODELPARAM_VALUE.ap_const_lv23_0}
}

proc update_MODELPARAM_VALUE.ap_const_lv5_3 { MODELPARAM_VALUE.ap_const_lv5_3 PARAM_VALUE.ap_const_lv5_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv5_3}] ${MODELPARAM_VALUE.ap_const_lv5_3}
}

