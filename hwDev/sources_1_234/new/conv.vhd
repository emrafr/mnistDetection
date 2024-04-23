----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:55:11 AM
-- Design Name: 
-- Module Name: fc - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use ieee.numeric_std.all;
entity conv is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        conv_input : in std_logic_vector(71 downto 0);
        valid_output : out  std_logic;
        conv_output : out std_logic_vector(415 downto 0)        
    );
end conv;

architecture Behavioral of conv is
component kernel_multiplier is
    generic(
        weights1 : unsigned(7 downto 0);
        weights2 : unsigned(7 downto 0);
        weights3 : unsigned(7 downto 0);
        weights4 : unsigned(7 downto 0);
        weights5 : unsigned(7 downto 0);
        weights6 : unsigned(7 downto 0);
        weights7 : unsigned(7 downto 0);
        weights8 : unsigned(7 downto 0);
        weights9 : unsigned(7 downto 0);
        scale : unsigned(31 downto 0);
        bias : unsigned(7 downto 0)
    );
    port(
        input : in std_logic_vector(71 downto 0);
        output : out std_logic_vector(7 downto 0)
    );
end component;
type state_type is (s_idle, s_2);
signal current_input, next_input : std_logic_vector(71 downto 0);
signal output_k1 : std_logic_vector(7 downto 0);
signal next_output_reg, current_output_reg : std_logic_vector(415 downto 0);
signal current_state, next_state : state_type;

begin

kernel_1 : kernel_multiplier
generic map(
    weights1 => 0, 
    weights2 => 1, 
    weights3 => 3, 
    weights4 => 4, 
    weights5 => 5, 
    weights6 => 6, 
    weights7 => 7, 
    weights8 => 8, 
    weights9 => 9, 
    scale => 56,
    bias => 10
)
port map(
    input => current_input,
    output => output_k1
);

process(clk,reset)
begin
    if reset = '0' then
        current_input <= (others => '0');
        current_output_reg <= (others => '0');
        current_state <= s_idle;
    elsif rising_edge(clk) then
        current_input <= next_input;
        current_output_reg <= next_output_reg;
        current_state <= next_state;
    end if;
end process;

fsm : process(valid_input, current_state, current_output_reg, conv_input, current_input)
begin
case current_state is
    when s_idle =>
        if valid_input = '1' then
            next_input <= conv_input;
            next_state <= s_2;
        else
            next_input <= current_input;
            next_state <= s_idle;
        end if;
    when s_2 =>
        if current_counter = 26 then
            output_conv <= current_output_reg;
            valid_outout <= '1';
            next_counter <= (others => '0');
        next_counter <= current_counter + 1;
        next_output_reg <= current_output_reg(407 downto 0) & output_k1;
        next_state <= s_idle;
end process;

end Behavioral;