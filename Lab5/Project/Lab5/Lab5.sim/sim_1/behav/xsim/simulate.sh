#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Nov 19 21:47:45 EST 2024
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
echo "xsim Datapath_testbench_behav -key {Behavioral:sim_1:Functional:Datapath_testbench} -tclbatch Datapath_testbench.tcl -view /ad/eng/users/c/h/chenhr/Desktop/Lab5/Project/Lab5/Datapath_testbench_behav.wcfg -log simulate.log"
xsim Datapath_testbench_behav -key {Behavioral:sim_1:Functional:Datapath_testbench} -tclbatch Datapath_testbench.tcl -view /ad/eng/users/c/h/chenhr/Desktop/Lab5/Project/Lab5/Datapath_testbench_behav.wcfg -log simulate.log

