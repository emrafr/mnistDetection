library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity maxpool is
    port(
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        mp_input : in std_logic_vector(415 downto 0); --Two rows input
        mp_output : out std_logic_vector(7 downto 0);
        ready : out std_logic; --added
        valid_output : out  std_logic --added
    );
end maxpool;

architecture Behavioral of maxpool is
    type state_type is (s_idle, s_max);
    signal current_input_r1, current_input_r2, next_input_r1, next_input_r2 : std_logic_vector(207 downto 0);
    signal current_state, next_state : state_type;
    signal current_output, next_output: std_logic_vector(7 downto 0);
    signal output_1 : unsigned(7 downto 0);
    signal current_counter, next_counter : unsigned(3 downto 0);
    
    component max_block is
    Port ( input1 : in unsigned(7 downto 0);
           input2 : in unsigned(7 downto 0);
           input3 : in unsigned(7 downto 0);
           input4 : in unsigned(7 downto 0);
           output : out unsigned(7 downto 0));
    end component;

begin
    max_1 : max_block
    Port map ( input1 => unsigned(current_input_r1(207 downto 200)),
           input2 => unsigned(current_input_r1(199 downto 192)),
           input3 => unsigned(current_input_r2(207 downto 200)),
           input4 => unsigned(current_input_r2(199 downto 192)),
           output => output_1
           );
           
process(clk,reset)
begin
    if reset = '0' then
        current_input_r1 <= (others => '0');
        current_input_r2 <= (others => '0');
        current_state <= s_idle;
        current_counter <= (others => '0');
    elsif rising_edge(clk) then
        current_input_r1 <= next_input_r1;
        current_input_r2 <= next_input_r2;
        current_state <= next_state;
        current_counter <= next_counter;
    end if;
end process;

fsm : process(valid_input, current_state, current_counter)
begin
case current_state is
    when s_idle =>
        ready <= '1';
        valid_output <= '0'; --Add in conv as well
        next_counter <= current_counter;
        if valid_input = '1' then
            next_input_r1 <= mp_input(415 downto 208);
            next_input_r2 <= mp_input(207 downto 0);
            next_state <= s_max;
        else
            next_input_r1 <= current_input_r1;
            next_input_r2 <= current_input_r2;
            next_state <= s_idle;
        end if;
    when s_max =>
        ready <= '0';
--        next_output <= std_logic_vector(output_1);
        next_input_r1 <= current_input_r1(191 downto 0) & current_input_r1(207 downto 192);
        next_input_r2 <= current_input_r2(191 downto 0) & current_input_r2(207 downto 192);
        --mp_output <= current_output;
        valid_output <= '1';
        if current_counter > 11 then            
            next_counter <= (others => '0');
            next_state <= s_idle;
        else
            next_counter <= current_counter + 1;
            next_state <= s_max;
        end if;
end case;
end process;
mp_output <= std_logic_vector(output_1);
end Behavioral;