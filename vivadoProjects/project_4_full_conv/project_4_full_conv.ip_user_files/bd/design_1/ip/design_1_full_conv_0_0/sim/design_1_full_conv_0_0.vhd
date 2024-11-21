-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.org:user:full_conv:2.0
-- IP Revision: 33

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_full_conv_0_0 IS
  PORT (
    s00_axis_aclk : IN STD_LOGIC;
    s00_axis_aresetn : IN STD_LOGIC;
    s00_axis_tready : OUT STD_LOGIC;
    s00_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axis_tstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axis_tlast : IN STD_LOGIC;
    s00_axis_tvalid : IN STD_LOGIC;
    m00_axis_aclk : IN STD_LOGIC;
    m00_axis_aresetn : IN STD_LOGIC;
    m00_axis_tvalid : OUT STD_LOGIC;
    m00_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m00_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m00_axis_tlast : OUT STD_LOGIC;
    m00_axis_tready : IN STD_LOGIC;
    m01_axis_aclk : IN STD_LOGIC;
    m01_axis_aresetn : IN STD_LOGIC;
    m01_axis_tvalid : OUT STD_LOGIC;
    m01_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m01_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m01_axis_tlast : OUT STD_LOGIC;
    m01_axis_tready : IN STD_LOGIC;
    m02_axis_aclk : IN STD_LOGIC;
    m02_axis_aresetn : IN STD_LOGIC;
    m02_axis_tvalid : OUT STD_LOGIC;
    m02_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m02_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m02_axis_tlast : OUT STD_LOGIC;
    m02_axis_tready : IN STD_LOGIC;
    m03_axis_aclk : IN STD_LOGIC;
    m03_axis_aresetn : IN STD_LOGIC;
    m03_axis_tvalid : OUT STD_LOGIC;
    m03_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m03_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m03_axis_tlast : OUT STD_LOGIC;
    m03_axis_tready : IN STD_LOGIC;
    m04_axis_aclk : IN STD_LOGIC;
    m04_axis_aresetn : IN STD_LOGIC;
    m04_axis_tvalid : OUT STD_LOGIC;
    m04_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m04_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m04_axis_tlast : OUT STD_LOGIC;
    m04_axis_tready : IN STD_LOGIC;
    m05_axis_aclk : IN STD_LOGIC;
    m05_axis_aresetn : IN STD_LOGIC;
    m05_axis_tvalid : OUT STD_LOGIC;
    m05_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m05_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m05_axis_tlast : OUT STD_LOGIC;
    m05_axis_tready : IN STD_LOGIC;
    m06_axis_aclk : IN STD_LOGIC;
    m06_axis_aresetn : IN STD_LOGIC;
    m06_axis_tvalid : OUT STD_LOGIC;
    m06_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m06_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m06_axis_tlast : OUT STD_LOGIC;
    m06_axis_tready : IN STD_LOGIC;
    m07_axis_aclk : IN STD_LOGIC;
    m07_axis_aresetn : IN STD_LOGIC;
    m07_axis_tvalid : OUT STD_LOGIC;
    m07_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m07_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m07_axis_tlast : OUT STD_LOGIC;
    m07_axis_tready : IN STD_LOGIC
  );
END design_1_full_conv_0_0;

ARCHITECTURE design_1_full_conv_0_0_arch OF design_1_full_conv_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_full_conv_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT full_conv_v2_0 IS
    GENERIC (
      C_M01_AXIS_TDATA_WIDTH : INTEGER;
      C_M01_AXIS_START_COUNT : INTEGER;
      C_M02_AXIS_TDATA_WIDTH : INTEGER;
      C_M02_AXIS_START_COUNT : INTEGER;
      C_M03_AXIS_TDATA_WIDTH : INTEGER;
      C_M03_AXIS_START_COUNT : INTEGER;
      C_M04_AXIS_TDATA_WIDTH : INTEGER;
      C_M04_AXIS_START_COUNT : INTEGER;
      C_M05_AXIS_TDATA_WIDTH : INTEGER;
      C_M05_AXIS_START_COUNT : INTEGER;
      C_M06_AXIS_TDATA_WIDTH : INTEGER;
      C_M06_AXIS_START_COUNT : INTEGER;
      C_M07_AXIS_TDATA_WIDTH : INTEGER;
      C_M07_AXIS_START_COUNT : INTEGER;
      C_S00_AXIS_TDATA_WIDTH : INTEGER;
      C_M00_AXIS_TDATA_WIDTH : INTEGER;
      C_M00_AXIS_START_COUNT : INTEGER
    );
    PORT (
      s00_axis_aclk : IN STD_LOGIC;
      s00_axis_aresetn : IN STD_LOGIC;
      s00_axis_tready : OUT STD_LOGIC;
      s00_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axis_tstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axis_tlast : IN STD_LOGIC;
      s00_axis_tvalid : IN STD_LOGIC;
      m00_axis_aclk : IN STD_LOGIC;
      m00_axis_aresetn : IN STD_LOGIC;
      m00_axis_tvalid : OUT STD_LOGIC;
      m00_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m00_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m00_axis_tlast : OUT STD_LOGIC;
      m00_axis_tready : IN STD_LOGIC;
      m01_axis_aclk : IN STD_LOGIC;
      m01_axis_aresetn : IN STD_LOGIC;
      m01_axis_tvalid : OUT STD_LOGIC;
      m01_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m01_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m01_axis_tlast : OUT STD_LOGIC;
      m01_axis_tready : IN STD_LOGIC;
      m02_axis_aclk : IN STD_LOGIC;
      m02_axis_aresetn : IN STD_LOGIC;
      m02_axis_tvalid : OUT STD_LOGIC;
      m02_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m02_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m02_axis_tlast : OUT STD_LOGIC;
      m02_axis_tready : IN STD_LOGIC;
      m03_axis_aclk : IN STD_LOGIC;
      m03_axis_aresetn : IN STD_LOGIC;
      m03_axis_tvalid : OUT STD_LOGIC;
      m03_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m03_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m03_axis_tlast : OUT STD_LOGIC;
      m03_axis_tready : IN STD_LOGIC;
      m04_axis_aclk : IN STD_LOGIC;
      m04_axis_aresetn : IN STD_LOGIC;
      m04_axis_tvalid : OUT STD_LOGIC;
      m04_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m04_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m04_axis_tlast : OUT STD_LOGIC;
      m04_axis_tready : IN STD_LOGIC;
      m05_axis_aclk : IN STD_LOGIC;
      m05_axis_aresetn : IN STD_LOGIC;
      m05_axis_tvalid : OUT STD_LOGIC;
      m05_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m05_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m05_axis_tlast : OUT STD_LOGIC;
      m05_axis_tready : IN STD_LOGIC;
      m06_axis_aclk : IN STD_LOGIC;
      m06_axis_aresetn : IN STD_LOGIC;
      m06_axis_tvalid : OUT STD_LOGIC;
      m06_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m06_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m06_axis_tlast : OUT STD_LOGIC;
      m06_axis_tready : IN STD_LOGIC;
      m07_axis_aclk : IN STD_LOGIC;
      m07_axis_aresetn : IN STD_LOGIC;
      m07_axis_tvalid : OUT STD_LOGIC;
      m07_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m07_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m07_axis_tlast : OUT STD_LOGIC;
      m07_axis_tready : IN STD_LOGIC
    );
  END COMPONENT full_conv_v2_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF m00_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m00_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m00_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m00_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m01_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M01_AXIS_CLK, ASSOCIATED_BUSIF M01_AXIS, ASSOCIATED_RESET m01_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M01_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m01_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M01_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M01_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M01_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M01_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M01_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M01_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m01_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M01_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m01_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M01_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m02_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M02_AXIS_CLK, ASSOCIATED_BUSIF M02_AXIS, ASSOCIATED_RESET m02_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M02_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m02_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M02_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M02_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M02_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M02_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M02_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M02_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m02_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M02_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m02_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M02_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m03_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M03_AXIS_CLK, ASSOCIATED_BUSIF M03_AXIS, ASSOCIATED_RESET m03_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M03_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m03_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M03_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M03_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M03_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M03_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M03_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M03_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m03_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M03_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m03_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M03_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m04_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M04_AXIS_CLK, ASSOCIATED_BUSIF M04_AXIS, ASSOCIATED_RESET m04_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M04_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m04_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M04_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M04_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M04_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M04_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M04_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M04_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m04_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M04_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m04_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M04_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m05_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M05_AXIS_CLK, ASSOCIATED_BUSIF M05_AXIS, ASSOCIATED_RESET m05_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M05_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m05_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M05_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M05_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M05_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M05_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M05_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M05_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m05_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M05_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m05_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M05_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m06_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M06_AXIS_CLK, ASSOCIATED_BUSIF M06_AXIS, ASSOCIATED_RESET m06_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M06_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m06_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M06_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M06_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M06_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M06_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M06_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M06_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m06_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M06_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m06_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M06_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m07_axis_aclk: SIGNAL IS "XIL_INTERFACENAME M07_AXIS_CLK, ASSOCIATED_BUSIF M07_AXIS, ASSOCIATED_RESET m07_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M07_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m07_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME M07_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M07_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M07_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M07_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M07_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M07_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m07_axis_tvalid: SIGNAL IS "XIL_INTERFACENAME M07_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m07_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M07_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axis_aclk: SIGNAL IS "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axis_aresetn: SIGNAL IS "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axis_tready: SIGNAL IS "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
BEGIN
  U0 : full_conv_v2_0
    GENERIC MAP (
      C_M01_AXIS_TDATA_WIDTH => 32,
      C_M01_AXIS_START_COUNT => 32,
      C_M02_AXIS_TDATA_WIDTH => 32,
      C_M02_AXIS_START_COUNT => 32,
      C_M03_AXIS_TDATA_WIDTH => 32,
      C_M03_AXIS_START_COUNT => 32,
      C_M04_AXIS_TDATA_WIDTH => 32,
      C_M04_AXIS_START_COUNT => 32,
      C_M05_AXIS_TDATA_WIDTH => 32,
      C_M05_AXIS_START_COUNT => 32,
      C_M06_AXIS_TDATA_WIDTH => 32,
      C_M06_AXIS_START_COUNT => 32,
      C_M07_AXIS_TDATA_WIDTH => 32,
      C_M07_AXIS_START_COUNT => 32,
      C_S00_AXIS_TDATA_WIDTH => 32,
      C_M00_AXIS_TDATA_WIDTH => 32,
      C_M00_AXIS_START_COUNT => 32
    )
    PORT MAP (
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tready => s00_axis_tready,
      s00_axis_tdata => s00_axis_tdata,
      s00_axis_tstrb => s00_axis_tstrb,
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tvalid => s00_axis_tvalid,
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tvalid => m00_axis_tvalid,
      m00_axis_tdata => m00_axis_tdata,
      m00_axis_tstrb => m00_axis_tstrb,
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m01_axis_aclk => m01_axis_aclk,
      m01_axis_aresetn => m01_axis_aresetn,
      m01_axis_tvalid => m01_axis_tvalid,
      m01_axis_tdata => m01_axis_tdata,
      m01_axis_tstrb => m01_axis_tstrb,
      m01_axis_tlast => m01_axis_tlast,
      m01_axis_tready => m01_axis_tready,
      m02_axis_aclk => m02_axis_aclk,
      m02_axis_aresetn => m02_axis_aresetn,
      m02_axis_tvalid => m02_axis_tvalid,
      m02_axis_tdata => m02_axis_tdata,
      m02_axis_tstrb => m02_axis_tstrb,
      m02_axis_tlast => m02_axis_tlast,
      m02_axis_tready => m02_axis_tready,
      m03_axis_aclk => m03_axis_aclk,
      m03_axis_aresetn => m03_axis_aresetn,
      m03_axis_tvalid => m03_axis_tvalid,
      m03_axis_tdata => m03_axis_tdata,
      m03_axis_tstrb => m03_axis_tstrb,
      m03_axis_tlast => m03_axis_tlast,
      m03_axis_tready => m03_axis_tready,
      m04_axis_aclk => m04_axis_aclk,
      m04_axis_aresetn => m04_axis_aresetn,
      m04_axis_tvalid => m04_axis_tvalid,
      m04_axis_tdata => m04_axis_tdata,
      m04_axis_tstrb => m04_axis_tstrb,
      m04_axis_tlast => m04_axis_tlast,
      m04_axis_tready => m04_axis_tready,
      m05_axis_aclk => m05_axis_aclk,
      m05_axis_aresetn => m05_axis_aresetn,
      m05_axis_tvalid => m05_axis_tvalid,
      m05_axis_tdata => m05_axis_tdata,
      m05_axis_tstrb => m05_axis_tstrb,
      m05_axis_tlast => m05_axis_tlast,
      m05_axis_tready => m05_axis_tready,
      m06_axis_aclk => m06_axis_aclk,
      m06_axis_aresetn => m06_axis_aresetn,
      m06_axis_tvalid => m06_axis_tvalid,
      m06_axis_tdata => m06_axis_tdata,
      m06_axis_tstrb => m06_axis_tstrb,
      m06_axis_tlast => m06_axis_tlast,
      m06_axis_tready => m06_axis_tready,
      m07_axis_aclk => m07_axis_aclk,
      m07_axis_aresetn => m07_axis_aresetn,
      m07_axis_tvalid => m07_axis_tvalid,
      m07_axis_tdata => m07_axis_tdata,
      m07_axis_tstrb => m07_axis_tstrb,
      m07_axis_tlast => m07_axis_tlast,
      m07_axis_tready => m07_axis_tready
    );
END design_1_full_conv_0_0_arch;
