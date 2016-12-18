# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ap_const_lv32_F" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_const_lv8_0" -parent ${Page_0}


}

proc update_PARAM_VALUE.ap_const_lv32_F { PARAM_VALUE.ap_const_lv32_F } {
	# Procedure called to update ap_const_lv32_F when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv32_F { PARAM_VALUE.ap_const_lv32_F } {
	# Procedure called to validate ap_const_lv32_F
	return true
}

proc update_PARAM_VALUE.ap_const_lv8_0 { PARAM_VALUE.ap_const_lv8_0 } {
	# Procedure called to update ap_const_lv8_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_const_lv8_0 { PARAM_VALUE.ap_const_lv8_0 } {
	# Procedure called to validate ap_const_lv8_0
	return true
}


proc update_MODELPARAM_VALUE.ap_const_lv32_F { MODELPARAM_VALUE.ap_const_lv32_F PARAM_VALUE.ap_const_lv32_F } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv32_F}] ${MODELPARAM_VALUE.ap_const_lv32_F}
}

proc update_MODELPARAM_VALUE.ap_const_lv8_0 { MODELPARAM_VALUE.ap_const_lv8_0 PARAM_VALUE.ap_const_lv8_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_const_lv8_0}] ${MODELPARAM_VALUE.ap_const_lv8_0}
}

