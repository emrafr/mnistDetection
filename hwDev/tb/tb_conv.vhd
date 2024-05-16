library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity tb_conv is
end tb_conv;

architecture structural of tb_conv is

component stimulus_generator is
    generic (
        FILE_NAME: string := "input.txt";
        SAMPLE_WIDTH: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready: in std_logic;
        data_valid : out std_logic;
        stimulus_stream : out std_logic_vector(223 downto 0)
    );
end component;

component conv
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        conv_input : in std_logic_vector(223 downto 0);
        ready : out std_logic;
        valid_output : out  std_logic;
        conv_output : out std_logic_vector(7 downto 0)        
    );
end component;

signal clk, reset, valid_input, ready, valid_output : std_logic;

signal input : std_logic_vector(223 downto 0);
signal output : std_logic_vector(7 downto 0);

constant period : time := 10000 ps;

begin

DUT : conv
    Port map( 
        clk => clk,
        reset => reset,
        valid_input => valid_input,
        conv_input => input,
        ready => ready,
        valid_output => valid_output,
        conv_output => output        
    );

stimuli_gen: stimulus_generator
    generic map (
        FILE_NAME => "/home/emma/input.txt",
        SAMPLE_WIDTH => 224
    )
    port map (
        clk => clk,
        reset => reset,
        ready => ready,
        data_valid => valid_input,
        stimulus_stream => input
);

clk_process : process
begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
end process;

reset <= '0',
         '1' after 1*period;
         
  
end structural;
