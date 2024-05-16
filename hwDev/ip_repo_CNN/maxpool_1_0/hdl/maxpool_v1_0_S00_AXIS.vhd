library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maxpool_v1_0_S00_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
	    mp_ready1 : in std_logic;
	    mp_ready2 : in std_logic;
	    mp_ready3 : in std_logic;
	    mp_ready4 : in std_logic;
		rows1 : out std_logic_vector(415 downto 0);
		rows2 : out std_logic_vector(415 downto 0);
		rows3 : out std_logic_vector(415 downto 0);
		rows4 : out std_logic_vector(415 downto 0);
		valid_rows : out std_logic;

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		-- Byte qualifier
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
end maxpool_v1_0_S00_AXIS;

architecture arch_imp of maxpool_v1_0_S00_AXIS is
component input_ctrl_mp is
	generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
	    mp_ready1 : in std_logic;
	    mp_ready2 : in std_logic;
	    mp_ready3 : in std_logic;
	    mp_ready4 : in std_logic;
		rows1 : out std_logic_vector(415 downto 0);
		rows2 : out std_logic_vector(415 downto 0);
		rows3 : out std_logic_vector(415 downto 0);
		rows4 : out std_logic_vector(415 downto 0);
		valid_rows : out std_logic;
		

		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
	);
end component;

begin

icm_inst : input_ctrl_mp 
	generic map(
		C_S_AXIS_TDATA_WIDTH	=> C_S_AXIS_TDATA_WIDTH
	)
	port map(
	    mp_ready1 => mp_ready1,
	    mp_ready2 => mp_ready2,
	    mp_ready3 => mp_ready3,
	    mp_ready4 => mp_ready4,
		rows1 => rows1,
		rows2 => rows2,
		rows3 => rows3,
		rows4 => rows4,
		valid_rows => valid_rows,

		S_AXIS_ACLK	=> S_AXIS_ACLK,
		S_AXIS_ARESETN	=> S_AXIS_ARESETN,
		S_AXIS_TREADY => S_AXIS_TREADY,	
		S_AXIS_TDATA =>	S_AXIS_TDATA,
		S_AXIS_TSTRB =>	S_AXIS_TSTRB,
		S_AXIS_TLAST =>	S_AXIS_TLAST,
		S_AXIS_TVALID => S_AXIS_TVALID
	);


end arch_imp;
