----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2024 12:51:00 PM
-- Design Name: 
-- Module Name: maxpool_top - Behavioral
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


entity maxpool_top is
  Port (
    clk : in std_logic;
    reset : in std_logic;
    rows1  : in std_logic_vector(415 downto 0);
    rows2  : in std_logic_vector(415 downto 0);
    rows3  : in std_logic_vector(415 downto 0);
    rows4  : in std_logic_vector(415 downto 0);
    rows5  : in std_logic_vector(415 downto 0);
    rows6  : in std_logic_vector(415 downto 0);
    rows7  : in std_logic_vector(415 downto 0);
    rows8  : in std_logic_vector(415 downto 0);
    rows9  : in std_logic_vector(415 downto 0);
    rows10 : in std_logic_vector(415 downto 0);
    rows11 : in std_logic_vector(415 downto 0);
    rows12 : in std_logic_vector(415 downto 0);
    rows13 : in std_logic_vector(415 downto 0);
    rows14 : in std_logic_vector(415 downto 0);
    rows15 : in std_logic_vector(415 downto 0);
    rows16 : in std_logic_vector(415 downto 0);
    rows17 : in std_logic_vector(415 downto 0);
    rows18 : in std_logic_vector(415 downto 0);
    rows19 : in std_logic_vector(415 downto 0);
    rows20 : in std_logic_vector(415 downto 0);
    rows21 : in std_logic_vector(415 downto 0);
    rows22 : in std_logic_vector(415 downto 0);
    rows23 : in std_logic_vector(415 downto 0);
    rows24 : in std_logic_vector(415 downto 0);
    rows25 : in std_logic_vector(415 downto 0);
    rows26 : in std_logic_vector(415 downto 0);
    rows27 : in std_logic_vector(415 downto 0);
    rows28 : in std_logic_vector(415 downto 0);
    rows29 : in std_logic_vector(415 downto 0);
    rows30 : in std_logic_vector(415 downto 0);
    rows31 : in std_logic_vector(415 downto 0);
    rows32 : in std_logic_vector(415 downto 0);
    valid_rows1 : in std_logic;
    valid_rows2 : in std_logic;
    valid_rows3 : in std_logic;
    valid_rows4 : in std_logic;
    valid_rows5 : in std_logic;
    valid_rows6 : in std_logic;
    valid_rows7 : in std_logic;
    valid_rows8 : in std_logic;
    mp_ready : out std_logic;
    mp_output : out std_logic_vector(255 downto 0);
    valid_output : out std_logic
   );
end maxpool_top;

architecture Behavioral of maxpool_top is

	component maxpool is
    port(
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        mp_input : in std_logic_vector(415 downto 0);
        mp_output : out std_logic_vector(7 downto 0);
        ready : out std_logic;
        valid_output : out  std_logic
    );
    end component;

signal mp_output1, mp_output2, mp_output3, mp_output4 : std_logic_vector(7 downto 0);
signal mp_output5, mp_output6, mp_output7, mp_output8 : std_logic_vector(7 downto 0);
signal mp_output9, mp_output10, mp_output11, mp_output12 : std_logic_vector(7 downto 0);
signal mp_output13, mp_output14, mp_output15, mp_output16 : std_logic_vector(7 downto 0);
signal mp_output17, mp_output18, mp_output19, mp_output20 : std_logic_vector(7 downto 0);
signal mp_output21, mp_output22, mp_output23, mp_output24 : std_logic_vector(7 downto 0);
signal mp_output25, mp_output26, mp_output27, mp_output28 : std_logic_vector(7 downto 0);
signal mp_output29, mp_output30, mp_output31, mp_output32 : std_logic_vector(7 downto 0);

signal valid_output1, valid_output2, valid_output3, valid_output4 :     std_logic;
signal valid_output5, valid_output6, valid_output7, valid_output8 :     std_logic;
signal valid_output9, valid_output10, valid_output11, valid_output12 :  std_logic;
signal valid_output13, valid_output14, valid_output15, valid_output16 : std_logic;
signal valid_output17, valid_output18, valid_output19, valid_output20 : std_logic;
signal valid_output21, valid_output22, valid_output23, valid_output24 : std_logic;
signal valid_output25, valid_output26, valid_output27, valid_output28 : std_logic;
signal valid_output29, valid_output30, valid_output31, valid_output32 : std_logic;

signal mp_ready1, mp_ready2, mp_ready3, mp_ready4 :     std_logic;
signal mp_ready5, mp_ready6, mp_ready7, mp_ready8 :     std_logic;
signal mp_ready9, mp_ready10, mp_ready11, mp_ready12 :  std_logic;
signal mp_ready13, mp_ready14, mp_ready15, mp_ready16 : std_logic;
signal mp_ready17, mp_ready18, mp_ready19, mp_ready20 : std_logic;
signal mp_ready21, mp_ready22, mp_ready23, mp_ready24 : std_logic;
signal mp_ready25, mp_ready26, mp_ready27, mp_ready28 : std_logic;
signal mp_ready29, mp_ready30, mp_ready31, mp_ready32 : std_logic;

begin

mp_ready <= '1' when mp_ready1 = '1' and mp_ready2 = '1' and mp_ready3 = '1' and mp_ready4 = '1' and
            mp_ready5 = '1'  and mp_ready6 = '1'  and mp_ready7 = '1'  and mp_ready8 = '1'  and
            mp_ready9 = '1'  and mp_ready10 = '1' and mp_ready11 = '1' and mp_ready12 = '1' and
            mp_ready13 = '1' and mp_ready14 = '1' and mp_ready15 = '1' and mp_ready16 = '1' and
            mp_ready17 = '1' and mp_ready18 = '1' and mp_ready19 = '1' and mp_ready20 = '1' and
            mp_ready21 = '1' and mp_ready22 = '1' and mp_ready23 = '1' and mp_ready24 = '1' and
            mp_ready25 = '1' and mp_ready26 = '1' and mp_ready27 = '1' and mp_ready28 = '1' and
            mp_ready29 = '1' and mp_ready30 = '1' and mp_ready31 = '1' and mp_ready32 = '1' else '0';
            
valid_output <= '1' when valid_output1 = '1' and valid_output2 = '1' and valid_output3 = '1' and valid_output4 = '1' and
            valid_output5 = '1'  and valid_output6 = '1'  and valid_output7 = '1'  and valid_output8 = '1'  and
            valid_output9 = '1'  and valid_output10 = '1' and valid_output11 = '1' and valid_output12 = '1' and
            valid_output13 = '1' and valid_output14 = '1' and valid_output15 = '1' and valid_output16 = '1' and
            valid_output17 = '1' and valid_output18 = '1' and valid_output19 = '1' and valid_output20 = '1' and
            valid_output21 = '1' and valid_output22 = '1' and valid_output23 = '1' and valid_output24 = '1' and
            valid_output25 = '1' and valid_output26 = '1' and valid_output27 = '1' and valid_output28 = '1' and
            valid_output29 = '1' and valid_output30 = '1' and valid_output31 = '1' and valid_output32 = '1' else '0';

mp_output <= mp_output1 & mp_output2 & mp_output3 & mp_output4 &
            mp_output5 & mp_output6 & mp_output7 & mp_output8 &
            mp_output9 & mp_output10 & mp_output11 & mp_output12 &
            mp_output13 & mp_output14 & mp_output15 & mp_output16 &
            mp_output17 & mp_output18 & mp_output19 & mp_output20 &
            mp_output21 & mp_output22 & mp_output23 & mp_output24 &
            mp_output25 & mp_output26 & mp_output27 & mp_output28 &
            mp_output29 & mp_output30 & mp_output31 & mp_output32;


maxpool_inst1 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows1,
	mp_input => rows1,
	mp_output => mp_output1,
	ready => mp_ready1,
	valid_output => valid_output1
);

maxpool_inst2 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows1,
	mp_input => rows2,
	mp_output => mp_output2,
	ready => mp_ready2,
	valid_output => valid_output2
);

maxpool_inst3 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows1,
	mp_input => rows3,
	mp_output => mp_output3,
	ready => mp_ready3,
	valid_output => valid_output3
);

maxpool_inst4 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows1,
	mp_input => rows4,
	mp_output => mp_output4,
	ready => mp_ready4,
	valid_output => valid_output4
);

maxpool_inst5 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows2,
	mp_input => rows5,
	mp_output => mp_output5,
	ready => mp_ready5,
	valid_output => valid_output5
);

maxpool_inst6 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows2,
	mp_input => rows6,
	mp_output => mp_output6,
	ready => mp_ready6,
	valid_output => valid_output6
);

maxpool_inst7 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows2,
	mp_input => rows7,
	mp_output => mp_output7,
	ready => mp_ready7,
	valid_output => valid_output7
);

maxpool_inst8 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows2,
	mp_input => rows8,
	mp_output => mp_output8,
	ready => mp_ready8,
	valid_output => valid_output8
);

maxpool_inst9 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows3,
	mp_input => rows9,
	mp_output => mp_output9,
	ready => mp_ready9,
	valid_output => valid_output9
);

maxpool_inst10 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows3,
	mp_input => rows10,
	mp_output => mp_output10,
	ready => mp_ready10,
	valid_output => valid_output10
);

maxpool_inst11 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows3,
	mp_input => rows11,
	mp_output => mp_output11,
	ready => mp_ready11,
	valid_output => valid_output11
);

maxpool_inst12 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows3,
	mp_input => rows12,
	mp_output => mp_output12,
	ready => mp_ready12,
	valid_output => valid_output12
);

maxpool_inst13 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows4,
	mp_input => rows13,
	mp_output => mp_output13,
	ready => mp_ready13,
	valid_output => valid_output13
);

maxpool_inst14 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows4,
	mp_input => rows14,
	mp_output => mp_output14,
	ready => mp_ready14,
	valid_output => valid_output14
);

maxpool_inst15 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows4,
	mp_input => rows15,
	mp_output => mp_output15,
	ready => mp_ready15,
	valid_output => valid_output15
);

maxpool_inst16 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows4,
	mp_input => rows16,
	mp_output => mp_output16,
	ready => mp_ready16,
	valid_output => valid_output16
);

maxpool_inst17 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows5,
	mp_input => rows17,
	mp_output => mp_output17,
	ready => mp_ready17,
	valid_output => valid_output17
);

maxpool_inst18 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows5,
	mp_input => rows18,
	mp_output => mp_output18,
	ready => mp_ready18,
	valid_output => valid_output18
);

maxpool_inst19 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows5,
	mp_input => rows19,
	mp_output => mp_output19,
	ready => mp_ready19,
	valid_output => valid_output19
);

maxpool_inst20 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows5,
	mp_input => rows20,
	mp_output => mp_output20,
	ready => mp_ready20,
	valid_output => valid_output20
);

maxpool_inst21 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows6,
	mp_input => rows21,
	mp_output => mp_output21,
	ready => mp_ready21,
	valid_output => valid_output21
);

maxpool_inst22 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows6,
	mp_input => rows22,
	mp_output => mp_output22,
	ready => mp_ready22,
	valid_output => valid_output22
);

maxpool_inst23 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows6,
	mp_input => rows23,
	mp_output => mp_output23,
	ready => mp_ready23,
	valid_output => valid_output23
);

maxpool_inst24 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows6,
	mp_input => rows24,
	mp_output => mp_output24,
	ready => mp_ready24,
	valid_output => valid_output24
);

maxpool_inst25 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows7,
	mp_input => rows25,
	mp_output => mp_output25,
	ready => mp_ready25,
	valid_output => valid_output25
);

maxpool_inst26 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows7,
	mp_input => rows26,
	mp_output => mp_output26,
	ready => mp_ready26,
	valid_output => valid_output26
);

maxpool_inst27 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows7,
	mp_input => rows27,
	mp_output => mp_output27,
	ready => mp_ready27,
	valid_output => valid_output27
);

maxpool_inst28 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows7,
	mp_input => rows28,
	mp_output => mp_output28,
	ready => mp_ready28,
	valid_output => valid_output28
);

maxpool_inst29 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows8,
	mp_input => rows29,
	mp_output => mp_output29,
	ready => mp_ready29,
	valid_output => valid_output29
);

maxpool_inst30 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows8,
	mp_input => rows30,
	mp_output => mp_output30,
	ready => mp_ready30,
	valid_output => valid_output30
);

maxpool_inst31 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows8,
	mp_input => rows31,
	mp_output => mp_output31,
	ready => mp_ready31,
	valid_output => valid_output31
);

maxpool_inst32 : maxpool
port map(
	clk => clk,
	reset => reset,
	valid_input => valid_rows8,
	mp_input => rows32,
	mp_output => mp_output32,
	ready => mp_ready32,
	valid_output => valid_output32
);


end Behavioral;
