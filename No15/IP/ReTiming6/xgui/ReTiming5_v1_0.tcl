# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "RETIMING_H" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RETIMING_V" -parent ${Page_0}


}

proc update_PARAM_VALUE.RETIMING_H { PARAM_VALUE.RETIMING_H } {
	# Procedure called to update RETIMING_H when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RETIMING_H { PARAM_VALUE.RETIMING_H } {
	# Procedure called to validate RETIMING_H
	return true
}

proc update_PARAM_VALUE.RETIMING_V { PARAM_VALUE.RETIMING_V } {
	# Procedure called to update RETIMING_V when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RETIMING_V { PARAM_VALUE.RETIMING_V } {
	# Procedure called to validate RETIMING_V
	return true
}


proc update_MODELPARAM_VALUE.RETIMING_H { MODELPARAM_VALUE.RETIMING_H PARAM_VALUE.RETIMING_H } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RETIMING_H}] ${MODELPARAM_VALUE.RETIMING_H}
}

proc update_MODELPARAM_VALUE.RETIMING_V { MODELPARAM_VALUE.RETIMING_V PARAM_VALUE.RETIMING_V } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RETIMING_V}] ${MODELPARAM_VALUE.RETIMING_V}
}

