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
        SAMPLE_WIDTH: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready: in std_logic;
        data_valid : out std_logic;
        stimulus_stream : out std_logic_vector(SAMPLE_WIDTH-1 downto 0)
    );
end component;

component design_1_wrapper is
  port (
    Input_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk_150MHz : in STD_LOGIC;
    output_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reset_rtl : in STD_LOGIC;
    tready : out STD_LOGIC;
    tready_m : in STD_LOGIC;
    tvalid : in STD_LOGIC;
    tvalid_m : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component;
signal Input_data, output_data : std_logic_vector(31 downto 0);
signal clk, reset, tready, tready_m, tvalid: std_logic;
signal tvalid_m : std_logic_vector(0 downto 0);
constant period : time := 10000 ps;

begin

stimuli_gen: stimulus_generator
    generic map (
        FILE_NAME => "/home/emma/input.txt",
        SAMPLE_WIDTH => 32
    )
    port map (
        clk => clk,
        reset => reset,
        ready => tready,
        data_valid => tvalid,
        stimulus_stream => Input_data
);

DUT : design_1_wrapper
  port map(
    Input_data => Input_data,
    clk_150MHz => clk,
    output_data => output_data,
    reset_rtl => reset,
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
end Behavioral;
