#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Thu Nov 21 09:07:25 CET 2024
# SW Build 5076996 on Wed May 22 18:36:09 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_full_conv_axi_behav -key {Behavioral:sim_1:Functional:tb_full_conv_axi} -tclbatch tb_full_conv_axi.tcl -protoinst "protoinst_files/design_1.protoinst" -view /home/emma/dev/vivadoProjects/project_4_full_conv/tb_full_conv_axi_behav.wcfg -log simulate.log"
xsim tb_full_conv_axi_behav -key {Behavioral:sim_1:Functional:tb_full_conv_axi} -tclbatch tb_full_conv_axi.tcl -protoinst "protoinst_files/design_1.protoinst" -view /home/emma/dev/vivadoProjects/project_4_full_conv/tb_full_conv_axi_behav.wcfg -log simulate.log

