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
--Constant  s_scale : signed(24 downto 0) := "0101101101001010010110101";
Constant  s_scale : signed(2 downto 0) := "011";
    
signal accum : signed(34 downto 0);
signal accumd : signed(34 downto 0);    
signal accum2 : signed(34 downto 0);
signal accumd2 : signed(34 downto 0);    
--signal accum : signed(56 downto 0);
--signal accumd : signed(56 downto 0);    
--signal accum2 : signed(56 downto 0);
--signal accumd2 : signed(56 downto 0);
signal shift : signed(24 downto 0);
signal shiftd : signed(24 downto 0); 
--signal shift : signed(24 downto 0);
--signal shiftd : signed(24 downto 0); 
signal current_output : std_logic_vector(7 downto 0);
signal i1,i2,i3,i4,i5,i6,i7,i8,i9 : signed(8 downto 0);
--signal i1,i2,i3,i4,i5,i6,i7,i8,i9 : signed(12 downto 0);

signal r1,r2,r3,r4,r5,r6,r7,r8,r9 : signed(16 downto 0);
--signal r1,r2,r3,r4,r5,r6,r7,r8,r9 : signed(20 downto 0);
signal r1d,r2d,r3d,r4d,r5d,r6d,r7d,r8d,r9d : signed(20 downto 0);
signal r1d2,r2d2,r3d2,r4d2,r5d2,r6d2,r7d2,r8d2,r9d2 : signed(20 downto 0);
signal r1d3,r2d3,r3d3,r4d3,r5d3,r6d3,r7d3,r8d3,r9d3 : signed(20 downto 0);
signal res : signed(31 downto 0);
signal resd : signed(31 downto 0);
signal resd2 : signed(31 downto 0);
signal resd3 : signed(31 downto 0);

begin

r1 <= i1*weights_array(0);
r2 <= i2*weights_array(1);
r3 <= i3*weights_array(2);
r4 <= i4*weights_array(3);
r5 <= i5*weights_array(4);
r6 <= i6*weights_array(5);
r7 <= i7*weights_array(6);
r8 <= i8*weights_array(7);
r9 <= i9*weights_array(8);
--res <= r1d + r2d + r3d + r4d + r5d + r6d + r7d + r8d + r9d + bias;

process(clk,reset, shiftd)
begin
    if rising_edge(clk) then
        if reset = '0' then
            r1d <= (others => '0');
            r2d <= (others => '0');
            r3d <= (others => '0');
            r4d <= (others => '0');
            r5d <= (others => '0');
            r6d <= (others => '0');
            r7d <= (others => '0');
            r8d <= (others => '0');
            r9d <= (others => '0');
            r1d2 <= (others => '0');
            r2d2 <= (others => '0');
            r3d2 <= (others => '0');
            r4d2 <= (others => '0');
            r5d2 <= (others => '0');
            r6d2 <= (others => '0');
            r7d2 <= (others => '0');
            r8d2 <= (others => '0');
            r9d2 <= (others => '0');
            r1d3 <= (others => '0');
            r2d3 <= (others => '0');
            r3d3 <= (others => '0');
            r4d3 <= (others => '0');
            r5d3 <= (others => '0');
            r6d3 <= (others => '0');
            r7d3 <= (others => '0');
            r8d3 <= (others => '0');
            r9d3 <= (others => '0');
            i1 <= (others => '0');
            i2 <= (others => '0');
            i3 <= (others => '0');
            i4 <= (others => '0');
            i5 <= (others => '0');
            i6 <= (others => '0');
            i7 <= (others => '0');
            i8 <= (others => '0');
            i9 <= (others => '0');
            resd <= (others => '0');
            resd2 <= (others => '0');
            resd3 <= (others => '0');
            accumd <= (others => '0');
            shiftd <= (others => '0');
            current_output <= (others => '0');
        else
            i1 <= signed("0" & input(71 downto 64));
            i2 <= signed("0" & input(63 downto 56)); 
            i3 <= signed("0" & input(55 downto 48));
            i4 <= signed("0" & input(47 downto 40));
            i5 <= signed("0" & input(39 downto 32));
            i6 <= signed("0" & input(31 downto 24));
            i7 <= signed("0" & input(23 downto 16));
            i8 <= signed("0" & input(15 downto 8));
            i9 <= signed("0" & input(7 downto 0));
            r1d <= RESIZE(r1, 21);
            r2d <= RESIZE(r2, 21);
            r3d <= RESIZE(r3, 21);
            r4d <= RESIZE(r4, 21);
            r5d <= RESIZE(r5, 21);
            r6d <= RESIZE(r6, 21);
            r7d <= RESIZE(r7, 21);
            r8d <= RESIZE(r8, 21);
            r9d <= RESIZE(r9, 21);
            r1d2 <= r1d;
            r2d2 <= r2d;
            r3d2 <= r3d;
            r4d2 <= r4d;
            r5d2 <= r5d;
            r6d2 <= r6d;
            r7d2 <= r7d;
            r8d2 <= r8d;
            r9d2 <= r9d;
            r1d3 <= r1d2;
            r2d3 <= r2d2;
            r3d3 <= r3d2;
            r4d3 <= r4d2;
            r5d3 <= r5d2;
            r6d3 <= r6d2;
            r7d3 <= r7d2;
            r8d3 <= r8d2;
            r9d3 <= r9d2;
            resd <= r1d3 + r2d3 + r3d3 + r4d3 + r5d3 + r6d3 + r7d3 + r8d3 + r9d3 + bias;
            resd2 <= resd;
            resd3 <= resd2;
            accumd <= resd3*s_scale;
            shiftd <= accumd(34 downto 10);
            if shiftd < 0 then 
                current_output <= (others => '0');
            elsif shiftd > 127 then
                current_output <= "01111111";
            else
                current_output <= std_logic_vector(shiftd(7 downto 0));
            end if; 
        end if;
    end if;
end process;

output <= current_output;
end Behavioral;
