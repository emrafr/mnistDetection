
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
        conv_output0 : out std_logic_vector(31 downto 0);        
        conv_output1 : out std_logic_vector(31 downto 0);        
        conv_output2 : out std_logic_vector(31 downto 0);        
        conv_output3 : out std_logic_vector(31 downto 0);        
        conv_output4 : out std_logic_vector(31 downto 0);        
        conv_output5 : out std_logic_vector(31 downto 0);        
        conv_output6 : out std_logic_vector(31 downto 0);        
        conv_output7 : out std_logic_vector(31 downto 0)        
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
signal output_k1, output_k2, output_k3, output_k4, output_k5, output_k6, output_k7, output_k8 : std_logic_vector(7 downto 0);
signal output_k9, output_k10, output_k11, output_k12, output_k13, output_k14, output_k15, output_k16 : std_logic_vector(7 downto 0);
signal output_k17, output_k18, output_k19, output_k20, output_k21, output_k22, output_k23, output_k24 : std_logic_vector(7 downto 0);
signal output_k25, output_k26, output_k27, output_k28, output_k29, output_k30, output_k31, output_k32 : std_logic_vector(7 downto 0);
signal next_output_reg, current_output_reg : std_logic_vector(7 downto 0);
signal current_counter, next_counter : unsigned(4 downto 0);
signal current_input_counter, next_input_counter : unsigned(1 downto 0);
signal current_output_counter, next_output_counter : unsigned(1 downto 0);
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

kernel_2 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(54, 8),
	w2 => TO_SIGNED(7, 8),
	w3 => TO_SIGNED(-106, 8),
	w4 => TO_SIGNED(87, 8),
	w5 => TO_SIGNED(25, 8),
	w6 => TO_SIGNED(-127, 8),
	w7 => TO_SIGNED(83, 8),
	w8 => TO_SIGNED(23, 8),
	w9 => TO_SIGNED(-65, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-1964, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k2
);

kernel_3 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(102, 8),
	w2 => TO_SIGNED(89, 8),
	w3 => TO_SIGNED(2, 8),
	w4 => TO_SIGNED(-127, 8),
	w5 => TO_SIGNED(-8, 8),
	w6 => TO_SIGNED(-79, 8),
	w7 => TO_SIGNED(44, 8),
	w8 => TO_SIGNED(22, 8),
	w9 => TO_SIGNED(110, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-26026, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k3
);

kernel_4 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-127, 8),
	w2 => TO_SIGNED(-54, 8),
	w3 => TO_SIGNED(-32, 8),
	w4 => TO_SIGNED(-7, 8),
	w5 => TO_SIGNED(-17, 8),
	w6 => TO_SIGNED(51, 8),
	w7 => TO_SIGNED(22, 8),
	w8 => TO_SIGNED(48, 8),
	w9 => TO_SIGNED(13, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-14098, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k4
);

kernel_5 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(20, 8),
	w2 => TO_SIGNED(33, 8),
	w3 => TO_SIGNED(61, 8),
	w4 => TO_SIGNED(44, 8),
	w5 => TO_SIGNED(90, 8),
	w6 => TO_SIGNED(49, 8),
	w7 => TO_SIGNED(-111, 8),
	w8 => TO_SIGNED(-124, 8),
	w9 => TO_SIGNED(-127, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-1830, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k5
);

kernel_6 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(92, 8),
	w2 => TO_SIGNED(19, 8),
	w3 => TO_SIGNED(-127, 8),
	w4 => TO_SIGNED(11, 8),
	w5 => TO_SIGNED(107, 8),
	w6 => TO_SIGNED(40, 8),
	w7 => TO_SIGNED(-117, 8),
	w8 => TO_SIGNED(-31, 8),
	w9 => TO_SIGNED(107, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-22515, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k6
);

kernel_7 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(50, 8),
	w2 => TO_SIGNED(67, 8),
	w3 => TO_SIGNED(15, 8),
	w4 => TO_SIGNED(33, 8),
	w5 => TO_SIGNED(38, 8),
	w6 => TO_SIGNED(-63, 8),
	w7 => TO_SIGNED(-93, 8),
	w8 => TO_SIGNED(-103, 8),
	w9 => TO_SIGNED(-127, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-289, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k7
);

kernel_8 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-127, 8),
	w2 => TO_SIGNED(-16, 8),
	w3 => TO_SIGNED(73, 8),
	w4 => TO_SIGNED(-24, 8),
	w5 => TO_SIGNED(44, 8),
	w6 => TO_SIGNED(31, 8),
	w7 => TO_SIGNED(102, 8),
	w8 => TO_SIGNED(-6, 8),
	w9 => TO_SIGNED(-57, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-26262, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k8
);

kernel_9 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-127, 8),
	w2 => TO_SIGNED(-53, 8),
	w3 => TO_SIGNED(38, 8),
	w4 => TO_SIGNED(-77, 8),
	w5 => TO_SIGNED(-29, 8),
	w6 => TO_SIGNED(79, 8),
	w7 => TO_SIGNED(-70, 8),
	w8 => TO_SIGNED(-18, 8),
	w9 => TO_SIGNED(70, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-412, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k9
);

kernel_10 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-104, 8),
	w2 => TO_SIGNED(-60, 8),
	w3 => TO_SIGNED(-11, 8),
	w4 => TO_SIGNED(127, 8),
	w5 => TO_SIGNED(93, 8),
	w6 => TO_SIGNED(-12, 8),
	w7 => TO_SIGNED(-125, 8),
	w8 => TO_SIGNED(-10, 8),
	w9 => TO_SIGNED(-26, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-1208, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k10
);

kernel_11 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(32, 8),
	w2 => TO_SIGNED(101, 8),
	w3 => TO_SIGNED(82, 8),
	w4 => TO_SIGNED(-26, 8),
	w5 => TO_SIGNED(4, 8),
	w6 => TO_SIGNED(1, 8),
	w7 => TO_SIGNED(-115, 8),
	w8 => TO_SIGNED(-127, 8),
	w9 => TO_SIGNED(-67, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-1550, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k11
);

kernel_12 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-120, 8),
	w2 => TO_SIGNED(-55, 8),
	w3 => TO_SIGNED(80, 8),
	w4 => TO_SIGNED(-127, 8),
	w5 => TO_SIGNED(25, 8),
	w6 => TO_SIGNED(93, 8),
	w7 => TO_SIGNED(-82, 8),
	w8 => TO_SIGNED(30, 8),
	w9 => TO_SIGNED(64, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-1468, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k12
);

kernel_13 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-117, 8),
	w2 => TO_SIGNED(-20, 8),
	w3 => TO_SIGNED(59, 8),
	w4 => TO_SIGNED(34, 8),
	w5 => TO_SIGNED(-127, 8),
	w6 => TO_SIGNED(-70, 8),
	w7 => TO_SIGNED(40, 8),
	w8 => TO_SIGNED(58, 8),
	w9 => TO_SIGNED(-63, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(4732, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k13
);

kernel_14 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-5, 8),
	w2 => TO_SIGNED(3, 8),
	w3 => TO_SIGNED(-9, 8),
	w4 => TO_SIGNED(127, 8),
	w5 => TO_SIGNED(79, 8),
	w6 => TO_SIGNED(-36, 8),
	w7 => TO_SIGNED(-117, 8),
	w8 => TO_SIGNED(-56, 8),
	w9 => TO_SIGNED(96, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-16986, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k14
);

kernel_15 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(22, 8),
	w2 => TO_SIGNED(127, 8),
	w3 => TO_SIGNED(-16, 8),
	w4 => TO_SIGNED(92, 8),
	w5 => TO_SIGNED(-101, 8),
	w6 => TO_SIGNED(48, 8),
	w7 => TO_SIGNED(-30, 8),
	w8 => TO_SIGNED(84, 8),
	w9 => TO_SIGNED(107, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-50311, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k15
);

kernel_16 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-26, 8),
	w2 => TO_SIGNED(57, 8),
	w3 => TO_SIGNED(88, 8),
	w4 => TO_SIGNED(-108, 8),
	w5 => TO_SIGNED(2, 8),
	w6 => TO_SIGNED(65, 8),
	w7 => TO_SIGNED(-127, 8),
	w8 => TO_SIGNED(-90, 8),
	w9 => TO_SIGNED(-46, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-25, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k16
);

kernel_17 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(22, 8),
	w2 => TO_SIGNED(72, 8),
	w3 => TO_SIGNED(-37, 8),
	w4 => TO_SIGNED(-75, 8),
	w5 => TO_SIGNED(67, 8),
	w6 => TO_SIGNED(-37, 8),
	w7 => TO_SIGNED(-65, 8),
	w8 => TO_SIGNED(127, 8),
	w9 => TO_SIGNED(-25, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-16080, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k17
);

kernel_18 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(64, 8),
	w2 => TO_SIGNED(52, 8),
	w3 => TO_SIGNED(-80, 8),
	w4 => TO_SIGNED(83, 8),
	w5 => TO_SIGNED(-17, 8),
	w6 => TO_SIGNED(-127, 8),
	w7 => TO_SIGNED(36, 8),
	w8 => TO_SIGNED(-95, 8),
	w9 => TO_SIGNED(-87, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-2319, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k18
);

kernel_19 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-127, 8),
	w2 => TO_SIGNED(-126, 8),
	w3 => TO_SIGNED(-105, 8),
	w4 => TO_SIGNED(32, 8),
	w5 => TO_SIGNED(31, 8),
	w6 => TO_SIGNED(-48, 8),
	w7 => TO_SIGNED(65, 8),
	w8 => TO_SIGNED(78, 8),
	w9 => TO_SIGNED(19, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-468, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k19
);

kernel_20 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(93, 8),
	w2 => TO_SIGNED(-50, 8),
	w3 => TO_SIGNED(-97, 8),
	w4 => TO_SIGNED(-127, 8),
	w5 => TO_SIGNED(-91, 8),
	w6 => TO_SIGNED(27, 8),
	w7 => TO_SIGNED(-19, 8),
	w8 => TO_SIGNED(85, 8),
	w9 => TO_SIGNED(68, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(39, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k20
);

kernel_21 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-25, 8),
	w2 => TO_SIGNED(-89, 8),
	w3 => TO_SIGNED(-127, 8),
	w4 => TO_SIGNED(85, 8),
	w5 => TO_SIGNED(40, 8),
	w6 => TO_SIGNED(-90, 8),
	w7 => TO_SIGNED(63, 8),
	w8 => TO_SIGNED(77, 8),
	w9 => TO_SIGNED(2, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-634, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k21
);

kernel_22 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-127, 8),
	w2 => TO_SIGNED(-17, 8),
	w3 => TO_SIGNED(21, 8),
	w4 => TO_SIGNED(-101, 8),
	w5 => TO_SIGNED(-62, 8),
	w6 => TO_SIGNED(93, 8),
	w7 => TO_SIGNED(-2, 8),
	w8 => TO_SIGNED(-43, 8),
	w9 => TO_SIGNED(16, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-4317, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k22
);

kernel_23 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(73, 8),
	w2 => TO_SIGNED(106, 8),
	w3 => TO_SIGNED(-108, 8),
	w4 => TO_SIGNED(-75, 8),
	w5 => TO_SIGNED(66, 8),
	w6 => TO_SIGNED(-14, 8),
	w7 => TO_SIGNED(-127, 8),
	w8 => TO_SIGNED(51, 8),
	w9 => TO_SIGNED(84, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-15749, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k23
);

kernel_24 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(58, 8),
	w2 => TO_SIGNED(79, 8),
	w3 => TO_SIGNED(66, 8),
	w4 => TO_SIGNED(-47, 8),
	w5 => TO_SIGNED(14, 8),
	w6 => TO_SIGNED(95, 8),
	w7 => TO_SIGNED(-109, 8),
	w8 => TO_SIGNED(-127, 8),
	w9 => TO_SIGNED(-12, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-8896, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k24
);

kernel_25 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-64, 8),
	w2 => TO_SIGNED(112, 8),
	w3 => TO_SIGNED(-31, 8),
	w4 => TO_SIGNED(-60, 8),
	w5 => TO_SIGNED(127, 8),
	w6 => TO_SIGNED(-116, 8),
	w7 => TO_SIGNED(28, 8),
	w8 => TO_SIGNED(94, 8),
	w9 => TO_SIGNED(-81, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-14009, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k25
);

kernel_26 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(124, 8),
	w2 => TO_SIGNED(90, 8),
	w3 => TO_SIGNED(-127, 8),
	w4 => TO_SIGNED(-62, 8),
	w5 => TO_SIGNED(-73, 8),
	w6 => TO_SIGNED(86, 8),
	w7 => TO_SIGNED(-42, 8),
	w8 => TO_SIGNED(81, 8),
	w9 => TO_SIGNED(64, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-21225, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k26
);

kernel_27 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-123, 8),
	w2 => TO_SIGNED(-107, 8),
	w3 => TO_SIGNED(-14, 8),
	w4 => TO_SIGNED(-16, 8),
	w5 => TO_SIGNED(-10, 8),
	w6 => TO_SIGNED(40, 8),
	w7 => TO_SIGNED(127, 8),
	w8 => TO_SIGNED(112, 8),
	w9 => TO_SIGNED(-50, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-551, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k27
);

kernel_28 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-31, 8),
	w2 => TO_SIGNED(60, 8),
	w3 => TO_SIGNED(-73, 8),
	w4 => TO_SIGNED(-75, 8),
	w5 => TO_SIGNED(-127, 8),
	w6 => TO_SIGNED(-68, 8),
	w7 => TO_SIGNED(-19, 8),
	w8 => TO_SIGNED(50, 8),
	w9 => TO_SIGNED(-62, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(9757, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k28
);

kernel_29 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(-5, 8),
	w2 => TO_SIGNED(-17, 8),
	w3 => TO_SIGNED(-113, 8),
	w4 => TO_SIGNED(127, 8),
	w5 => TO_SIGNED(97, 8),
	w6 => TO_SIGNED(103, 8),
	w7 => TO_SIGNED(-14, 8),
	w8 => TO_SIGNED(-57, 8),
	w9 => TO_SIGNED(88, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-49214, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k29
);

kernel_30 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(60, 8),
	w2 => TO_SIGNED(47, 8),
	w3 => TO_SIGNED(-18, 8),
	w4 => TO_SIGNED(-127, 8),
	w5 => TO_SIGNED(-61, 8),
	w6 => TO_SIGNED(68, 8),
	w7 => TO_SIGNED(-7, 8),
	w8 => TO_SIGNED(45, 8),
	w9 => TO_SIGNED(39, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-18987, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k30
);

kernel_31 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(25, 8),
	w2 => TO_SIGNED(-37, 8),
	w3 => TO_SIGNED(73, 8),
	w4 => TO_SIGNED(-127, 8),
	w5 => TO_SIGNED(46, 8),
	w6 => TO_SIGNED(0, 8),
	w7 => TO_SIGNED(55, 8),
	w8 => TO_SIGNED(58, 8),
	w9 => TO_SIGNED(-60, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-16486, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k31
);

kernel_32 : kernel_multiplier
generic map(
	w1 => TO_SIGNED(11, 8),
	w2 => TO_SIGNED(44, 8),
	w3 => TO_SIGNED(26, 8),
	w4 => TO_SIGNED(-11, 8),
	w5 => TO_SIGNED(33, 8),
	w6 => TO_SIGNED(73, 8),
	w7 => TO_SIGNED(-127, 8),
	w8 => TO_SIGNED(-86, 8),
	w9 => TO_SIGNED(-107, 8),
	scale => TO_UNSIGNED(11965621, 32),
	bias => TO_SIGNED(-3402, 32)
)
port map(
	clk => clk,
	reset => reset,
	input => input_kernel,
	output => output_k32
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
        current_output_counter <= (others => '0');
        current_state <= s_idle;
    elsif rising_edge(clk) then
        current_input_r1 <= next_input_r1;
        current_input_r2 <= next_input_r2;
        current_input_r3 <= next_input_r3;
        current_output_reg <= next_output_reg;
        current_counter <= next_counter;
        current_input_counter <= next_input_counter;
        current_output_counter <= next_output_counter;
        current_state <= next_state;
    end if;
end process;

fsm : process(valid_input, current_state, current_output_reg, conv_input, current_input_r1, current_input_r2, current_input_r3, current_counter, current_output_counter)
begin
case current_state is
    when s_idle =>
        next_counter <= current_counter;
        next_output_counter <= current_output_counter; 
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
                ready <= '1';
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
        if current_output_counter < 3 then
            next_output_counter <= current_output_counter + 1;
            valid_output <= '0';
        else
            next_output_counter <= current_output_counter;
            valid_output <= '1';
        end if;
        input_kernel <= unsigned(current_input_r1(223 downto 200) & current_input_r2(223 downto 200) & current_input_r3(223 downto 200));
        next_output_reg <= output_k1;
        
        if current_counter = 28 then   
--            next_input_r1 <= current_input_r1(199 downto 0) & current_input_r1(223 downto 200);
--            next_input_r2 <= current_input_r2(199 downto 0) & current_input_r2(223 downto 200);
--            next_input_r3 <= current_input_r3(199 downto 0) & current_input_r3(223 downto 200);         
            
            next_input_r1 <= current_input_r1;
            next_input_r2 <= current_input_r2;
            next_input_r3 <= current_input_r3;         
            next_counter <= (others => '0');
            next_output_counter <= (others => '0');
            next_state <= s_idle;
            ready <= '0';
        else
            next_counter <= current_counter + 1;
            next_input_r1 <= current_input_r1(215 downto 0) & current_input_r1(223 downto 216);
            next_input_r2 <= current_input_r2(215 downto 0) & current_input_r2(223 downto 216);
            next_input_r3 <= current_input_r3(215 downto 0) & current_input_r3(223 downto 216);
            next_state <= s_2;
            ready <= '0';
        end if;
end case;
end process;
conv_output0 <= output_k1 & output_k2 & output_k3 & output_k4;
conv_output1 <= output_k5 & output_k6 & output_k7 & output_k8;
conv_output2 <= output_k9 & output_k10 & output_k11 & output_k12;
conv_output3 <= output_k13 & output_k14 & output_k15 & output_k16;
conv_output4 <= output_k17 & output_k18 & output_k19 & output_k20;
conv_output5 <= output_k21 & output_k22 & output_k23 & output_k24;
conv_output6 <= output_k25 & output_k26 & output_k27 & output_k28;
conv_output7 <= output_k29 & output_k30 & output_k31 & output_k32;
--conv_output <= current_output_reg;

end Behavioral;