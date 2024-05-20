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
        tvalid_m :  in STD_LOGIC;
        data_valid : out std_logic;
        stimulus_stream_output1: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output2: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0)
    );
end component;

component design_1_wrapper is
  port (
    clk : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reset : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tready : out STD_LOGIC;
    tready_m : in STD_LOGIC;
    tvalid : in STD_LOGIC;
    tvalid_m : out STD_LOGIC
  );
end component;

signal m00_axis_tdata, true_output : std_logic_vector(31 downto 0);
signal s00_axis_tdata : std_logic_vector(31 downto 0);
signal m00_axis_tdatad  : std_logic_vector(31 downto 0);
signal clk, reset : std_logic;
signal tready_m, valid_input : std_logic;
signal tvalid_m : std_logic;
signal tready : std_logic;
signal correct1 : std_logic;
constant period : time := 10000 ps;

begin

stimuli_gen: stimulus_generator_conv
    generic map (        
        FILE_NAME => "/home/emma/mnistDetection/swDev/stimuli_data/full_conv_input.txt",
        FILE_NAME2 => "/home/emma/mnistDetection/swDev/stimuli_data/mp_output.txt",
        SAMPLE_WIDTH => 32,
        SAMPLE_WIDTH2 => 256
    )
    port map (
        clk => clk,
        reset => reset,
        ready => tready,
        tvalid_m  => tvalid_m,
        data_valid => valid_input,
        stimulus_stream_output1 => s00_axis_tdata,
        stimulus_stream_output2 => true_output
);

DUT : design_1_wrapper
  port map(
    clk => clk,
    m00_axis_tdata => m00_axis_tdata,
    reset => reset,
    s00_axis_tdata => s00_axis_tdata,
    tready_m => tready_m,
    tvalid_m  => tvalid_m,
    tvalid => valid_input,
    tready => tready
  );
  
clk_process : process
begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
end process;

tready_m <= '1';

reset <= '0',
         '1' after 1*period;

process(clk)
begin
if rising_edge(clk) then
    m00_axis_tdatad <= m00_axis_tdata;
end if;
end process;
         
check_correct_ouput : process(tvalid_m, true_output, m00_axis_tdata)
begin
if tvalid_m = '1' then
    if m00_axis_tdatad = true_output then
        correct1 <= '1';
    else
        correct1 <= '0';
    end if;
else
    correct1 <= '0';
end if;
end process;
         
end Behavioral;
