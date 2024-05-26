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
        FILE_NAME: string := "weights.txt";
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

use std.textio.all;
use ieee.std_logic_textio.all;
type my_array is array(0 to 8) of signed(7 downto 0);
impure function init_weights (filename: string) return my_array is
    FILE weights_file: text is filename;
    variable weights: my_array := (others => (others => '0'));
    variable fileline: line;
    variable weight: std_logic_vector(7 downto 0);
begin
    for i in my_array'range loop
        if endfile(weights_file) then
            exit;
        end if;
        readline(weights_file, fileline);
        read(fileline, weight);
        weights(i) := signed(weight);
    end loop;
    file_close(weights_file);
    return weights;
end function;

Constant weights_array: my_array := init_weights(FILE_NAME);
Constant  s_scale : integer := 11965621;
    
signal accum : signed(63 downto 0);
signal shift : signed(31 downto 0);
signal current_output : std_logic_vector(7 downto 0);
signal i1,i2,i3,i4,i5,i6,i7,i8,i9 : signed(16 downto 0);
signal r1,r2,r3,r4,r5,r6,r7,r8,r9 : signed(24 downto 0);
--signal s_scale : signed(32 downto 0);
signal res : signed(31 downto 0);

begin

--s_scale <= signed('0' & scale);


process(clk,reset, shift)
begin
    if reset = '0' then
        r1 <= (others => '0');
        r2 <= (others => '0');
        r3 <= (others => '0');
        r4 <= (others => '0');
        r5 <= (others => '0');
        r6 <= (others => '0');
        r7 <= (others => '0');
        r8 <= (others => '0');
        r9 <= (others => '0');
        i1 <= (others => '0');
        i2 <= (others => '0');
        i3 <= (others => '0');
        i4 <= (others => '0');
        i5 <= (others => '0');
        i6 <= (others => '0');
        i7 <= (others => '0');
        i8 <= (others => '0');
        i9 <= (others => '0');
        res <= (others => '0');
        accum <= (others => '0');
        shift <= (others => '0');
        current_output <= (others => '0');
    elsif rising_edge(clk) then
        i1 <= signed("000000000" & input(71 downto 64));
        i2 <= signed("000000000" & input(63 downto 56)); 
        i3 <= signed("000000000" & input(55 downto 48));
        i4 <= signed("000000000" & input(47 downto 40));
        i5 <= signed("000000000" & input(39 downto 32));
        i6 <= signed("000000000" & input(31 downto 24));
        i7 <= signed("000000000" & input(23 downto 16));
        i8 <= signed("000000000" & input(15 downto 8));
        i9 <= signed("000000000" & input(7 downto 0));
        r1 <= i1*weights_array(0);
        r2 <= i2*weights_array(1);
        r3 <= i3*weights_array(2);
        r4 <= i4*weights_array(3);
        r5 <= i5*weights_array(4);
        r6 <= i6*weights_array(5);
        r7 <= i7*weights_array(6);
        r8 <= i8*weights_array(7);
        r9 <= i9*weights_array(8);
        res <= r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8 + r9 + bias;
        accum <= res*s_scale;
        shift <= accum(63 downto 32);
        if shift < 0 then
            current_output <= (others => '0');
        elsif shift > 127 then
            current_output <= "01111111";
        else
            current_output <= std_logic_vector(shift(7 downto 0));
        end if; 
    end if;
end process;

output <= current_output;
end Behavioral;
