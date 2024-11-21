vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_S00_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M00_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M01_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M02_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M03_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M04_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M05_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M06_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0_M07_AXIS.vhd" \
"../../../bd/design_1/ipshared/967f/src/conv.vhd" \
"../../../bd/design_1/ipshared/967f/src/kernel_multiplier.vhd" \
"../../../bd/design_1/ipshared/967f/hdl/full_conv_v2_0.vhd" \
"../../../bd/design_1/ip/design_1_full_conv_0_0/sim/design_1_full_conv_0_0.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \


