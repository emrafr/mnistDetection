----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 12:12:15 PM
-- Design Name: 
-- Module Name: input_ctrl - Behavioral
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

entity input_ctrl is
port(
    clk : in std_logic;
    reset : in std_logic;
    tvalid : in std_logic;
    tlast : in std_logic;
    tdata : in std_logic_vector(31 downto 0);
    tready : out std_logic;
    output : out std_logic_vector(223 downto 0)
    );
end input_ctrl;

architecture Behavioral of input_ctrl is

begin


end Behavioral;
