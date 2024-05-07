transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -  \
"../../../conv_2_0/src/conv.vhd" \
"../../../conv_2_0/hdl/conv_v2_0_M00_AXIS.vhd" \
"../../../conv_2_0/hdl/conv_v2_0_S00_AXIS.vhd" \
"../../../conv_2_0/src/kernel_multiplier.vhd" \
"../../../conv_2_0/hdl/conv_v2_0.vhd" \


