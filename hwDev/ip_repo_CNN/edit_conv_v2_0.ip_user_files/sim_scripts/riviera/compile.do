transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../conv_2_0/src/conv.vhd" \
"../../../conv_2_0/hdl/conv_v2_0_M00_AXIS.vhd" \
"../../../conv_2_0/hdl/conv_v2_0_S00_AXIS.vhd" \
"../../../conv_2_0/src/kernel_multiplier.vhd" \
"../../../conv_2_0/hdl/conv_v2_0.vhd" \


