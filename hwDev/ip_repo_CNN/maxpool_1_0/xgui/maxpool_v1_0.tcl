# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S01_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M02_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M02_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M01_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M01_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M00_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M00_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S07_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S06_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S05_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S04_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S03_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S02_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S00_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M07_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M07_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M06_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M06_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M05_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M05_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M04_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M04_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M03_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M03_AXIS_START_COUNT" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_S01_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S01_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S01_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S01_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S01_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S01_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M02_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M02_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M02_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M02_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M02_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M02_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M02_AXIS_START_COUNT { PARAM_VALUE.C_M02_AXIS_START_COUNT } {
	# Procedure called to update C_M02_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M02_AXIS_START_COUNT { PARAM_VALUE.C_M02_AXIS_START_COUNT } {
	# Procedure called to validate C_M02_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M01_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M01_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M01_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M01_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M01_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M01_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M01_AXIS_START_COUNT { PARAM_VALUE.C_M01_AXIS_START_COUNT } {
	# Procedure called to update C_M01_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M01_AXIS_START_COUNT { PARAM_VALUE.C_M01_AXIS_START_COUNT } {
	# Procedure called to validate C_M01_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXIS_START_COUNT { PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to update C_M00_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_START_COUNT { PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to validate C_M00_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_S07_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S07_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S07_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S07_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S07_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S07_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S06_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S06_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S06_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S06_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S06_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S06_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S05_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S05_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S05_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S05_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S05_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S05_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S04_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S04_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S04_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S04_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S04_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S04_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S03_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S03_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S03_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S03_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S03_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S03_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S02_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S02_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S02_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S02_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S02_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S02_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M07_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M07_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M07_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M07_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M07_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M07_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M07_AXIS_START_COUNT { PARAM_VALUE.C_M07_AXIS_START_COUNT } {
	# Procedure called to update C_M07_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M07_AXIS_START_COUNT { PARAM_VALUE.C_M07_AXIS_START_COUNT } {
	# Procedure called to validate C_M07_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M06_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M06_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M06_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M06_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M06_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M06_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M06_AXIS_START_COUNT { PARAM_VALUE.C_M06_AXIS_START_COUNT } {
	# Procedure called to update C_M06_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M06_AXIS_START_COUNT { PARAM_VALUE.C_M06_AXIS_START_COUNT } {
	# Procedure called to validate C_M06_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M05_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M05_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M05_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M05_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M05_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M05_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M05_AXIS_START_COUNT { PARAM_VALUE.C_M05_AXIS_START_COUNT } {
	# Procedure called to update C_M05_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M05_AXIS_START_COUNT { PARAM_VALUE.C_M05_AXIS_START_COUNT } {
	# Procedure called to validate C_M05_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M04_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M04_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M04_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M04_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M04_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M04_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M04_AXIS_START_COUNT { PARAM_VALUE.C_M04_AXIS_START_COUNT } {
	# Procedure called to update C_M04_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M04_AXIS_START_COUNT { PARAM_VALUE.C_M04_AXIS_START_COUNT } {
	# Procedure called to validate C_M04_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M03_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M03_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M03_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M03_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M03_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M03_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M03_AXIS_START_COUNT { PARAM_VALUE.C_M03_AXIS_START_COUNT } {
	# Procedure called to update C_M03_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M03_AXIS_START_COUNT { PARAM_VALUE.C_M03_AXIS_START_COUNT } {
	# Procedure called to validate C_M03_AXIS_START_COUNT
	return true
}


proc update_MODELPARAM_VALUE.C_S01_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S01_AXIS_TDATA_WIDTH PARAM_VALUE.C_S01_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S01_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S01_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M02_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M02_AXIS_TDATA_WIDTH PARAM_VALUE.C_M02_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M02_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M02_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M02_AXIS_START_COUNT { MODELPARAM_VALUE.C_M02_AXIS_START_COUNT PARAM_VALUE.C_M02_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M02_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M02_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_M01_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M01_AXIS_TDATA_WIDTH PARAM_VALUE.C_M01_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M01_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M01_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M01_AXIS_START_COUNT { MODELPARAM_VALUE.C_M01_AXIS_START_COUNT PARAM_VALUE.C_M01_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M01_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M01_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_START_COUNT { MODELPARAM_VALUE.C_M00_AXIS_START_COUNT PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M00_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_S07_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S07_AXIS_TDATA_WIDTH PARAM_VALUE.C_S07_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S07_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S07_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S06_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S06_AXIS_TDATA_WIDTH PARAM_VALUE.C_S06_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S06_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S06_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S05_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S05_AXIS_TDATA_WIDTH PARAM_VALUE.C_S05_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S05_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S05_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S04_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S04_AXIS_TDATA_WIDTH PARAM_VALUE.C_S04_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S04_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S04_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S03_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S03_AXIS_TDATA_WIDTH PARAM_VALUE.C_S03_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S03_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S03_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S02_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S02_AXIS_TDATA_WIDTH PARAM_VALUE.C_S02_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S02_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S02_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M07_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M07_AXIS_TDATA_WIDTH PARAM_VALUE.C_M07_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M07_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M07_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M07_AXIS_START_COUNT { MODELPARAM_VALUE.C_M07_AXIS_START_COUNT PARAM_VALUE.C_M07_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M07_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M07_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_M06_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M06_AXIS_TDATA_WIDTH PARAM_VALUE.C_M06_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M06_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M06_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M06_AXIS_START_COUNT { MODELPARAM_VALUE.C_M06_AXIS_START_COUNT PARAM_VALUE.C_M06_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M06_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M06_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_M05_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M05_AXIS_TDATA_WIDTH PARAM_VALUE.C_M05_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M05_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M05_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M05_AXIS_START_COUNT { MODELPARAM_VALUE.C_M05_AXIS_START_COUNT PARAM_VALUE.C_M05_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M05_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M05_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_M04_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M04_AXIS_TDATA_WIDTH PARAM_VALUE.C_M04_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M04_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M04_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M04_AXIS_START_COUNT { MODELPARAM_VALUE.C_M04_AXIS_START_COUNT PARAM_VALUE.C_M04_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M04_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M04_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_M03_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M03_AXIS_TDATA_WIDTH PARAM_VALUE.C_M03_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M03_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M03_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M03_AXIS_START_COUNT { MODELPARAM_VALUE.C_M03_AXIS_START_COUNT PARAM_VALUE.C_M03_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M03_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M03_AXIS_START_COUNT}
}

