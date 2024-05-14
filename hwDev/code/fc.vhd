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

entity fc is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        fc_input : in std_logic_vector(1759 downto 0);
        fc_weights : in std_logic_vector(1759 downto 0);
        fc_bias : in std_logic_vector(7 downto 0);
        valid_output : out std_logic;
        fc_output : out std_logic_vector(79 downto 0)
    );
end fc;

architecture Behavioral of fc is

begin


end Behavioral;
