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
--signal next_accum, current_accum : signed(63 downto 0);
signal next_accum, current_accum : signed(64 downto 0);
signal next_shift, current_shift : signed(31 downto 0);
signal next_output, current_output : std_logic_vector(7 downto 0);
signal i1,i2,i3,i4,i5,i6,i7,i8,i9 : signed(16 downto 0);
signal r1,r2,r3,r4,r5,r6,r7,r8,r9 : signed(24 downto 0);
signal s_scale : signed(32 downto 0);
signal res : signed(24 downto 0);
begin
--i1 <= signed("00000" & input(71 downto 64));
--i2 <= signed('0' & input(63 downto 56)); 
--i3 <= signed('0' & input(55 downto 48));
--i4 <= signed('0' & input(47 downto 40));
--i5 <= signed('0' & input(39 downto 32));
--i6 <= signed('0' & input(31 downto 24));
--i7 <= signed('0' & input(23 downto 16));
--i8 <= signed('0' & input(15 downto 8));
--i9 <= signed('0' & input(7 downto 0));
i1 <= signed("000000000" & input(71 downto 64));
i2 <= signed("000000000" & input(63 downto 56)); 
i3 <= signed("000000000" & input(55 downto 48));
i4 <= signed("000000000" & input(47 downto 40));
i5 <= signed("000000000" & input(39 downto 32));
i6 <= signed("000000000" & input(31 downto 24));
i7 <= signed("000000000" & input(23 downto 16));
i8 <= signed("000000000" & input(15 downto 8));
i9 <= signed("000000000" & input(7 downto 0));

r1 <= i1*w1;
r2 <= i2*w2;
r3 <= i3*w3;
r4 <= i4*w4;
r5 <= i5*w5;
r6 <= i6*w6;
r7 <= i7*w7;
r8 <= i8*w8;
r9 <= i9*w9;
res <= r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8 + r9;

s_scale <= signed('0' & scale);


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

process(input,current_accum, current_shift)
begin
    next_accum <= (signed('0' & scale)*(w1*signed("000000000"  & input(71 downto 64)) + w2*signed("000000000"  & input(63 downto 56)) + w3*signed("000000000"  & input(55 downto 48)) +
            w4*signed("000000000"  & input(47 downto 40)) + w5*signed("000000000"  & input(39 downto 32)) + w6*signed("000000000"  & input(31 downto 24)) +
            w7*signed("000000000"  & input(23 downto 16)) + w8*signed("000000000"  & input(15 downto 8)) + w9*signed("000000000"  & input(7 downto 0)) + bias)); 
--    next_accum <= (signed('0' & scale)*(w1*signed('0' & input(71 downto 64)) + w2*signed('0' & input(63 downto 56)) + w3*signed('0' & input(55 downto 48)) +
--            w4*signed('0' & input(47 downto 40)) + w5*signed('0' & input(39 downto 32)) + w6*signed('0' & input(31 downto 24)) +
--            w7*signed('0' & input(23 downto 16)) + w8*signed('0' & input(15 downto 8)) + w9*signed('0' & input(7 downto 0)) + bias)); 
--    next_accum <= (signed(scale)*(w1*signed(input(71 downto 64)) + w2*signed(input(63 downto 56)) + w3*signed(input(55 downto 48)) +
--            w4*signed(input(47 downto 40)) + w5*signed(input(39 downto 32)) + w6*signed(input(31 downto 24)) +
--            w7*signed(input(23 downto 16)) + w8*signed(input(15 downto 8)) + w9*signed(input(7 downto 0)) + bias));     
--    next_accum <= (s_scale*(w1*i1 + w2*i2 + w3*i3 +
--            w4*i4 + w5*i5 + w6*i6 +
--            w7*i7 + w8*i8 + w9*i9 + bias));      
--    next_accum <= (s_scale*(r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8 + r9 + bias)); 
--    next_accum <= (s_scale*(res + bias)); 
    next_shift <= current_accum(63 downto 32);
    
    if current_shift < 0 then
        next_output <= (others => '0');
    elsif current_shift > 127 then
        next_output <= "01111111";
    else
        next_output <= std_logic_vector(current_shift(7 downto 0));
    end if;
end process;
output <= current_output;
end Behavioral;
