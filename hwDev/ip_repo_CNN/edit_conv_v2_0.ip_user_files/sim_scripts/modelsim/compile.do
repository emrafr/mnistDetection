vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93  \
"../../../conv_2_0/src/conv.vhd" \
"../../../conv_2_0/hdl/conv_v2_0_M00_AXIS.vhd" \
"../../../conv_2_0/hdl/conv_v2_0_S00_AXIS.vhd" \
"../../../conv_2_0/src/kernel_multiplier.vhd" \
"../../../conv_2_0/hdl/conv_v2_0.vhd" \


