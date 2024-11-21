//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Tue May 14 14:39:06 2024
//Host        : scomputer-00 running 64-bit Debian GNU/Linux 11 (bullseye)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET reset, CLK_DOMAIN design_1_clk, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M00_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M00_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M01_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M01_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m01_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M02_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M02_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m02_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M03_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M03_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m03_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M04_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M04_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m04_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M05_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M05_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m05_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M06_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M06_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m06_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M07_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M07_AXIS_TDATA, LAYERED_METADATA undef" *) output [31:0]m07_axis_tdata;
  input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S00_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S00_AXIS_TDATA, LAYERED_METADATA undef" *) input [31:0]s00_axis_tdata;
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

  wire clk_1;
  wire [31:0]full_conv_0_m00_axis_tdata;
  wire full_conv_0_m00_axis_tvalid;
  wire [31:0]full_conv_0_m01_axis_tdata;
  wire full_conv_0_m01_axis_tvalid;
  wire [31:0]full_conv_0_m02_axis_tdata;
  wire full_conv_0_m02_axis_tvalid;
  wire [31:0]full_conv_0_m03_axis_tdata;
  wire full_conv_0_m03_axis_tvalid;
  wire [31:0]full_conv_0_m04_axis_tdata;
  wire full_conv_0_m04_axis_tvalid;
  wire [31:0]full_conv_0_m05_axis_tdata;
  wire full_conv_0_m05_axis_tvalid;
  wire [31:0]full_conv_0_m06_axis_tdata;
  wire full_conv_0_m06_axis_tvalid;
  wire [31:0]full_conv_0_m07_axis_tdata;
  wire full_conv_0_m07_axis_tvalid;
  wire full_conv_0_s00_axis_tready;
  wire m_axis_tready_1;
  wire reset_1;
  wire [31:0]s00_axis_tdata_1;
  wire s00_axis_tvalid_1;

  assign clk_1 = clk;
  assign m00_axis_tdata[31:0] = full_conv_0_m00_axis_tdata;
  assign m01_axis_tdata[31:0] = full_conv_0_m01_axis_tdata;
  assign m02_axis_tdata[31:0] = full_conv_0_m02_axis_tdata;
  assign m03_axis_tdata[31:0] = full_conv_0_m03_axis_tdata;
  assign m04_axis_tdata[31:0] = full_conv_0_m04_axis_tdata;
  assign m05_axis_tdata[31:0] = full_conv_0_m05_axis_tdata;
  assign m06_axis_tdata[31:0] = full_conv_0_m06_axis_tdata;
  assign m07_axis_tdata[31:0] = full_conv_0_m07_axis_tdata;
  assign m_axis_tready_1 = m_axis_tready;
  assign reset_1 = reset;
  assign s00_axis_tdata_1 = s00_axis_tdata[31:0];
  assign s00_axis_tready = full_conv_0_s00_axis_tready;
  assign s00_axis_tvalid_1 = s00_axis_tvalid;
  assign tvalid_m = full_conv_0_m00_axis_tvalid;
  assign tvalid_m1 = full_conv_0_m01_axis_tvalid;
  assign tvalid_m2 = full_conv_0_m02_axis_tvalid;
  assign tvalid_m3 = full_conv_0_m03_axis_tvalid;
  assign tvalid_m4 = full_conv_0_m04_axis_tvalid;
  assign tvalid_m5 = full_conv_0_m05_axis_tvalid;
  assign tvalid_m6 = full_conv_0_m06_axis_tvalid;
  assign tvalid_m7 = full_conv_0_m07_axis_tvalid;
  design_1_full_conv_0_0 full_conv_0
       (.m00_axis_aclk(clk_1),
        .m00_axis_aresetn(reset_1),
        .m00_axis_tdata(full_conv_0_m00_axis_tdata),
        .m00_axis_tready(m_axis_tready_1),
        .m00_axis_tvalid(full_conv_0_m00_axis_tvalid),
        .m01_axis_aclk(clk_1),
        .m01_axis_aresetn(reset_1),
        .m01_axis_tdata(full_conv_0_m01_axis_tdata),
        .m01_axis_tready(m_axis_tready_1),
        .m01_axis_tvalid(full_conv_0_m01_axis_tvalid),
        .m02_axis_aclk(clk_1),
        .m02_axis_aresetn(reset_1),
        .m02_axis_tdata(full_conv_0_m02_axis_tdata),
        .m02_axis_tready(m_axis_tready_1),
        .m02_axis_tvalid(full_conv_0_m02_axis_tvalid),
        .m03_axis_aclk(clk_1),
        .m03_axis_aresetn(reset_1),
        .m03_axis_tdata(full_conv_0_m03_axis_tdata),
        .m03_axis_tready(m_axis_tready_1),
        .m03_axis_tvalid(full_conv_0_m03_axis_tvalid),
        .m04_axis_aclk(clk_1),
        .m04_axis_aresetn(reset_1),
        .m04_axis_tdata(full_conv_0_m04_axis_tdata),
        .m04_axis_tready(m_axis_tready_1),
        .m04_axis_tvalid(full_conv_0_m04_axis_tvalid),
        .m05_axis_aclk(clk_1),
        .m05_axis_aresetn(reset_1),
        .m05_axis_tdata(full_conv_0_m05_axis_tdata),
        .m05_axis_tready(m_axis_tready_1),
        .m05_axis_tvalid(full_conv_0_m05_axis_tvalid),
        .m06_axis_aclk(clk_1),
        .m06_axis_aresetn(reset_1),
        .m06_axis_tdata(full_conv_0_m06_axis_tdata),
        .m06_axis_tready(m_axis_tready_1),
        .m06_axis_tvalid(full_conv_0_m06_axis_tvalid),
        .m07_axis_aclk(clk_1),
        .m07_axis_aresetn(reset_1),
        .m07_axis_tdata(full_conv_0_m07_axis_tdata),
        .m07_axis_tready(m_axis_tready_1),
        .m07_axis_tvalid(full_conv_0_m07_axis_tvalid),
        .s00_axis_aclk(clk_1),
        .s00_axis_aresetn(reset_1),
        .s00_axis_tdata(s00_axis_tdata_1),
        .s00_axis_tlast(1'b0),
        .s00_axis_tready(full_conv_0_s00_axis_tready),
        .s00_axis_tstrb({1'b1,1'b1,1'b1,1'b1}),
        .s00_axis_tvalid(s00_axis_tvalid_1));
endmodule
