--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Thu Nov 21 09:07:05 2024
--Host        : debian running 64-bit Debian GNU/Linux 12 (bookworm)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
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
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m01_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m02_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m03_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m04_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m05_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m06_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m07_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tvalid_m : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    tvalid_m1 : out STD_LOGIC;
    tvalid_m2 : out STD_LOGIC;
    tvalid_m3 : out STD_LOGIC;
    tvalid_m4 : out STD_LOGIC;
    tvalid_m5 : out STD_LOGIC;
    tvalid_m6 : out STD_LOGIC;
    tvalid_m7 : out STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      clk => clk,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m01_axis_tdata(31 downto 0) => m01_axis_tdata(31 downto 0),
      m02_axis_tdata(31 downto 0) => m02_axis_tdata(31 downto 0),
      m03_axis_tdata(31 downto 0) => m03_axis_tdata(31 downto 0),
      m04_axis_tdata(31 downto 0) => m04_axis_tdata(31 downto 0),
      m05_axis_tdata(31 downto 0) => m05_axis_tdata(31 downto 0),
      m06_axis_tdata(31 downto 0) => m06_axis_tdata(31 downto 0),
      m07_axis_tdata(31 downto 0) => m07_axis_tdata(31 downto 0),
      m_axis_tready => m_axis_tready,
      reset => reset,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid,
      tvalid_m => tvalid_m,
      tvalid_m1 => tvalid_m1,
      tvalid_m2 => tvalid_m2,
      tvalid_m3 => tvalid_m3,
      tvalid_m4 => tvalid_m4,
      tvalid_m5 => tvalid_m5,
      tvalid_m6 => tvalid_m6,
      tvalid_m7 => tvalid_m7
    );
end STRUCTURE;
