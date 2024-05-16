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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_conv_axi is
--  Port ( );
end tb_conv_axi;

architecture Behavioral of tb_conv_axi is
component stimulus_generator is
    generic (
        FILE_NAME: string := "input.txt";
        FILE_NAME2: string := "input.txt";
        SAMPLE_WIDTH: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready: in std_logic;
        tvalid_m : in std_logic;
        data_valid : out std_logic;
        stimulus_stream : out std_logic_vector(SAMPLE_WIDTH-1 downto 0);
        stimulus_stream2 : out std_logic_vector(SAMPLE_WIDTH-1 downto 0)
    );
end component;

component design_1_wrapper is
  port (
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    output_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reset : in STD_LOGIC;
    tready : out STD_LOGIC;
    tready_m : in STD_LOGIC;
    tvalid : in STD_LOGIC;
    tvalid_m : out STD_LOGIC
  );
end component;
signal input_data, output_data, true_output_data, delayed_output : std_logic_vector(31 downto 0);
signal clk, reset, tready, tready_m, tvalid: std_logic;
signal tvalid_m, correct : std_logic;
constant period : time := 10000 ps;

begin

stimuli_gen: stimulus_generator
    generic map (
--        FILE_NAME => "/home/emma/test_input.txt",
--        FILE_NAME2 => "/home/emma/input.txt",        
        FILE_NAME => "/home/emma/mnistDetection/swDev/stimuli_data/lal_input.txt",
        FILE_NAME2 => "/home/emma/mnistDetection/swDev/stimuli_data/lal_output.txt",
        SAMPLE_WIDTH => 32
    )
    port map (
        clk => clk,
        reset => reset,
        ready => tready,
        tvalid_m => tvalid_m,
        data_valid => tvalid,
        stimulus_stream => input_data,
        stimulus_stream2 => true_output_data
);

DUT : design_1_wrapper
  port map(
    input_data => input_data,
    clk => clk,
    output_data => output_data,
    reset => reset,
    tready => tready,
    tready_m => tready_m,
    tvalid => tvalid,
    tvalid_m => tvalid_m
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
         
check_correct_ouput : process(tvalid_m, true_output_data, output_data)
begin
if tvalid_m = '1' then
    if output_data = true_output_data then
        correct <= '1';
    else
        correct <= '0';
    end if;
end if;
end process;
         
end Behavioral;
