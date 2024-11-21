--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Thu Nov 21 09:07:05 2024
--Host        : debian running 64-bit Debian GNU/Linux 12 (bookworm)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    clk : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m01_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m02_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m03_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m04_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m05_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m06_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m07_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tready : in STD_LOGIC;
    reset : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    tvalid_m : out STD_LOGIC;
    tvalid_m1 : out STD_LOGIC;
    tvalid_m2 : out STD_LOGIC;
    tvalid_m3 : out STD_LOGIC;
    tvalid_m4 : out STD_LOGIC;
    tvalid_m5 : out STD_LOGIC;
    tvalid_m6 : out STD_LOGIC;
    tvalid_m7 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_full_conv_0_0 is
  port (
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m01_axis_aclk : in STD_LOGIC;
    m01_axis_aresetn : in STD_LOGIC;
    m01_axis_tvalid : out STD_LOGIC;
    m01_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m01_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m01_axis_tlast : out STD_LOGIC;
    m01_axis_tready : in STD_LOGIC;
    m02_axis_aclk : in STD_LOGIC;
    m02_axis_aresetn : in STD_LOGIC;
    m02_axis_tvalid : out STD_LOGIC;
    m02_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m02_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m02_axis_tlast : out STD_LOGIC;
    m02_axis_tready : in STD_LOGIC;
    m03_axis_aclk : in STD_LOGIC;
    m03_axis_aresetn : in STD_LOGIC;
    m03_axis_tvalid : out STD_LOGIC;
    m03_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m03_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m03_axis_tlast : out STD_LOGIC;
    m03_axis_tready : in STD_LOGIC;
    m04_axis_aclk : in STD_LOGIC;
    m04_axis_aresetn : in STD_LOGIC;
    m04_axis_tvalid : out STD_LOGIC;
    m04_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m04_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m04_axis_tlast : out STD_LOGIC;
    m04_axis_tready : in STD_LOGIC;
    m05_axis_aclk : in STD_LOGIC;
    m05_axis_aresetn : in STD_LOGIC;
    m05_axis_tvalid : out STD_LOGIC;
    m05_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m05_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m05_axis_tlast : out STD_LOGIC;
    m05_axis_tready : in STD_LOGIC;
    m06_axis_aclk : in STD_LOGIC;
    m06_axis_aresetn : in STD_LOGIC;
    m06_axis_tvalid : out STD_LOGIC;
    m06_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m06_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m06_axis_tlast : out STD_LOGIC;
    m06_axis_tready : in STD_LOGIC;
    m07_axis_aclk : in STD_LOGIC;
    m07_axis_aresetn : in STD_LOGIC;
    m07_axis_tvalid : out STD_LOGIC;
    m07_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m07_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m07_axis_tlast : out STD_LOGIC;
    m07_axis_tready : in STD_LOGIC
  );
  end component design_1_full_conv_0_0;
  signal clk_1 : STD_LOGIC;
  signal full_conv_0_m00_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m00_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m01_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m01_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m02_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m02_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m03_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m03_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m04_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m04_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m05_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m05_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m06_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m06_axis_tvalid : STD_LOGIC;
  signal full_conv_0_m07_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal full_conv_0_m07_axis_tvalid : STD_LOGIC;
  signal full_conv_0_s00_axis_tready : STD_LOGIC;
  signal m_axis_tready_1 : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal s00_axis_tdata_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_axis_tvalid_1 : STD_LOGIC;
  signal NLW_full_conv_0_m00_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m01_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m02_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m03_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m04_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m05_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m06_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m07_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_full_conv_0_m00_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m01_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m02_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m03_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m04_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m05_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m06_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_full_conv_0_m07_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET reset, CLK_DOMAIN design_1_clk, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M00_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m00_axis_tdata : signal is "XIL_INTERFACENAME DATA.M00_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m01_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M01_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m01_axis_tdata : signal is "XIL_INTERFACENAME DATA.M01_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m02_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M02_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m02_axis_tdata : signal is "XIL_INTERFACENAME DATA.M02_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m03_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M03_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m03_axis_tdata : signal is "XIL_INTERFACENAME DATA.M03_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m04_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M04_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m04_axis_tdata : signal is "XIL_INTERFACENAME DATA.M04_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m05_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M05_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m05_axis_tdata : signal is "XIL_INTERFACENAME DATA.M05_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m06_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M06_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m06_axis_tdata : signal is "XIL_INTERFACENAME DATA.M06_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m07_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.M07_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of m07_axis_tdata : signal is "XIL_INTERFACENAME DATA.M07_AXIS_TDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:signal:data:1.0 DATA.S00_AXIS_TDATA DATA";
  attribute X_INTERFACE_PARAMETER of s00_axis_tdata : signal is "XIL_INTERFACENAME DATA.S00_AXIS_TDATA, LAYERED_METADATA undef";
begin
  clk_1 <= clk;
  m00_axis_tdata(31 downto 0) <= full_conv_0_m00_axis_tdata(31 downto 0);
  m01_axis_tdata(31 downto 0) <= full_conv_0_m01_axis_tdata(31 downto 0);
  m02_axis_tdata(31 downto 0) <= full_conv_0_m02_axis_tdata(31 downto 0);
  m03_axis_tdata(31 downto 0) <= full_conv_0_m03_axis_tdata(31 downto 0);
  m04_axis_tdata(31 downto 0) <= full_conv_0_m04_axis_tdata(31 downto 0);
  m05_axis_tdata(31 downto 0) <= full_conv_0_m05_axis_tdata(31 downto 0);
  m06_axis_tdata(31 downto 0) <= full_conv_0_m06_axis_tdata(31 downto 0);
  m07_axis_tdata(31 downto 0) <= full_conv_0_m07_axis_tdata(31 downto 0);
  m_axis_tready_1 <= m_axis_tready;
  reset_1 <= reset;
  s00_axis_tdata_1(31 downto 0) <= s00_axis_tdata(31 downto 0);
  s00_axis_tready <= full_conv_0_s00_axis_tready;
  s00_axis_tvalid_1 <= s00_axis_tvalid;
  tvalid_m <= full_conv_0_m00_axis_tvalid;
  tvalid_m1 <= full_conv_0_m01_axis_tvalid;
  tvalid_m2 <= full_conv_0_m02_axis_tvalid;
  tvalid_m3 <= full_conv_0_m03_axis_tvalid;
  tvalid_m4 <= full_conv_0_m04_axis_tvalid;
  tvalid_m5 <= full_conv_0_m05_axis_tvalid;
  tvalid_m6 <= full_conv_0_m06_axis_tvalid;
  tvalid_m7 <= full_conv_0_m07_axis_tvalid;
full_conv_0: component design_1_full_conv_0_0
     port map (
      m00_axis_aclk => clk_1,
      m00_axis_aresetn => reset_1,
      m00_axis_tdata(31 downto 0) => full_conv_0_m00_axis_tdata(31 downto 0),
      m00_axis_tlast => NLW_full_conv_0_m00_axis_tlast_UNCONNECTED,
      m00_axis_tready => m_axis_tready_1,
      m00_axis_tstrb(3 downto 0) => NLW_full_conv_0_m00_axis_tstrb_UNCONNECTED(3 downto 0),
      m00_axis_tvalid => full_conv_0_m00_axis_tvalid,
      m01_axis_aclk => clk_1,
      m01_axis_aresetn => reset_1,
      m01_axis_tdata(31 downto 0) => full_conv_0_m01_axis_tdata(31 downto 0),
      m01_axis_tlast => NLW_full_conv_0_m01_axis_tlast_UNCONNECTED,
      m01_axis_tready => m_axis_tready_1,
      m01_axis_tstrb(3 downto 0) => NLW_full_conv_0_m01_axis_tstrb_UNCONNECTED(3 downto 0),
      m01_axis_tvalid => full_conv_0_m01_axis_tvalid,
      m02_axis_aclk => clk_1,
      m02_axis_aresetn => reset_1,
      m02_axis_tdata(31 downto 0) => full_conv_0_m02_axis_tdata(31 downto 0),
      m02_axis_tlast => NLW_full_conv_0_m02_axis_tlast_UNCONNECTED,
      m02_axis_tready => m_axis_tready_1,
      m02_axis_tstrb(3 downto 0) => NLW_full_conv_0_m02_axis_tstrb_UNCONNECTED(3 downto 0),
      m02_axis_tvalid => full_conv_0_m02_axis_tvalid,
      m03_axis_aclk => clk_1,
      m03_axis_aresetn => reset_1,
      m03_axis_tdata(31 downto 0) => full_conv_0_m03_axis_tdata(31 downto 0),
      m03_axis_tlast => NLW_full_conv_0_m03_axis_tlast_UNCONNECTED,
      m03_axis_tready => m_axis_tready_1,
      m03_axis_tstrb(3 downto 0) => NLW_full_conv_0_m03_axis_tstrb_UNCONNECTED(3 downto 0),
      m03_axis_tvalid => full_conv_0_m03_axis_tvalid,
      m04_axis_aclk => clk_1,
      m04_axis_aresetn => reset_1,
      m04_axis_tdata(31 downto 0) => full_conv_0_m04_axis_tdata(31 downto 0),
      m04_axis_tlast => NLW_full_conv_0_m04_axis_tlast_UNCONNECTED,
      m04_axis_tready => m_axis_tready_1,
      m04_axis_tstrb(3 downto 0) => NLW_full_conv_0_m04_axis_tstrb_UNCONNECTED(3 downto 0),
      m04_axis_tvalid => full_conv_0_m04_axis_tvalid,
      m05_axis_aclk => clk_1,
      m05_axis_aresetn => reset_1,
      m05_axis_tdata(31 downto 0) => full_conv_0_m05_axis_tdata(31 downto 0),
      m05_axis_tlast => NLW_full_conv_0_m05_axis_tlast_UNCONNECTED,
      m05_axis_tready => m_axis_tready_1,
      m05_axis_tstrb(3 downto 0) => NLW_full_conv_0_m05_axis_tstrb_UNCONNECTED(3 downto 0),
      m05_axis_tvalid => full_conv_0_m05_axis_tvalid,
      m06_axis_aclk => clk_1,
      m06_axis_aresetn => reset_1,
      m06_axis_tdata(31 downto 0) => full_conv_0_m06_axis_tdata(31 downto 0),
      m06_axis_tlast => NLW_full_conv_0_m06_axis_tlast_UNCONNECTED,
      m06_axis_tready => m_axis_tready_1,
      m06_axis_tstrb(3 downto 0) => NLW_full_conv_0_m06_axis_tstrb_UNCONNECTED(3 downto 0),
      m06_axis_tvalid => full_conv_0_m06_axis_tvalid,
      m07_axis_aclk => clk_1,
      m07_axis_aresetn => reset_1,
      m07_axis_tdata(31 downto 0) => full_conv_0_m07_axis_tdata(31 downto 0),
      m07_axis_tlast => NLW_full_conv_0_m07_axis_tlast_UNCONNECTED,
      m07_axis_tready => m_axis_tready_1,
      m07_axis_tstrb(3 downto 0) => NLW_full_conv_0_m07_axis_tstrb_UNCONNECTED(3 downto 0),
      m07_axis_tvalid => full_conv_0_m07_axis_tvalid,
      s00_axis_aclk => clk_1,
      s00_axis_aresetn => reset_1,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata_1(31 downto 0),
      s00_axis_tlast => '0',
      s00_axis_tready => full_conv_0_s00_axis_tready,
      s00_axis_tstrb(3 downto 0) => B"1111",
      s00_axis_tvalid => s00_axis_tvalid_1
    );
end STRUCTURE;
