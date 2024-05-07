----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 10:50:29 AM
-- Design Name: 
-- Module Name: kernel_multiplier - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity kernel_multiplier is
    generic(
        w1 : signed(7 downto 0);
        w2 : signed(7 downto 0);
        w3 : signed(7 downto 0);
        w4 : signed(7 downto 0);
        w5 : signed(7 downto 0);
        w6 : signed(7 downto 0);
        w7 : signed(7 downto 0);
        w8 : signed(7 downto 0);
        w9 : signed(7 downto 0);
        scale : unsigned(31 downto 0);
        bias : signed(31 downto 0)
    );
    port(
        clk : in std_logic;
        reset : in std_logic;
        input : in unsigned(71 downto 0);
        output : out std_logic_vector(7 downto 0)
    );
end kernel_multiplier;

architecture Behavioral of kernel_multiplier is
signal next_accum, current_accum : signed(64 downto 0);
signal next_shift, current_shift : signed(31 downto 0);
signal next_output, current_output : std_logic_vector(7 downto 0);
begin

process(clk,reset)
begin
    if reset = '0' then
        current_accum <= (others => '0');
        current_shift <= (others => '0');
        current_output <= (others => '0');
    elsif rising_edge(clk) then
        current_accum <= next_accum;
        current_shift <= next_shift;
        current_output <= next_output;
    end if;
end process;

process(input,current_accum)
begin
    next_accum <= (signed('0' & scale)*(w1*signed('0' & input(71 downto 64)) + w2*signed('0' & input(63 downto 56)) + w3*signed('0' & input(55 downto 48)) +
            w4*signed('0' & input(47 downto 40)) + w5*signed('0' & input(39 downto 32)) + w6*signed('0' & input(31 downto 24)) +
            w7*signed('0' & input(23 downto 16)) + w8*signed('0' & input(15 downto 8)) + w9*signed('0' & input(7 downto 0)) + bias)); 
    next_shift <= current_accum(63 downto 32);
    
    if current_shift < 0 then
        next_output <= (others => '0');
    elsif current_shift > 127 then
        next_output <= (others => '1');
    else
        next_output <= std_logic_vector(current_shift(7 downto 0));
    end if;
end process;
output <= current_output;
end Behavioral;
