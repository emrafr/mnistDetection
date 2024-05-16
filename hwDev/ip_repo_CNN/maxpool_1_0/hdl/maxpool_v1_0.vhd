library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maxpool_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S01_AXIS
		C_S01_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S02_AXIS
		C_S02_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S03_AXIS
		C_S03_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S04_AXIS
		C_S04_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S05_AXIS
		C_S05_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S06_AXIS
		C_S06_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S07_AXIS
		C_S07_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M01_AXIS
		C_M01_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M01_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M02_AXIS
		C_M02_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M02_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M03_AXIS
		C_M03_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M03_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M04_AXIS
		C_M04_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M04_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M05_AXIS
		C_M05_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M05_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M06_AXIS
		C_M06_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M06_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M07_AXIS
		C_M07_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M07_AXIS_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk	: in std_logic;
		s00_axis_aresetn	: in std_logic;
		s00_axis_tready	: out std_logic;
		s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tstrb	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s00_axis_tlast	: in std_logic;
		s00_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S01_AXIS
		s01_axis_aclk	: in std_logic;
		s01_axis_aresetn	: in std_logic;
		s01_axis_tready	: out std_logic;
		s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
		s01_axis_tstrb	: in std_logic_vector((C_S01_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s01_axis_tlast	: in std_logic;
		s01_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S02_AXIS
		s02_axis_aclk	: in std_logic;
		s02_axis_aresetn	: in std_logic;
		s02_axis_tready	: out std_logic;
		s02_axis_tdata	: in std_logic_vector(C_S02_AXIS_TDATA_WIDTH-1 downto 0);
		s02_axis_tstrb	: in std_logic_vector((C_S02_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s02_axis_tlast	: in std_logic;
		s02_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S03_AXIS
		s03_axis_aclk	: in std_logic;
		s03_axis_aresetn	: in std_logic;
		s03_axis_tready	: out std_logic;
		s03_axis_tdata	: in std_logic_vector(C_S03_AXIS_TDATA_WIDTH-1 downto 0);
		s03_axis_tstrb	: in std_logic_vector((C_S03_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s03_axis_tlast	: in std_logic;
		s03_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S04_AXIS
		s04_axis_aclk	: in std_logic;
		s04_axis_aresetn	: in std_logic;
		s04_axis_tready	: out std_logic;
		s04_axis_tdata	: in std_logic_vector(C_S04_AXIS_TDATA_WIDTH-1 downto 0);
		s04_axis_tstrb	: in std_logic_vector((C_S04_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s04_axis_tlast	: in std_logic;
		s04_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S05_AXIS
		s05_axis_aclk	: in std_logic;
		s05_axis_aresetn	: in std_logic;
		s05_axis_tready	: out std_logic;
		s05_axis_tdata	: in std_logic_vector(C_S05_AXIS_TDATA_WIDTH-1 downto 0);
		s05_axis_tstrb	: in std_logic_vector((C_S05_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s05_axis_tlast	: in std_logic;
		s05_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S06_AXIS
		s06_axis_aclk	: in std_logic;
		s06_axis_aresetn	: in std_logic;
		s06_axis_tready	: out std_logic;
		s06_axis_tdata	: in std_logic_vector(C_S06_AXIS_TDATA_WIDTH-1 downto 0);
		s06_axis_tstrb	: in std_logic_vector((C_S06_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s06_axis_tlast	: in std_logic;
		s06_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S07_AXIS
		s07_axis_aclk	: in std_logic;
		s07_axis_aresetn	: in std_logic;
		s07_axis_tready	: out std_logic;
		s07_axis_tdata	: in std_logic_vector(C_S07_AXIS_TDATA_WIDTH-1 downto 0);
		s07_axis_tstrb	: in std_logic_vector((C_S07_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s07_axis_tlast	: in std_logic;
		s07_axis_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk	: in std_logic;
		m00_axis_aresetn	: in std_logic;
		m00_axis_tvalid	: out std_logic;
		m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tstrb	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m00_axis_tlast	: out std_logic;
		m00_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M01_AXIS
		m01_axis_aclk	: in std_logic;
		m01_axis_aresetn	: in std_logic;
		m01_axis_tvalid	: out std_logic;
		m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
		m01_axis_tstrb	: out std_logic_vector((C_M01_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m01_axis_tlast	: out std_logic;
		m01_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M02_AXIS
		m02_axis_aclk	: in std_logic;
		m02_axis_aresetn	: in std_logic;
		m02_axis_tvalid	: out std_logic;
		m02_axis_tdata	: out std_logic_vector(C_M02_AXIS_TDATA_WIDTH-1 downto 0);
		m02_axis_tstrb	: out std_logic_vector((C_M02_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m02_axis_tlast	: out std_logic;
		m02_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M03_AXIS
		m03_axis_aclk	: in std_logic;
		m03_axis_aresetn	: in std_logic;
		m03_axis_tvalid	: out std_logic;
		m03_axis_tdata	: out std_logic_vector(C_M03_AXIS_TDATA_WIDTH-1 downto 0);
		m03_axis_tstrb	: out std_logic_vector((C_M03_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m03_axis_tlast	: out std_logic;
		m03_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M04_AXIS
		m04_axis_aclk	: in std_logic;
		m04_axis_aresetn	: in std_logic;
		m04_axis_tvalid	: out std_logic;
		m04_axis_tdata	: out std_logic_vector(C_M04_AXIS_TDATA_WIDTH-1 downto 0);
		m04_axis_tstrb	: out std_logic_vector((C_M04_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m04_axis_tlast	: out std_logic;
		m04_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M05_AXIS
		m05_axis_aclk	: in std_logic;
		m05_axis_aresetn	: in std_logic;
		m05_axis_tvalid	: out std_logic;
		m05_axis_tdata	: out std_logic_vector(C_M05_AXIS_TDATA_WIDTH-1 downto 0);
		m05_axis_tstrb	: out std_logic_vector((C_M05_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m05_axis_tlast	: out std_logic;
		m05_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M06_AXIS
		m06_axis_aclk	: in std_logic;
		m06_axis_aresetn	: in std_logic;
		m06_axis_tvalid	: out std_logic;
		m06_axis_tdata	: out std_logic_vector(C_M06_AXIS_TDATA_WIDTH-1 downto 0);
		m06_axis_tstrb	: out std_logic_vector((C_M06_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m06_axis_tlast	: out std_logic;
		m06_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M07_AXIS
		m07_axis_aclk	: in std_logic;
		m07_axis_aresetn	: in std_logic;
		m07_axis_tvalid	: out std_logic;
		m07_axis_tdata	: out std_logic_vector(C_M07_AXIS_TDATA_WIDTH-1 downto 0);
		m07_axis_tstrb	: out std_logic_vector((C_M07_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m07_axis_tlast	: out std_logic;
		m07_axis_tready	: in std_logic
	);
end maxpool_v1_0;

architecture arch_imp of maxpool_v1_0 is

	-- component declaration
	component maxpool_v1_0_S00_AXIS is
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
	end component maxpool_v1_0_S00_AXIS;

	component maxpool_v1_0_S01_AXIS is
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
	end component maxpool_v1_0_S01_AXIS;

	component maxpool_v1_0_S02_AXIS is
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
	end component maxpool_v1_0_S02_AXIS;

	component maxpool_v1_0_S03_AXIS is
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
	end component maxpool_v1_0_S03_AXIS;

	component maxpool_v1_0_S04_AXIS is
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
	end component maxpool_v1_0_S04_AXIS;

	component maxpool_v1_0_S05_AXIS is
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
	end component maxpool_v1_0_S05_AXIS;

	component maxpool_v1_0_S06_AXIS is
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
	end component maxpool_v1_0_S06_AXIS;

	component maxpool_v1_0_S07_AXIS is
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
	end component maxpool_v1_0_S07_AXIS;

	component maxpool_v1_0_M00_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;
				
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M00_AXIS;

	component maxpool_v1_0_M01_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;		
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M01_AXIS;

	component maxpool_v1_0_M02_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;		
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M02_AXIS;

	component maxpool_v1_0_M03_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;			
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M03_AXIS;

	component maxpool_v1_0_M04_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;		
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M04_AXIS;

	component maxpool_v1_0_M05_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;		
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M05_AXIS;

	component maxpool_v1_0_M06_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;		
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M06_AXIS;

	component maxpool_v1_0_M07_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		mp_output1 : in std_logic_vector(7 downto 0);
		mp_output2 : in std_logic_vector(7 downto 0);
		mp_output3 : in std_logic_vector(7 downto 0);
		mp_output4 : in std_logic_vector(7 downto 0);
		valid_output1 : in std_logic;
		valid_output2 : in std_logic;
		valid_output3 : in std_logic;
		valid_output4 : in std_logic;		
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v1_0_M07_AXIS;
	
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

signal rows1, rows2, rows3, rows4 : std_logic_vector(415 downto 0);
signal rows5, rows6, rows7, rows8 : std_logic_vector(415 downto 0);
signal rows9, rows10, rows11, rows12 : std_logic_vector(415 downto 0);
signal rows13, rows14, rows15, rows16 : std_logic_vector(415 downto 0);
signal rows17, rows18, rows19, rows20 : std_logic_vector(415 downto 0);
signal rows21, rows22, rows23, rows24 : std_logic_vector(415 downto 0);
signal rows25, rows26, rows27, rows28 : std_logic_vector(415 downto 0);
signal rows29, rows30, rows31, rows32 : std_logic_vector(415 downto 0);

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

signal valid_rows1, valid_rows2, valid_rows3, valid_rows4, valid_rows5, valid_rows6, valid_rows7, valid_rows8 : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXIS
maxpool_v1_0_S00_AXIS_inst : maxpool_v1_0_S00_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S00_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready1,
	    mp_ready2 => mp_ready2,
	    mp_ready3 => mp_ready3,
	    mp_ready4 => mp_ready4,
		rows1 => rows1,
		rows2 => rows2,
		rows3 => rows3,
		rows4 => rows4,
		valid_rows => valid_rows1,
		S_AXIS_ACLK	=> s00_axis_aclk,
		S_AXIS_ARESETN	=> s00_axis_aresetn,
		S_AXIS_TREADY	=> s00_axis_tready,
		S_AXIS_TDATA	=> s00_axis_tdata,
		S_AXIS_TSTRB	=> s00_axis_tstrb,
		S_AXIS_TLAST	=> s00_axis_tlast,
		S_AXIS_TVALID	=> s00_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S01_AXIS
maxpool_v1_0_S01_AXIS_inst : maxpool_v1_0_S01_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S01_AXIS_TDATA_WIDTH
	)
	port map (
		mp_ready1 => mp_ready5,
	    mp_ready2 => mp_ready6,
	    mp_ready3 => mp_ready7,
	    mp_ready4 => mp_ready8,
		rows1 => rows5,
		rows2 => rows6,
		rows3 => rows7,
		rows4 => rows8,
		valid_rows => valid_rows2,
		S_AXIS_ACLK	=> s01_axis_aclk,
		S_AXIS_ARESETN	=> s01_axis_aresetn,
		S_AXIS_TREADY	=> s01_axis_tready,
		S_AXIS_TDATA	=> s01_axis_tdata,
		S_AXIS_TSTRB	=> s01_axis_tstrb,
		S_AXIS_TLAST	=> s01_axis_tlast,
		S_AXIS_TVALID	=> s01_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S02_AXIS
maxpool_v1_0_S02_AXIS_inst : maxpool_v1_0_S02_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S02_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready9,
	    mp_ready2 => mp_ready10,
	    mp_ready3 => mp_ready11,
	    mp_ready4 => mp_ready12,	
		rows1 => rows9,
		rows2 => rows10,
		rows3 => rows11,
		rows4 => rows12,
		valid_rows => valid_rows3,
		S_AXIS_ACLK	=> s02_axis_aclk,
		S_AXIS_ARESETN	=> s02_axis_aresetn,
		S_AXIS_TREADY	=> s02_axis_tready,
		S_AXIS_TDATA	=> s02_axis_tdata,
		S_AXIS_TSTRB	=> s02_axis_tstrb,
		S_AXIS_TLAST	=> s02_axis_tlast,
		S_AXIS_TVALID	=> s02_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S03_AXIS
maxpool_v1_0_S03_AXIS_inst : maxpool_v1_0_S03_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S03_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready13,
	    mp_ready2 => mp_ready14,
	    mp_ready3 => mp_ready15,
	    mp_ready4 => mp_ready16,	
		rows1 => rows13,
		rows2 => rows14,
		rows3 => rows15,
		rows4 => rows16,
		valid_rows => valid_rows4,
		S_AXIS_ACLK	=> s03_axis_aclk,
		S_AXIS_ARESETN	=> s03_axis_aresetn,
		S_AXIS_TREADY	=> s03_axis_tready,
		S_AXIS_TDATA	=> s03_axis_tdata,
		S_AXIS_TSTRB	=> s03_axis_tstrb,
		S_AXIS_TLAST	=> s03_axis_tlast,
		S_AXIS_TVALID	=> s03_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S04_AXIS
maxpool_v1_0_S04_AXIS_inst : maxpool_v1_0_S04_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S04_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready17,
	    mp_ready2 => mp_ready18,
	    mp_ready3 => mp_ready19,
	    mp_ready4 => mp_ready20,		
		rows1 => rows17,
		rows2 => rows18,
		rows3 => rows19,
		rows4 => rows20,
		valid_rows => valid_rows5,
		S_AXIS_ACLK	=> s04_axis_aclk,
		S_AXIS_ARESETN	=> s04_axis_aresetn,
		S_AXIS_TREADY	=> s04_axis_tready,
		S_AXIS_TDATA	=> s04_axis_tdata,
		S_AXIS_TSTRB	=> s04_axis_tstrb,
		S_AXIS_TLAST	=> s04_axis_tlast,
		S_AXIS_TVALID	=> s04_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S05_AXIS
maxpool_v1_0_S05_AXIS_inst : maxpool_v1_0_S05_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S05_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready21,
	    mp_ready2 => mp_ready22,
	    mp_ready3 => mp_ready23,
	    mp_ready4 => mp_ready24,		
	
		rows1 => rows21,
		rows2 => rows22,
		rows3 => rows23,
		rows4 => rows24,
		valid_rows => valid_rows6,
		S_AXIS_ACLK	=> s05_axis_aclk,
		S_AXIS_ARESETN	=> s05_axis_aresetn,
		S_AXIS_TREADY	=> s05_axis_tready,
		S_AXIS_TDATA	=> s05_axis_tdata,
		S_AXIS_TSTRB	=> s05_axis_tstrb,
		S_AXIS_TLAST	=> s05_axis_tlast,
		S_AXIS_TVALID	=> s05_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S06_AXIS
maxpool_v1_0_S06_AXIS_inst : maxpool_v1_0_S06_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S06_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready25,
	    mp_ready2 => mp_ready26,
	    mp_ready3 => mp_ready27,
	    mp_ready4 => mp_ready28,	
		rows1 => rows25,
		rows2 => rows26,
		rows3 => rows27,
		rows4 => rows28,
		valid_rows => valid_rows7,
		S_AXIS_ACLK	=> s06_axis_aclk,
		S_AXIS_ARESETN	=> s06_axis_aresetn,
		S_AXIS_TREADY	=> s06_axis_tready,
		S_AXIS_TDATA	=> s06_axis_tdata,
		S_AXIS_TSTRB	=> s06_axis_tstrb,
		S_AXIS_TLAST	=> s06_axis_tlast,
		S_AXIS_TVALID	=> s06_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S07_AXIS
maxpool_v1_0_S07_AXIS_inst : maxpool_v1_0_S07_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S07_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready1 => mp_ready29,
	    mp_ready2 => mp_ready30,
	    mp_ready3 => mp_ready31,
	    mp_ready4 => mp_ready32,	
		rows1 => rows29,
		rows2 => rows30,
		rows3 => rows31,
		rows4 => rows32,
		valid_rows => valid_rows8,
		S_AXIS_ACLK	=> s07_axis_aclk,
		S_AXIS_ARESETN	=> s07_axis_aresetn,
		S_AXIS_TREADY	=> s07_axis_tready,
		S_AXIS_TDATA	=> s07_axis_tdata,
		S_AXIS_TSTRB	=> s07_axis_tstrb,
		S_AXIS_TLAST	=> s07_axis_tlast,
		S_AXIS_TVALID	=> s07_axis_tvalid
	);

-- Instantiation of Axi Bus Interface M00_AXIS
maxpool_v1_0_M00_AXIS_inst : maxpool_v1_0_M00_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output1,
		mp_output2 => mp_output2,
		mp_output3 => mp_output3,
		mp_output4 => mp_output4,
		valid_output1 => valid_output1,
		valid_output2 => valid_output2,
		valid_output3 => valid_output3,
		valid_output4 => valid_output4,
		M_AXIS_ACLK	=> m00_axis_aclk,
		M_AXIS_ARESETN	=> m00_axis_aresetn,
		M_AXIS_TVALID	=> m00_axis_tvalid,
		M_AXIS_TDATA	=> m00_axis_tdata,
		M_AXIS_TSTRB	=> m00_axis_tstrb,
		M_AXIS_TLAST	=> m00_axis_tlast,
		M_AXIS_TREADY	=> m00_axis_tready
	);

-- Instantiation of Axi Bus Interface M01_AXIS
maxpool_v1_0_M01_AXIS_inst : maxpool_v1_0_M01_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M01_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M01_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output5,
		mp_output2 => mp_output6,
		mp_output3 => mp_output7,
		mp_output4 => mp_output8,
		valid_output1 => valid_output5,
		valid_output2 => valid_output6,
		valid_output3 => valid_output7,
		valid_output4 => valid_output8,	
		M_AXIS_ACLK	=> m01_axis_aclk,
		M_AXIS_ARESETN	=> m01_axis_aresetn,
		M_AXIS_TVALID	=> m01_axis_tvalid,
		M_AXIS_TDATA	=> m01_axis_tdata,
		M_AXIS_TSTRB	=> m01_axis_tstrb,
		M_AXIS_TLAST	=> m01_axis_tlast,
		M_AXIS_TREADY	=> m01_axis_tready
	);

-- Instantiation of Axi Bus Interface M02_AXIS
maxpool_v1_0_M02_AXIS_inst : maxpool_v1_0_M02_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M02_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M02_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output9,
		mp_output2 => mp_output10,
		mp_output3 => mp_output11,
		mp_output4 => mp_output12,
		valid_output1 => valid_output9,
		valid_output2 => valid_output10,
		valid_output3 => valid_output11,
		valid_output4 => valid_output12,	
		M_AXIS_ACLK	=> m02_axis_aclk,
		M_AXIS_ARESETN	=> m02_axis_aresetn,
		M_AXIS_TVALID	=> m02_axis_tvalid,
		M_AXIS_TDATA	=> m02_axis_tdata,
		M_AXIS_TSTRB	=> m02_axis_tstrb,
		M_AXIS_TLAST	=> m02_axis_tlast,
		M_AXIS_TREADY	=> m02_axis_tready
	);

-- Instantiation of Axi Bus Interface M03_AXIS
maxpool_v1_0_M03_AXIS_inst : maxpool_v1_0_M03_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M03_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M03_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output13,
		mp_output2 => mp_output14,
		mp_output3 => mp_output15,
		mp_output4 => mp_output16,
		valid_output1 => valid_output13,
		valid_output2 => valid_output14,
		valid_output3 => valid_output15,
		valid_output4 => valid_output16,		
		M_AXIS_ACLK	=> m03_axis_aclk,
		M_AXIS_ARESETN	=> m03_axis_aresetn,
		M_AXIS_TVALID	=> m03_axis_tvalid,
		M_AXIS_TDATA	=> m03_axis_tdata,
		M_AXIS_TSTRB	=> m03_axis_tstrb,
		M_AXIS_TLAST	=> m03_axis_tlast,
		M_AXIS_TREADY	=> m03_axis_tready
	);

-- Instantiation of Axi Bus Interface M04_AXIS
maxpool_v1_0_M04_AXIS_inst : maxpool_v1_0_M04_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M04_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M04_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output17,
		mp_output2 => mp_output18,
		mp_output3 => mp_output19,
		mp_output4 => mp_output20,
		valid_output1 => valid_output17,
		valid_output2 => valid_output18,
		valid_output3 => valid_output19,
		valid_output4 => valid_output20,		
		M_AXIS_ACLK	=> m04_axis_aclk,
		M_AXIS_ARESETN	=> m04_axis_aresetn,
		M_AXIS_TVALID	=> m04_axis_tvalid,
		M_AXIS_TDATA	=> m04_axis_tdata,
		M_AXIS_TSTRB	=> m04_axis_tstrb,
		M_AXIS_TLAST	=> m04_axis_tlast,
		M_AXIS_TREADY	=> m04_axis_tready
	);

-- Instantiation of Axi Bus Interface M05_AXIS
maxpool_v1_0_M05_AXIS_inst : maxpool_v1_0_M05_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M05_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M05_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output21,
		mp_output2 => mp_output22,
		mp_output3 => mp_output23,
		mp_output4 => mp_output24,
		valid_output1 => valid_output21,
		valid_output2 => valid_output22,
		valid_output3 => valid_output23,
		valid_output4 => valid_output24,		
		M_AXIS_ACLK	=> m05_axis_aclk,
		M_AXIS_ARESETN	=> m05_axis_aresetn,
		M_AXIS_TVALID	=> m05_axis_tvalid,
		M_AXIS_TDATA	=> m05_axis_tdata,
		M_AXIS_TSTRB	=> m05_axis_tstrb,
		M_AXIS_TLAST	=> m05_axis_tlast,
		M_AXIS_TREADY	=> m05_axis_tready
	);

-- Instantiation of Axi Bus Interface M06_AXIS
maxpool_v1_0_M06_AXIS_inst : maxpool_v1_0_M06_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M06_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M06_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output25,
		mp_output2 => mp_output26,
		mp_output3 => mp_output27,
		mp_output4 => mp_output28,
		valid_output1 => valid_output25,
		valid_output2 => valid_output26,
		valid_output3 => valid_output27,
		valid_output4 => valid_output28,	
		M_AXIS_ACLK	=> m06_axis_aclk,
		M_AXIS_ARESETN	=> m06_axis_aresetn,
		M_AXIS_TVALID	=> m06_axis_tvalid,
		M_AXIS_TDATA	=> m06_axis_tdata,
		M_AXIS_TSTRB	=> m06_axis_tstrb,
		M_AXIS_TLAST	=> m06_axis_tlast,
		M_AXIS_TREADY	=> m06_axis_tready
	);

-- Instantiation of Axi Bus Interface M07_AXIS
maxpool_v1_0_M07_AXIS_inst : maxpool_v1_0_M07_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M07_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M07_AXIS_START_COUNT
	)
	port map (
		mp_output1 => mp_output29,
		mp_output2 => mp_output30,
		mp_output3 => mp_output31,
		mp_output4 => mp_output32,
		valid_output1 => valid_output29,
		valid_output2 => valid_output30,
		valid_output3 => valid_output31,
		valid_output4 => valid_output32,	
		M_AXIS_ACLK	=> m07_axis_aclk,
		M_AXIS_ARESETN	=> m07_axis_aresetn,
		M_AXIS_TVALID	=> m07_axis_tvalid,
		M_AXIS_TDATA	=> m07_axis_tdata,
		M_AXIS_TSTRB	=> m07_axis_tstrb,
		M_AXIS_TLAST	=> m07_axis_tlast,
		M_AXIS_TREADY	=> m07_axis_tready
	);
	
maxpool_inst1 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows1,
	mp_input => rows1,
	mp_output => mp_output1,
	ready => mp_ready1,
	valid_output => valid_output1
);

maxpool_inst2 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows1,
	mp_input => rows2,
	mp_output => mp_output2,
	ready => mp_ready2,
	valid_output => valid_output2
);

maxpool_inst3 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows1,
	mp_input => rows3,
	mp_output => mp_output3,
	ready => mp_ready3,
	valid_output => valid_output3
);

maxpool_inst4 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows1,
	mp_input => rows4,
	mp_output => mp_output4,
	ready => mp_ready4,
	valid_output => valid_output4
);

maxpool_inst5 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows2,
	mp_input => rows5,
	mp_output => mp_output5,
	ready => mp_ready5,
	valid_output => valid_output5
);

maxpool_inst6 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows2,
	mp_input => rows6,
	mp_output => mp_output6,
	ready => mp_ready6,
	valid_output => valid_output6
);

maxpool_inst7 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows2,
	mp_input => rows7,
	mp_output => mp_output7,
	ready => mp_ready7,
	valid_output => valid_output7
);

maxpool_inst8 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows2,
	mp_input => rows8,
	mp_output => mp_output8,
	ready => mp_ready8,
	valid_output => valid_output8
);

maxpool_inst9 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows3,
	mp_input => rows9,
	mp_output => mp_output9,
	ready => mp_ready9,
	valid_output => valid_output9
);

maxpool_inst10 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows3,
	mp_input => rows10,
	mp_output => mp_output10,
	ready => mp_ready10,
	valid_output => valid_output10
);

maxpool_inst11 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows3,
	mp_input => rows11,
	mp_output => mp_output11,
	ready => mp_ready11,
	valid_output => valid_output11
);

maxpool_inst12 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows3,
	mp_input => rows12,
	mp_output => mp_output12,
	ready => mp_ready12,
	valid_output => valid_output12
);

maxpool_inst13 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows4,
	mp_input => rows13,
	mp_output => mp_output13,
	ready => mp_ready13,
	valid_output => valid_output13
);

maxpool_inst14 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows4,
	mp_input => rows14,
	mp_output => mp_output14,
	ready => mp_ready14,
	valid_output => valid_output14
);

maxpool_inst15 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows4,
	mp_input => rows15,
	mp_output => mp_output15,
	ready => mp_ready15,
	valid_output => valid_output15
);

maxpool_inst16 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows4,
	mp_input => rows16,
	mp_output => mp_output16,
	ready => mp_ready16,
	valid_output => valid_output16
);

maxpool_inst17 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows5,
	mp_input => rows17,
	mp_output => mp_output17,
	ready => mp_ready17,
	valid_output => valid_output17
);

maxpool_inst18 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows5,
	mp_input => rows18,
	mp_output => mp_output18,
	ready => mp_ready18,
	valid_output => valid_output18
);

maxpool_inst19 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows5,
	mp_input => rows19,
	mp_output => mp_output19,
	ready => mp_ready19,
	valid_output => valid_output19
);

maxpool_inst20 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows5,
	mp_input => rows20,
	mp_output => mp_output20,
	ready => mp_ready20,
	valid_output => valid_output20
);

maxpool_inst21 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows6,
	mp_input => rows21,
	mp_output => mp_output21,
	ready => mp_ready21,
	valid_output => valid_output21
);

maxpool_inst22 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows6,
	mp_input => rows22,
	mp_output => mp_output22,
	ready => mp_ready22,
	valid_output => valid_output22
);

maxpool_inst23 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows6,
	mp_input => rows23,
	mp_output => mp_output23,
	ready => mp_ready23,
	valid_output => valid_output23
);

maxpool_inst24 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows6,
	mp_input => rows24,
	mp_output => mp_output24,
	ready => mp_ready24,
	valid_output => valid_output24
);

maxpool_inst25 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows7,
	mp_input => rows25,
	mp_output => mp_output25,
	ready => mp_ready25,
	valid_output => valid_output25
);

maxpool_inst26 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows7,
	mp_input => rows26,
	mp_output => mp_output26,
	ready => mp_ready26,
	valid_output => valid_output26
);

maxpool_inst27 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows7,
	mp_input => rows27,
	mp_output => mp_output27,
	ready => mp_ready27,
	valid_output => valid_output27
);

maxpool_inst28 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows7,
	mp_input => rows28,
	mp_output => mp_output28,
	ready => mp_ready28,
	valid_output => valid_output28
);

maxpool_inst29 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows8,
	mp_input => rows29,
	mp_output => mp_output29,
	ready => mp_ready29,
	valid_output => valid_output29
);

maxpool_inst30 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows8,
	mp_input => rows30,
	mp_output => mp_output30,
	ready => mp_ready30,
	valid_output => valid_output30
);

maxpool_inst31 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows8,
	mp_input => rows31,
	mp_output => mp_output31,
	ready => mp_ready31,
	valid_output => valid_output31
);

maxpool_inst32 : maxpool
port map(
	clk => s00_axis_aclk,
	reset => s00_axis_aresetn,
	valid_input => valid_rows8,
	mp_input => rows32,
	mp_output => mp_output32,
	ready => mp_ready32,
	valid_output => valid_output32
);

end arch_imp;
