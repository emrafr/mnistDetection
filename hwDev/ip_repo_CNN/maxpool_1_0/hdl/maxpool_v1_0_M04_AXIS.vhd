library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maxpool_v1_0_M04_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		-- Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		C_M_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global ports
		M_AXIS_ACLK	: in std_logic;
		-- 
		M_AXIS_ARESETN	: in std_logic;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		M_AXIS_TVALID	: out std_logic;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- TLAST indicates the boundary of a packet.
		M_AXIS_TLAST	: out std_logic;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M_AXIS_TREADY	: in std_logic
	);
end maxpool_v1_0_M04_AXIS;

architecture implementation of maxpool_v1_0_M04_AXIS is


begin
	-- I/O Connections assignments

	M_AXIS_TVALID	<= '1' when valid_output1 = '1' and valid_output2 = '1' and valid_output3 = '1' and valid_output4 = '1';
	M_AXIS_TDATA	<= mp_output1 & mp_output2 & mp_output3 & mp_output4;
	M_AXIS_TLAST	<= '0';
	M_AXIS_TSTRB	<= (others => '1');                                                             

	-- Add user logic here

	-- User logic ends

end implementation;
