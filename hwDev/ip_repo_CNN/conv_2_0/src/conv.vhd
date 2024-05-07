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
        conv_input : in std_logic_vector(223 downto 0);
        ready : out std_logic;
        valid_output : out  std_logic;
        conv_output : out std_logic_vector(7 downto 0)        
    );
end conv; 

architecture Behavioral of conv is
component kernel_multiplier is
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
end component;
type state_type is (s_idle, s_2);
signal current_input_r1, next_input_r1, current_input_r2, next_input_r2, current_input_r3, next_input_r3 : std_logic_vector(223 downto 0);
signal input_kernel : unsigned(71 downto 0);
signal output_k1 : std_logic_vector(7 downto 0);
signal next_output_reg, current_output_reg : std_logic_vector(7 downto 0);
signal current_counter, next_counter : unsigned(4 downto 0);
signal current_input_counter, next_input_counter : unsigned(1 downto 0);
signal current_state, next_state : state_type;

begin

kernel_1 : kernel_multiplier
generic map(
    w1 => TO_SIGNED(85, 8), 
    w2 => TO_SIGNED(107, 8),   
    w3 => TO_SIGNED(-34, 8),  
    w4 => TO_SIGNED(-33, 8),  
    w5 => TO_SIGNED(-16, 8),  
    w6 => TO_SIGNED(-1, 8),  
    w7 => TO_SIGNED(-54, 8),  
    w8 => TO_SIGNED(-32, 8),  
    w9 => TO_SIGNED(127, 8),  
    scale => TO_UNSIGNED(11965621, 32), 
    bias => TO_SIGNED(-26468, 32) 
)
port map(
    clk => clk,
    reset => reset,
    input => input_kernel,
    output => output_k1
);

process(clk,reset)
begin
    if reset = '0' then
        current_input_r1 <= (others => '0');
        current_input_r2 <= (others => '0');
        current_input_r3 <= (others => '0');
        current_output_reg <= (others => '0');
        current_counter <= (others => '0');
        current_input_counter <= (others => '0');
        current_state <= s_idle;
    elsif rising_edge(clk) then
        current_input_r1 <= next_input_r1;
        current_input_r2 <= next_input_r2;
        current_input_r3 <= next_input_r3;
        current_output_reg <= next_output_reg;
        current_counter <= next_counter;
        current_input_counter <= next_input_counter;
        current_state <= next_state;
    end if;
end process;

fsm : process(valid_input, current_state, current_output_reg, conv_input, current_input_r1, current_input_r2, current_input_r3)
begin
case current_state is
    when s_idle =>
        next_counter <= current_counter;
        valid_output <= '0';
        if valid_input = '1' then
            next_input_r3 <= conv_input;
            next_input_r2 <= current_input_r3;
            next_input_r1 <= current_input_r2;
            if current_input_counter < 2 then
                next_state <= s_idle;
                next_input_counter <= current_input_counter + 1;
                ready <= '1';
            else
                next_input_counter <= current_input_counter;
                next_state <= s_2;
                ready <= '0';

            end if;
        else
            next_input_r1 <= current_input_r1;
            next_input_r2 <= current_input_r2;
            next_input_r3 <= current_input_r3;
            next_input_counter <= current_input_counter;
            next_state <= s_idle;
            ready <= '1';
        end if;
    when s_2 =>
        next_input_counter <= current_input_counter;
        -- calculate
        input_kernel <= unsigned(current_input_r1(223 downto 200) & current_input_r2(223 downto 200) & current_input_r3(223 downto 200));
        next_output_reg <= output_k1;
        conv_output <= current_output_reg;
        valid_output <= '1';
        if current_counter = 25 then   
            next_input_r1 <= current_input_r1(199 downto 0) & current_input_r1(223 downto 200);
            next_input_r2 <= current_input_r2(199 downto 0) & current_input_r2(223 downto 200);
            next_input_r3 <= current_input_r3(199 downto 0) & current_input_r3(223 downto 200);         
            next_counter <= (others => '0');
            
            next_state <= s_idle;
            ready <= '1';
        else
            next_input_r1 <= current_input_r1(215 downto 0) & current_input_r1(223 downto 216);
            next_input_r2 <= current_input_r2(215 downto 0) & current_input_r2(223 downto 216);
            next_input_r3 <= current_input_r3(215 downto 0) & current_input_r3(223 downto 216);
            next_counter <= current_counter + 1;
            next_state <= s_2;
            ready <= '0';
        end if;
end case;
end process;

end Behavioral;