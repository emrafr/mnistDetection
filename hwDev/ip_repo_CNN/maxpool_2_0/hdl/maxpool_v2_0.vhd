library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maxpool_v2_0 is
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
		C_M00_AXIS_START_COUNT	: integer	:= 32
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
		m00_axis_tready	: in std_logic
	);
end maxpool_v2_0;

architecture arch_imp of maxpool_v2_0 is

	-- component declaration
	component maxpool_v2_0_S00_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;
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
	end component maxpool_v2_0_S00_AXIS;

	component maxpool_v2_0_S01_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;	
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
	end component maxpool_v2_0_S01_AXIS;

	component maxpool_v2_0_S02_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;	
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
	end component maxpool_v2_0_S02_AXIS;

	component maxpool_v2_0_S03_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;	
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
	end component maxpool_v2_0_S03_AXIS;

	component maxpool_v2_0_S04_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;		
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
	end component maxpool_v2_0_S04_AXIS;

	component maxpool_v2_0_S05_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;	
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
	end component maxpool_v2_0_S05_AXIS;

	component maxpool_v2_0_S06_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;	
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
	end component maxpool_v2_0_S06_AXIS;

	component maxpool_v2_0_S07_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (	    
		mp_ready : in std_logic;	
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
	end component maxpool_v2_0_S07_AXIS;

	component maxpool_v2_0_M00_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
	    mp_output : in std_logic_vector(255 downto 0);
	    valid_output : in std_logic;
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component maxpool_v2_0_M00_AXIS;
	
component maxpool_top is
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
end component;

signal rows1, rows2, rows3, rows4 : std_logic_vector(415 downto 0);
signal rows5, rows6, rows7, rows8 : std_logic_vector(415 downto 0);
signal rows9, rows10, rows11, rows12 : std_logic_vector(415 downto 0);
signal rows13, rows14, rows15, rows16 : std_logic_vector(415 downto 0);
signal rows17, rows18, rows19, rows20 : std_logic_vector(415 downto 0);
signal rows21, rows22, rows23, rows24 : std_logic_vector(415 downto 0);
signal rows25, rows26, rows27, rows28 : std_logic_vector(415 downto 0);
signal rows29, rows30, rows31, rows32 : std_logic_vector(415 downto 0);

signal mp_ready :     std_logic;
signal valid_output :     std_logic;
signal mp_output :     std_logic_vector(255 downto 0);


signal valid_rows1, valid_rows2, valid_rows3, valid_rows4, valid_rows5, valid_rows6, valid_rows7, valid_rows8 : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXIS
maxpool_v2_0_S00_AXIS_inst : maxpool_v2_0_S00_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S00_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,
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
maxpool_v2_0_S01_AXIS_inst : maxpool_v2_0_S01_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S01_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,
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
maxpool_v2_0_S02_AXIS_inst : maxpool_v2_0_S02_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S02_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,
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
maxpool_v2_0_S03_AXIS_inst : maxpool_v2_0_S03_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S03_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,
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
maxpool_v2_0_S04_AXIS_inst : maxpool_v2_0_S04_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S04_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,	
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
maxpool_v2_0_S05_AXIS_inst : maxpool_v2_0_S05_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S05_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,
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
maxpool_v2_0_S06_AXIS_inst : maxpool_v2_0_S06_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S06_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,	
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
maxpool_v2_0_S07_AXIS_inst : maxpool_v2_0_S07_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S07_AXIS_TDATA_WIDTH
	)
	port map (
	    mp_ready => mp_ready,
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
maxpool_v2_0_M00_AXIS_inst : maxpool_v2_0_M00_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
	)
	port map (
	    mp_output    => mp_output,
	    valid_output => valid_output,
		M_AXIS_ACLK	=> m00_axis_aclk,
		M_AXIS_ARESETN	=> m00_axis_aresetn,
		M_AXIS_TVALID	=> m00_axis_tvalid,
		M_AXIS_TDATA	=> m00_axis_tdata,
		M_AXIS_TSTRB	=> m00_axis_tstrb,
		M_AXIS_TLAST	=> m00_axis_tlast,
		M_AXIS_TREADY	=> m00_axis_tready
	);
mp_top : maxpool_top
  Port map( 
    clk => s00_axis_aclk,
    reset => s00_axis_aresetn,
    rows1  => rows1 ,
    rows2  => rows2 ,
    rows3  => rows3 ,
    rows4  => rows4 ,
    rows5  => rows5 ,
    rows6  => rows6 ,
    rows7  => rows7 ,
    rows8  => rows8 ,
    rows9  => rows9 ,
    rows10 => rows10,
    rows11 => rows11,
    rows12 => rows12,
    rows13 => rows13,
    rows14 => rows14,
    rows15 => rows15,
    rows16 => rows16,
    rows17 => rows17,
    rows18 => rows18,
    rows19 => rows19,
    rows20 => rows20,
    rows21 => rows21,
    rows22 => rows22,
    rows23 => rows23,
    rows24 => rows24,
    rows25 => rows25,
    rows26 => rows26,
    rows27 => rows27,
    rows28 => rows28,
    rows29 => rows29,
    rows30 => rows30,
    rows31 => rows31,
    rows32 => rows32,
    valid_rows1 => valid_rows1,
    valid_rows2 => valid_rows2,
    valid_rows3 => valid_rows3,
    valid_rows4 => valid_rows4,
    valid_rows5 => valid_rows5,
    valid_rows6 => valid_rows6,
    valid_rows7 => valid_rows7,
    valid_rows8 => valid_rows8,
    mp_ready => mp_ready,
    mp_output => mp_output,
    valid_output => valid_output
   );
	

end arch_imp;

