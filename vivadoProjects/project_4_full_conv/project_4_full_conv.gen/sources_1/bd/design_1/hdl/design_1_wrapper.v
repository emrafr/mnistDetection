//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Tue May 14 14:39:07 2024
//Host        : scomputer-00 running 64-bit Debian GNU/Linux 11 (bullseye)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    m00_axis_tdata,
    m01_axis_tdata,
    m02_axis_tdata,
    m03_axis_tdata,
    m04_axis_tdata,
    m05_axis_tdata,
    m06_axis_tdata,
    m07_axis_tdata,
    m_axis_tready,
    reset,
    s00_axis_tdata,
    s00_axis_tready,
    s00_axis_tvalid,
    tvalid_m,
    tvalid_m1,
    tvalid_m2,
    tvalid_m3,
    tvalid_m4,
    tvalid_m5,
    tvalid_m6,
    tvalid_m7);
  input clk;
  output [31:0]m00_axis_tdata;
  output [31:0]m01_axis_tdata;
  output [31:0]m02_axis_tdata;
  output [31:0]m03_axis_tdata;
  output [31:0]m04_axis_tdata;
  output [31:0]m05_axis_tdata;
  output [31:0]m06_axis_tdata;
  output [31:0]m07_axis_tdata;
  input m_axis_tready;
  input reset;
  input [31:0]s00_axis_tdata;
  output s00_axis_tready;
  input s00_axis_tvalid;
  output tvalid_m;
  output tvalid_m1;
  output tvalid_m2;
  output tvalid_m3;
  output tvalid_m4;
  output tvalid_m5;
  output tvalid_m6;
  output tvalid_m7;

  wire clk;
  wire [31:0]m00_axis_tdata;
  wire [31:0]m01_axis_tdata;
  wire [31:0]m02_axis_tdata;
  wire [31:0]m03_axis_tdata;
  wire [31:0]m04_axis_tdata;
  wire [31:0]m05_axis_tdata;
  wire [31:0]m06_axis_tdata;
  wire [31:0]m07_axis_tdata;
  wire m_axis_tready;
  wire reset;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire tvalid_m;
  wire tvalid_m1;
  wire tvalid_m2;
  wire tvalid_m3;
  wire tvalid_m4;
  wire tvalid_m5;
  wire tvalid_m6;
  wire tvalid_m7;

  design_1 design_1_i
       (.clk(clk),
        .m00_axis_tdata(m00_axis_tdata),
        .m01_axis_tdata(m01_axis_tdata),
        .m02_axis_tdata(m02_axis_tdata),
        .m03_axis_tdata(m03_axis_tdata),
        .m04_axis_tdata(m04_axis_tdata),
        .m05_axis_tdata(m05_axis_tdata),
        .m06_axis_tdata(m06_axis_tdata),
        .m07_axis_tdata(m07_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .reset(reset),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .tvalid_m(tvalid_m),
        .tvalid_m1(tvalid_m1),
        .tvalid_m2(tvalid_m2),
        .tvalid_m3(tvalid_m3),
        .tvalid_m4(tvalid_m4),
        .tvalid_m5(tvalid_m5),
        .tvalid_m6(tvalid_m6),
        .tvalid_m7(tvalid_m7));
endmodule
