
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fullyconnected is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        fc_input : in std_logic_vector(159 downto 0);
        fc_weights_1 : in std_logic_vector(159 downto 0);
        fc_weights_2 : in std_logic_vector(159 downto 0);
        fc_weights_3 : in std_logic_vector(159 downto 0);
        fc_weights_4 : in std_logic_vector(159 downto 0);
        fc_weights_5 : in std_logic_vector(159 downto 0);
        fc_weights_6 : in std_logic_vector(159 downto 0);
        fc_weights_7 : in std_logic_vector(159 downto 0);
        fc_weights_8 : in std_logic_vector(159 downto 0);
        fc_weights_9 : in std_logic_vector(159 downto 0);
        fc_weights_10 : in std_logic_vector(159 downto 0);
        valid_output : out std_logic;
        ready : out std_logic;
        fc_output : out std_logic_vector(79 downto 0)
    );
end fullyconnected; 

architecture Behavioral of fullyconnected is
component multiply is
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
end component;

type state_type is (s_idle, s_multiply, s_scale, s_finish);
signal current_input, next_input : std_logic_vector(159 downto 0);
signal current_state, next_state : state_type;
signal current_shift_1, next_shift_1, current_shift_2, next_shift_2, current_shift_3, next_shift_3, current_shift_4, next_shift_4, current_shift_5, next_shift_5, current_shift_6, next_shift_6, current_shift_7, next_shift_7, current_shift_8, next_shift_8, current_shift_9, next_shift_9, current_shift_10, next_shift_10   : signed(63 downto 0);
signal current_counter, next_counter : unsigned(8 downto 0);
signal current_output_1, next_output_1, current_output_2, next_output_2, current_output_3, next_output_3, current_output_4, next_output_4, current_output_5, next_output_5, current_output_6, next_output_6, current_output_7, next_output_7, current_output_8, next_output_8, current_output_9, next_output_9, current_output_10, next_output_10: std_logic_vector(7 downto 0);
signal current_accum_1, next_accum_1, current_accum_2, next_accum_2, current_accum_3, next_accum_3, current_accum_4, next_accum_4, current_accum_5, next_accum_5, current_accum_6, next_accum_6, current_accum_7, next_accum_7, current_accum_8, next_accum_8, current_accum_9, next_accum_9, current_accum_10, next_accum_10 : signed(31 downto 0);
signal current_weights_1, next_weights_1, current_weights_2, next_weights_2, current_weights_3, next_weights_3, current_weights_4, next_weights_4, current_weights_5, next_weights_5, current_weights_6, next_weights_6, current_weights_7, next_weights_7, current_weights_8, next_weights_8, current_weights_9, next_weights_9, current_weights_10, next_weights_10 : std_logic_vector(159 downto 0);
--signal current_valid, next_valid : std_logic;
signal done: std_logic;
constant scale : integer := 1170092;
constant bias1 : integer := -36;
constant bias2 : integer := 2159;
constant bias3 : integer := 219;
constant bias4 : integer := -770;
constant bias5 : integer := -686;
constant bias6 : integer := 406;
constant bias7 : integer := 109;
constant bias8 : integer := 783;
constant bias9 : integer := -1399;
constant bias10 : integer := -255;
signal a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a1_current, a2_current, a3_current, a4_current, a5_current, a6_current, a7_current, a8_current, a9_current, a10_current : signed(31 downto 0);

begin
mult_1 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_1,
    accum => current_accum_1,
    valid_output => done,
    accum_out => next_accum_1
);
mult_2 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_2,
    valid_output => done,
    accum => current_accum_2,
    accum_out => next_accum_2
);
mult_3 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_3,
    valid_output => done,
    accum => current_accum_3,
    accum_out => next_accum_3
);
mult_4 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_4,
    valid_output => done,
    accum => current_accum_4,
    accum_out => next_accum_4
);
mult_5 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_5,
    valid_output => done,
    accum => current_accum_5,
    accum_out => next_accum_5
);
mult_6 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_6,
    valid_output => done,
    accum => current_accum_6,
    accum_out => next_accum_6
);
mult_7 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_7,
    valid_output => done,
    accum => current_accum_7,
    accum_out => next_accum_7
);
mult_8 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_8,
    valid_output => done,
    accum => current_accum_8,
    accum_out => next_accum_8
);
mult_9 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_9,
    valid_output => done,
    accum => current_accum_9,
    accum_out => next_accum_9
);
mult_10 : multiply
port map(
	clk => clk,
    reset => reset,
    valid_input => valid_input,
    input => current_input,
    weights => current_weights_10,
    valid_output => done,
    accum => current_accum_10,
    accum_out => next_accum_10
);

process(clk,reset)
begin
    if reset = '0' then
        current_state <= s_idle;
        current_input <= (others=>'0');
        current_shift_1 <= (others=>'0');
        current_shift_2 <= (others=>'0');
        current_shift_3 <= (others=>'0');
        current_shift_4 <= (others=>'0');
        current_shift_5 <= (others=>'0');
        current_shift_6 <= (others=>'0');
        current_shift_7 <= (others=>'0');
        current_shift_8 <= (others=>'0');
        current_shift_9 <= (others=>'0');
        current_shift_10 <= (others=>'0');
        current_counter <= (others=>'0');
        current_accum_1 <= (others =>'0');
        current_accum_2 <= (others =>'0');
        current_accum_3 <= (others =>'0');
        current_accum_4 <= (others =>'0');
        current_accum_5 <= (others =>'0');
        current_accum_6 <= (others =>'0');
        current_accum_7 <= (others =>'0');
        current_accum_8 <= (others =>'0');
        current_accum_9 <= (others =>'0');
        current_accum_10 <= (others =>'0');
        current_weights_1 <= (others => '0');
        current_weights_2 <= (others => '0');
        current_weights_3 <= (others => '0');
        current_weights_4 <= (others => '0');
        current_weights_5 <= (others => '0');
        current_weights_6 <= (others => '0');
        current_weights_7 <= (others => '0');
        current_weights_8 <= (others => '0');
        current_weights_9 <= (others => '0');
        current_weights_10 <= (others => '0');
        current_output_1 <= (others=>'0');
        current_output_2 <= (others=>'0');
        current_output_3 <= (others=>'0');
        current_output_4 <= (others=>'0');
        current_output_5 <= (others=>'0');
        current_output_6 <= (others=>'0');
        current_output_7 <= (others=>'0');
        current_output_8 <= (others=>'0');
        current_output_9 <= (others=>'0');
        current_output_10 <= (others=>'0');
        a1_current <= (others => '0');
        a2_current <= (others => '0');
        a3_current <= (others => '0');
        a4_current <= (others => '0');
        a5_current <= (others => '0');
        a6_current <= (others => '0');
        a7_current <= (others => '0');
        a8_current <= (others => '0');
        a9_current <= (others => '0');
        a10_current <= (others => '0');
        --current_valid <= '0';
    elsif rising_edge(clk) then
        current_state <= next_state;
        current_input <= next_input;
        current_shift_1 <= next_shift_1;
        current_shift_2 <= next_shift_2;
        current_shift_3 <= next_shift_3;
        current_shift_4 <= next_shift_4;
        current_shift_5 <= next_shift_5;
        current_shift_6 <= next_shift_6;
        current_shift_7 <= next_shift_7;
        current_shift_8 <= next_shift_8;
        current_shift_9 <= next_shift_9;
        current_shift_10 <= next_shift_10;
        current_counter <= next_counter;
        current_accum_1 <= next_accum_1;
        current_accum_2 <= next_accum_2;
        current_accum_3 <= next_accum_3;
        current_accum_4 <= next_accum_4;
        current_accum_5 <= next_accum_5;
        current_accum_6 <= next_accum_6;
        current_accum_7 <= next_accum_7;
        current_accum_8 <= next_accum_8;
        current_accum_9 <= next_accum_9;
        current_accum_10 <= next_accum_10;
        current_weights_1 <= next_weights_1;
        current_weights_2 <= next_weights_2;
        current_weights_3 <= next_weights_3;
        current_weights_4 <= next_weights_4;
        current_weights_5 <= next_weights_5;
        current_weights_6 <= next_weights_6;
        current_weights_7 <= next_weights_7;
        current_weights_8 <= next_weights_8;
        current_weights_9 <= next_weights_9;
        current_weights_10 <= next_weights_10;
        current_output_1 <= next_output_1;
        current_output_2 <= next_output_2;
        current_output_3 <= next_output_3;
        current_output_4 <= next_output_4;
        current_output_5 <= next_output_5;
        current_output_6 <= next_output_6;
        current_output_7 <= next_output_7;
        current_output_8 <= next_output_8;
        current_output_9 <= next_output_9;
        current_output_10 <= next_output_10;
        --current_valid <= next_valid;
        a1_current <= a1;
        a2_current <= a2;
        a3_current <= a3;
        a4_current <= a4;
        a5_current <= a5;
        a6_current <= a6;
        a7_current <= a7;
        a8_current <= a8;
        a9_current <= a9;
        a10_current <= a10;
    end if;
end process;

fsm : process(current_state, current_counter, valid_input, fc_input, fc_weights_1, fc_weights_2, fc_weights_3, fc_weights_4, fc_weights_5, fc_weights_6, fc_weights_7, fc_weights_8, fc_weights_9, fc_weights_10, current_input, current_weights_1, current_weights_2, current_weights_3, current_weights_4, current_weights_5, current_weights_6, current_weights_7, current_weights_8, current_weights_9, current_weights_10, current_accum_1, current_accum_2, current_accum_3, current_accum_4, current_accum_5, current_accum_6, current_accum_7, current_accum_8, current_accum_9, current_accum_10, current_shift_1, current_shift_2, current_shift_2, current_shift_3, current_shift_4, current_shift_5, current_shift_6, current_shift_7, current_shift_8, current_shift_9, current_shift_10, current_output_1, current_output_2, current_output_3, current_output_4, current_output_5, current_output_6, current_output_7, current_output_8, current_output_9, current_output_10, a1_current, a2_current, a3_current, a4_current, a5_current, a6_current, a7_current, a8_current, a9_current, a10_current)
begin
next_output_1 <= current_output_1;
next_output_2 <= current_output_2;
next_output_3 <= current_output_3;
next_output_4 <= current_output_4;
next_output_5 <= current_output_5;
next_output_6 <= current_output_6;
next_output_7 <= current_output_7;
next_output_8 <= current_output_8;
next_output_9 <= current_output_9;
next_output_10 <= current_output_10;
next_shift_1 <= current_shift_1;
next_shift_2 <= current_shift_2;
next_shift_3 <= current_shift_3;
next_shift_4 <= current_shift_4;
next_shift_5 <= current_shift_5;
next_shift_6 <= current_shift_6;
next_shift_7 <= current_shift_7;
next_shift_8 <= current_shift_8;
next_shift_9 <= current_shift_9;
next_shift_10 <= current_shift_10;
--next_accum_1 <= current_accum_1;
--next_accum_2 <= current_accum_2;
--next_accum_3 <= current_accum_3;
--next_accum_4 <= current_accum_4;
--next_accum_5 <= current_accum_5;
--next_accum_6 <= current_accum_6;
--next_accum_7 <= current_accum_7;
--next_accum_8 <= current_accum_8;
--next_accum_9 <= current_accum_9;
--next_accum_10 <= current_accum_10;
next_weights_1 <= current_weights_1;
next_weights_2 <= current_weights_2;
next_weights_3 <= current_weights_3;
next_weights_4 <= current_weights_4;
next_weights_5 <= current_weights_5;
next_weights_6 <= current_weights_6;
next_weights_7 <= current_weights_7;
next_weights_8 <= current_weights_8;
next_weights_9 <= current_weights_9;
next_weights_10 <= current_weights_10;
next_input <= current_input;
a1 <= a1_current;
a2 <= a2_current;
a3 <= a3_current;
a4 <= a4_current;
a5 <= a5_current;
a6 <= a6_current;
a7 <= a7_current;
a8 <= a8_current;
a9 <= a9_current;
a10 <= a10_current;
case current_state is
    when s_idle =>
    done <= '0';
        if current_counter = 271 then
            valid_output <= '1';
            next_counter <= (others=>'0');
        else
            valid_output <= '0';
            next_counter <= current_counter;
       end if;
        --next_output_1 <= current_output_1;
        --next_shift_1 <= current_shift_1;
        --next_accum_1 <= current_accum_1;
        if valid_input = '1' then
            next_input <= fc_input;
            next_weights_1 <= fc_weights_1;
            next_weights_2 <= fc_weights_2;
            next_weights_3 <= fc_weights_3;
            next_weights_4 <= fc_weights_4;
            next_weights_5 <= fc_weights_5;
            next_weights_6 <= fc_weights_6;
            next_weights_7 <= fc_weights_7;
            next_weights_8 <= fc_weights_8;
            next_weights_9 <= fc_weights_9;
            next_weights_10 <= fc_weights_10;
            next_state <= s_multiply;
            ready <= '0';
        else
            --next_input <= current_input;
            --next_weights_1 <= current_weights_1;
            next_state <= s_idle;
            ready <= '1';
        end if;        
    when s_multiply =>
    next_counter <= current_counter +1;
        valid_output <= '0';
        done <= '0';
      if current_counter = 270 then
            a1 <= (current_accum_1 + bias1);
            a2 <= (current_accum_2 + bias2);
            a3 <= (current_accum_3 + bias3);
            a4 <= (current_accum_4 + bias4);
            a5 <= (current_accum_5 + bias5);
            a6 <= (current_accum_6 + bias6);
            a7 <= (current_accum_7 + bias7);
            a8 <= (current_accum_8 + bias8);
            a9 <= (current_accum_9 + bias9);
            a10 <= (current_accum_10 + bias10);
            next_state <= s_scale;
            ready <= '0';
        else
            next_state <= s_idle;
            ready <= '1';
        end if;
    when s_scale =>
            next_counter <= current_counter;
            valid_output <= '0';
            done <= '0';
            next_shift_1 <= scale* a1_current;
            next_shift_2 <= scale* a2_current;
            next_shift_3 <= scale*a3_current; 
            next_shift_4 <= scale* a4_current;
            next_shift_5 <= scale* a5_current;
            next_shift_6 <= scale* a6_current;
            next_shift_7 <= scale* a7_current;
            next_shift_8 <= scale* a8_current;
            next_shift_9 <= scale* a9_current;
            next_shift_10 <= scale* a10_current;
            next_state <= s_finish; 
            ready <= '0';
    when s_finish =>
        valid_output <= '0';
        done <= '1';
        next_counter <= current_counter;
        --next_input <= current_input;
        --next_weights_1 <= current_weights_1;
        --ready <= '0';
--        next_accum_1 <= (others =>'0');
--        next_accum_2 <= (others =>'0');
--        next_accum_3 <= (others =>'0');
--        next_accum_4 <= (others =>'0');
--        next_accum_5 <= (others =>'0');
--        next_accum_6 <= (others =>'0');
--        next_accum_7 <= (others =>'0');
--        next_accum_8 <= (others =>'0');
--        next_accum_9 <= (others =>'0');
--        next_accum_10 <= (others =>'0');
        if current_shift_1(63 downto 32) < 0 then
            next_output_1 <= (others => '0');
        elsif current_shift_1(63 downto 32) > 127 then
            next_output_1 <= (others => '1');
        else
            next_output_1 <= std_logic_vector(current_shift_1(39 downto 32));
        end if;
        
        if current_shift_2(63 downto 32) < 0 then
            next_output_2 <= (others => '0');
        elsif current_shift_2(63 downto 32) > 127 then
            next_output_2 <= (others => '1');
        else
            next_output_2 <= std_logic_vector(current_shift_2(39 downto 32));
        end if;
        
        if current_shift_3(63 downto 32) < 0 then
            next_output_3 <= (others => '0');
        elsif current_shift_3(63 downto 32) > 127 then
            next_output_3 <= (others => '1');
        else
            next_output_3 <= std_logic_vector(current_shift_3(39 downto 32));
        end if;
        
        if current_shift_4(63 downto 32) < 0 then
            next_output_4 <= (others => '0');
        elsif current_shift_4(63 downto 32) > 127 then
            next_output_4 <= (others => '1');
        else
            next_output_4 <= std_logic_vector(current_shift_4(39 downto 32));
        end if;
        
        if current_shift_5(63 downto 32) < 0 then
            next_output_5 <= (others => '0');
        elsif current_shift_5(63 downto 32) > 127 then
            next_output_5 <= (others => '1');
        else
            next_output_5 <= std_logic_vector(current_shift_5(39 downto 32));
        end if;
        
        if current_shift_6(63 downto 32) < 0 then
            next_output_6 <= (others => '0');
        elsif current_shift_6(63 downto 32) > 127 then
            next_output_6 <= (others => '1');
        else
            next_output_6 <= std_logic_vector(current_shift_6(39 downto 32));
        end if;
        
        if current_shift_7(63 downto 32) < 0 then
            next_output_7 <= (others => '0');
        elsif current_shift_7(63 downto 32) > 127 then
            next_output_7 <= (others => '1');
        else
            next_output_7 <= std_logic_vector(current_shift_7(39 downto 32));
        end if;
        
        if current_shift_8(63 downto 32) < 0 then
            next_output_8 <= (others => '0');
        elsif current_shift_8(63 downto 32) > 127 then
            next_output_8 <= (others => '1');
        else
            next_output_8 <= std_logic_vector(current_shift_8(39 downto 32));
        end if;
        
        if current_shift_9(63 downto 32) < 0 then
            next_output_9 <= (others => '0');
        elsif current_shift_9(63 downto 32) > 127 then
            next_output_9 <= (others => '1');
        else
            next_output_9 <= std_logic_vector(current_shift_9(39 downto 32));
        end if;
        
        if current_shift_10(63 downto 32) < 0 then
            next_output_10 <= (others => '0');
        elsif current_shift_10(63 downto 32) > 127 then
            next_output_10 <= (others => '1');
        else
            next_output_10 <= std_logic_vector(current_shift_10(39 downto 32));
        end if;
        next_state <= s_idle;
        ready <= '1';
end case;
end process;
fc_output <= current_output_1 & current_output_2 & current_output_3 & current_output_4 & current_output_5 & current_output_6 & current_output_7 & current_output_8 & current_output_9 & current_output_10;
--next_valid <= valid_input;
end Behavioral;