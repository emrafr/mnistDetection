library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity multiply is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        input : in std_logic_vector(159 downto 0);
        weights : in std_logic_vector(159 downto 0);
        valid_output : in std_logic;
        accum : in signed(31 downto 0);
        accum_out : out signed(31 downto 0)
    );
end multiply;

architecture Behavioral of multiply is

signal current_accum_out, next_accum_out, r1, r2 : signed(31 downto 0);
--signal current_accum, next_accum : signed(31 downto 0);
signal a1_current, a2_current, a1_next, a2_next : signed(20 downto 0);
signal m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20 : signed(20 downto 0);
signal m11_current, m12_current, m13_current, m14_current, m15_current, m16_current, m17_current, m18_current, m19_current, m20_current : signed(20 downto 0);
signal m1_current, m2_current, m3_current, m4_current, m5_current, m6_current, m7_current, m8_current, m9_current, m10_current : signed(20 downto 0);
begin

process(clk,reset)
begin
     if reset = '0'then
            --current_accum <= (others => '0');
            current_accum_out <= (others =>'0');
            m1_current <= (others => '1');
            m2_current <= (others => '0');
            m3_current <= (others => '0');
            m4_current <= (others => '0');
            m5_current <= (others => '0');
            m6_current <= (others => '0');
            m7_current <= (others => '0');
            m8_current <= (others => '0');
            m9_current <= (others => '0');
            m10_current <= (others => '0');
            m11_current <= (others => '0');
            m12_current <= (others => '0');
            m13_current <= (others => '0');
            m14_current <= (others => '0');
            m15_current <= (others => '0');
            m16_current <= (others => '0');
            m17_current <= (others => '0');
            m18_current <= (others => '0');
            m19_current <= (others => '0');
            m20_current <= (others => '0');
            --r1 <= (others => '0');
            --r2 <= (others => '0');
            a1_current <= (others => '0');
            a2_current <= (others => '0');
        elsif rising_edge(clk) then
            --current_accum <= next_accum;
            current_accum_out <= next_accum_out;
            --r1 <= current_accum_out;
            --r2 <= r1;
            a1_current <= a1_next;
            a2_current <= a2_next;
            m1_current <= m1;
            m2_current <= m2;
            m3_current <= m3;
            m4_current <= m4;
            m5_current <= m5;
            m6_current <= m6;
            m7_current <= m7;
            m8_current <= m8;
            m9_current <= m9;
            m10_current <= m10;
            m11_current <= m11;
            m12_current <= m12;
            m13_current <= m13;
            m14_current <= m14;
            m15_current <= m15;
            m16_current <= m16;
            m17_current <= m17;
            m18_current <= m18;
            m19_current <= m19;
            m20_current <= m20;
        end if;
end process;

process(accum, weights, input, valid_input, valid_output, current_accum_out, a1_current, a2_current, m1_current, m2_current, m3_current, m4_current, m5_current, m6_current, m7_current, m8_current, m9_current, m10_current, m11_current, m12_current, m13_current, m14_current, m15_current, m16_current, m17_current, m18_current, m19_current, m20_current)
begin
    if(valid_output = '1') then
        next_accum_out <= (others => '0');
        m1 <= m1_current;
        m2 <= m2_current;
        m3 <= m3_current;
        m4 <= m4_current;
        m5 <= m5_current;
        m6 <= m6_current;
        m7 <= m7_current;
        m8 <= m8_current;
        m9 <= m9_current;
        m10 <= m10_current;
        m11 <= m11_current;
        m12 <= m12_current;
        m13 <= m13_current;
        m14 <= m14_current;
        m15 <= m15_current;
        m16 <= m16_current;
        m17 <= m17_current;
        m18 <= m18_current;
        m19 <= m19_current;
        m20 <= m20_current;
        a1_next <= a1_current;
        a2_next <= a2_current;
    else
        if(valid_input = '1') then
            m1 <= signed(weights(159 downto 152)) * signed("00000" & input(159 downto 152));
            m2 <= signed(weights(151 downto 144)) * signed("00000" & input(151 downto 144));
            m3 <= signed(weights(143 downto 136)) * signed("00000" & input(143 downto 136));
            m4 <= signed(weights(135 downto 128)) * signed("00000" & input(135 downto 128));
            m5 <= signed(weights(127 downto 120)) * signed("00000" & input(127 downto 120));
            m6 <= signed(weights(119 downto 112)) * signed("00000" & input(119 downto 112));
            m7 <= signed(weights(111 downto 104)) * signed("00000" & input(111 downto 104));
            m8 <= signed(weights(103 downto 96)) * signed("00000" & input(103 downto 96));
            m9 <= signed(weights(95 downto 88)) * signed("00000" & input(95 downto 88));
            m10 <= signed(weights(87 downto 80)) * signed("00000" & input(87 downto 80));
            m11 <= signed(weights(79 downto 72)) * signed("00000" & input(79 downto 72));
            m12 <= signed(weights(71 downto 64)) * signed("00000" & input(71 downto 64));
            m13 <= signed(weights(63 downto 56)) * signed("00000" & input(63 downto 56));
            m14 <= signed(weights(55 downto 48)) * signed("00000" & input(55 downto 48));
            m15 <= signed(weights(47 downto 40)) * signed("00000" & input(47 downto 40));
            m16 <= signed(weights(39 downto 32)) * signed("00000" & input(39 downto 32));
            m17 <= signed(weights(31 downto 24)) * signed("00000" & input(31 downto 24));
            m18 <= signed(weights(23 downto 16)) * signed("00000" & input(23 downto 16));
            m19 <= signed(weights(15 downto 8)) * signed("00000" & input(15 downto 8));
            m20 <= signed(weights(7 downto 0)) * signed("00000" & input(7 downto 0));
            a1_next <=  m1_current + m2_current + m3_current + m4_current + m5_current + m6_current + m7_current + m8_current + m9_current + m10_current;
            a2_next <= m11_current + m12_current + m13_current + m14_current + m15_current + m16_current + m17_current + m18_current + m19_current + m20_current;
            next_accum_out <= accum + a1_current + a2_current;
        else
            next_accum_out <= current_accum_out;
            m1 <= m1_current;
            m2 <= m2_current;
            m3 <= m3_current;
            m4 <= m4_current;
            m5 <= m5_current;
            m6 <= m6_current;
            m7 <= m7_current;
            m8 <= m8_current;
            m9 <= m9_current;
            m10 <= m10_current;
            m11 <= m11_current;
            m12 <= m12_current;
            m13 <= m13_current;
            m14 <= m14_current;
            m15 <= m15_current;
            m16 <= m16_current;
            m17 <= m17_current;
            m18 <= m18_current;
            m19 <= m19_current;
            m20 <= m20_current;
            a1_next <= a1_current;
            a2_next <= a2_current;
        end if;
    end if;
end process;
--accum_out <= r2;
accum_out <= current_accum_out;

end Behavioral;

