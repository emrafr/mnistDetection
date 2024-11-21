----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2024 10:52:17 AM
-- Design Name: 
-- Module Name: tb_conv_axi - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity tb_full_conv_axi is
--  Port ( );
end tb_full_conv_axi;

architecture Behavioral of tb_full_conv_axi is
component stimulus_generator_conv is
    generic (
        FILE_NAME: string := "input.txt";
        FILE_NAME2: string := "input.txt";
        SAMPLE_WIDTH: positive;
        SAMPLE_WIDTH2: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready: in std_logic;
        tvalid_m : in std_logic;
        data_valid : out std_logic;
        stimulus_stream_input : out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output1: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output2: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output3: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output4: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output5: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output6: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output7: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output8: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0)
    );
end component;

component design_1_wrapper is
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
end component;

signal input_data, true_output_data1, true_output_data2, true_output_data3, true_output_data4, true_output_data5, true_output_data6, true_output_data7, true_output_data8 : std_logic_vector(31 downto 0);
signal m00_axis_tdata, m01_axis_tdata, m02_axis_tdata, m03_axis_tdata, m04_axis_tdata, m05_axis_tdata, m06_axis_tdata, m07_axis_tdata : std_logic_vector(31 downto 0);
signal m00_axis_tdatad, m01_axis_tdatad, m02_axis_tdatad, m03_axis_tdatad, m04_axis_tdatad, m05_axis_tdatad, m06_axis_tdatad, m07_axis_tdatad : std_logic_vector(31 downto 0);
signal clk, reset : std_logic;
signal m_axis_tready, s00_axis_tready, s00_axis_tvalid : std_logic;
signal tvalid_md : std_logic;
signal tvalid_m, tvalid_m1, tvalid_m2, tvalid_m3, tvalid_m4, tvalid_m5, tvalid_m6, tvalid_m7 : std_logic;
signal correct1, correct2, correct3, correct4, correct5, correct6, correct7, correct8 : std_logic;
constant period : time := 10000 ps;

begin

stimuli_gen: stimulus_generator_conv
    generic map (       
        FILE_NAME => "/home/emma/mnistDetection/swDev/stimuli_data/full_conv_input.txt",
        FILE_NAME2 => "/home/emma/mnistDetection/swDev/stimuli_data/full_conv_output.txt",       
--        FILE_NAME => "/home/emma/full_conv_input.txt",
--        FILE_NAME2 => "/home/emma/full_conv_output.txt",
        SAMPLE_WIDTH => 32,
        SAMPLE_WIDTH2 => 256
    )
    port map (
        clk => clk,
        reset => reset,
        ready => s00_axis_tready,
        tvalid_m => tvalid_m,
        data_valid => s00_axis_tvalid,
        stimulus_stream_input => input_data,
        stimulus_stream_output1 => true_output_data1,
        stimulus_stream_output2 => true_output_data2,
        stimulus_stream_output3 => true_output_data3,
        stimulus_stream_output4 => true_output_data4,
        stimulus_stream_output5 => true_output_data5,
        stimulus_stream_output6 => true_output_data6,
        stimulus_stream_output7 => true_output_data7,
        stimulus_stream_output8 => true_output_data8
);

DUT : design_1_wrapper
  port map(
    clk => clk,
    m00_axis_tdata => m00_axis_tdata,
    m01_axis_tdata => m01_axis_tdata,
    m02_axis_tdata => m02_axis_tdata,
    m03_axis_tdata => m03_axis_tdata,
    m04_axis_tdata => m04_axis_tdata,
    m05_axis_tdata => m05_axis_tdata,
    m06_axis_tdata => m06_axis_tdata,
    m07_axis_tdata => m07_axis_tdata,
    m_axis_tready => m_axis_tready,
    reset => reset,
    s00_axis_tdata => input_data,
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
clk_process : process
begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
end process;

m_axis_tready <= '1';

reset <= '0',
         '1' after 1*period;

process(clk)
begin
if rising_edge(clk) then
    m00_axis_tdatad <= m00_axis_tdata;
    m01_axis_tdatad <= m01_axis_tdata;
    m02_axis_tdatad <= m02_axis_tdata;
    m03_axis_tdatad <= m03_axis_tdata;
    m04_axis_tdatad <= m04_axis_tdata;
    m05_axis_tdatad <= m05_axis_tdata;
    m06_axis_tdatad <= m06_axis_tdata;
    m07_axis_tdatad <= m07_axis_tdata;
    tvalid_md <= tvalid_m;
end if;
end process;
         
check_correct_ouput : process(tvalid_md, true_output_data1, m00_axis_tdata, true_output_data2, m01_axis_tdata, true_output_data3, m02_axis_tdata, true_output_data4, m03_axis_tdata, true_output_data5, m04_axis_tdata, true_output_data6, m05_axis_tdata, true_output_data7, m06_axis_tdata, true_output_data6, m07_axis_tdata)
begin
if tvalid_md = '1' then
    if m00_axis_tdatad = true_output_data1 then
        correct1 <= '1';
    else
        correct1 <= '0';
    end if;
    
    if m01_axis_tdatad = true_output_data2 then
        correct2 <= '1';
    else
        correct2 <= '0';
    end if;
    
    if m02_axis_tdatad = true_output_data3 then
        correct3 <= '1';
    else
        correct3 <= '0';
    end if;
    
    if m03_axis_tdatad = true_output_data4 then
        correct4 <= '1';
    else
        correct4 <= '0';
    end if;
    
    if m04_axis_tdatad = true_output_data5 then
        correct5 <= '1';
    else
        correct5 <= '0';
    end if;
    
    if m05_axis_tdatad = true_output_data6 then
        correct6 <= '1';
    else
        correct6 <= '0';
    end if;
    
    if m06_axis_tdatad = true_output_data7 then
        correct7 <= '1';
    else
        correct7 <= '0';
    end if;
    
    if m07_axis_tdatad = true_output_data8 then
        correct8 <= '1';
    else
        correct8 <= '0';
    end if;
else
    correct1 <= '0';
    correct2 <= '0';
    correct3 <= '0';
    correct4 <= '0';
    correct5 <= '0';
    correct6 <= '0';
    correct7 <= '0';
    correct8 <= '0';
end if;
end process;
         
end Behavioral;
