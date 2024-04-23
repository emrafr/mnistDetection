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


entity maxpool is
    port(
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        mp_input : in std_logic_vector(207 downto 0);
        mp_output : out std_logic_vector(7 downto 0)
    );
end maxpool;

architecture Behavioral of maxpool is

begin


end Behavioral;