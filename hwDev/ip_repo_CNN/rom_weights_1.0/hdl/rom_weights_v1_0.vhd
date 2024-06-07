library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom_weights_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


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
		C_M07_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M08_AXIS
		C_M08_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M08_AXIS_START_COUNT	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M09_AXIS
		C_M09_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M09_AXIS_START_COUNT	: integer	:= 32

	);
	port (
		-- Users to add ports here
        address : in std_logic_vector(10 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line


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
		m07_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M08_AXIS
		m08_axis_aclk	: in std_logic;
		m08_axis_aresetn	: in std_logic;
		m08_axis_tvalid	: out std_logic;
		m08_axis_tdata	: out std_logic_vector(C_M08_AXIS_TDATA_WIDTH-1 downto 0);
		m08_axis_tstrb	: out std_logic_vector((C_M08_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m08_axis_tlast	: out std_logic;
		m08_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M09_AXIS
		m09_axis_aclk	: in std_logic;
		m09_axis_aresetn	: in std_logic;
		m09_axis_tvalid	: out std_logic;
		m09_axis_tdata	: out std_logic_vector(C_M09_AXIS_TDATA_WIDTH-1 downto 0);
		m09_axis_tstrb	: out std_logic_vector((C_M09_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m09_axis_tlast	: out std_logic;
		m09_axis_tready	: in std_logic

	);
end rom_weights_v1_0;

architecture arch_imp of rom_weights_v1_0 is

	-- component declaration
	component rom_weights_v1_0_M00_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		address : in std_logic_vector(10 downto 0);
		address_out : out std_logic_vector(10 downto 0);
	    weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M00_AXIS;

	component rom_weights_v1_0_M01_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M01_AXIS;

	component rom_weights_v1_0_M02_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M02_AXIS;

	component rom_weights_v1_0_M03_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M03_AXIS;

	component rom_weights_v1_0_M04_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M04_AXIS;

	component rom_weights_v1_0_M05_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M05_AXIS;

	component rom_weights_v1_0_M06_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M06_AXIS;

	component rom_weights_v1_0_M07_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M07_AXIS;

	component rom_weights_v1_0_M08_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M08_AXIS;

	component rom_weights_v1_0_M09_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		weights_input : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component rom_weights_v1_0_M09_AXIS;
	
	component rom_weights is
    port(
        clk : in std_logic;
        romAddress : in std_logic_vector(10 downto 0);
        weights1 : out std_logic_vector(31 downto 0);
        weights2 : out std_logic_vector(31 downto 0);
        weights3 : out std_logic_vector(31 downto 0);
        weights4 : out std_logic_vector(31 downto 0);
        weights5 : out std_logic_vector(31 downto 0);
        weights6 : out std_logic_vector(31 downto 0);
        weights7 : out std_logic_vector(31 downto 0);
        weights8 : out std_logic_vector(31 downto 0);
        weights9 : out std_logic_vector(31 downto 0);
        weights10 : out std_logic_vector(31 downto 0)
    );
end component rom_weights;

signal weights1, weights2, weights3, weights4, weights5, weights6, weights7, weights8, weights9, weights10 : std_logic_vector(31 downto 0);
signal address_in, address_out : std_logic_vector(10 downto 0);

begin

-- Instantiation of Axi Bus Interface M00_AXIS
rom_weights_v1_0_M00_AXIS_inst : rom_weights_v1_0_M00_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
	)
	port map (
	    address => address,
	    address_out => address_out,
	    weights_input => weights1,
		M_AXIS_ACLK	=> m00_axis_aclk,
		M_AXIS_ARESETN	=> m00_axis_aresetn,
		M_AXIS_TVALID	=> m00_axis_tvalid,
		M_AXIS_TDATA	=> m00_axis_tdata,
		M_AXIS_TSTRB	=> m00_axis_tstrb,
		M_AXIS_TLAST	=> m00_axis_tlast,
		M_AXIS_TREADY	=> m00_axis_tready
	);

-- Instantiation of Axi Bus Interface M01_AXIS
rom_weights_v1_0_M01_AXIS_inst : rom_weights_v1_0_M01_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M01_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M01_AXIS_START_COUNT
	)
	port map (
	   weights_input => weights2,
		M_AXIS_ACLK	=> m01_axis_aclk,
		M_AXIS_ARESETN	=> m01_axis_aresetn,
		M_AXIS_TVALID	=> m01_axis_tvalid,
		M_AXIS_TDATA	=> m01_axis_tdata,
		M_AXIS_TSTRB	=> m01_axis_tstrb,
		M_AXIS_TLAST	=> m01_axis_tlast,
		M_AXIS_TREADY	=> m01_axis_tready
	);

-- Instantiation of Axi Bus Interface M02_AXIS
rom_weights_v1_0_M02_AXIS_inst : rom_weights_v1_0_M02_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M02_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M02_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights3,
		M_AXIS_ACLK	=> m02_axis_aclk,
		M_AXIS_ARESETN	=> m02_axis_aresetn,
		M_AXIS_TVALID	=> m02_axis_tvalid,
		M_AXIS_TDATA	=> m02_axis_tdata,
		M_AXIS_TSTRB	=> m02_axis_tstrb,
		M_AXIS_TLAST	=> m02_axis_tlast,
		M_AXIS_TREADY	=> m02_axis_tready
	);

-- Instantiation of Axi Bus Interface M03_AXIS
rom_weights_v1_0_M03_AXIS_inst : rom_weights_v1_0_M03_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M03_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M03_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights4,
		M_AXIS_ACLK	=> m03_axis_aclk,
		M_AXIS_ARESETN	=> m03_axis_aresetn,
		M_AXIS_TVALID	=> m03_axis_tvalid,
		M_AXIS_TDATA	=> m03_axis_tdata,
		M_AXIS_TSTRB	=> m03_axis_tstrb,
		M_AXIS_TLAST	=> m03_axis_tlast,
		M_AXIS_TREADY	=> m03_axis_tready
	);

-- Instantiation of Axi Bus Interface M04_AXIS
rom_weights_v1_0_M04_AXIS_inst : rom_weights_v1_0_M04_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M04_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M04_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights5,
		M_AXIS_ACLK	=> m04_axis_aclk,
		M_AXIS_ARESETN	=> m04_axis_aresetn,
		M_AXIS_TVALID	=> m04_axis_tvalid,
		M_AXIS_TDATA	=> m04_axis_tdata,
		M_AXIS_TSTRB	=> m04_axis_tstrb,
		M_AXIS_TLAST	=> m04_axis_tlast,
		M_AXIS_TREADY	=> m04_axis_tready
	);

-- Instantiation of Axi Bus Interface M05_AXIS
rom_weights_v1_0_M05_AXIS_inst : rom_weights_v1_0_M05_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M05_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M05_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights6,
		M_AXIS_ACLK	=> m05_axis_aclk,
		M_AXIS_ARESETN	=> m05_axis_aresetn,
		M_AXIS_TVALID	=> m05_axis_tvalid,
		M_AXIS_TDATA	=> m05_axis_tdata,
		M_AXIS_TSTRB	=> m05_axis_tstrb,
		M_AXIS_TLAST	=> m05_axis_tlast,
		M_AXIS_TREADY	=> m05_axis_tready
	);

-- Instantiation of Axi Bus Interface M06_AXIS
rom_weights_v1_0_M06_AXIS_inst : rom_weights_v1_0_M06_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M06_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M06_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights7,
		M_AXIS_ACLK	=> m06_axis_aclk,
		M_AXIS_ARESETN	=> m06_axis_aresetn,
		M_AXIS_TVALID	=> m06_axis_tvalid,
		M_AXIS_TDATA	=> m06_axis_tdata,
		M_AXIS_TSTRB	=> m06_axis_tstrb,
		M_AXIS_TLAST	=> m06_axis_tlast,
		M_AXIS_TREADY	=> m06_axis_tready
	);

-- Instantiation of Axi Bus Interface M07_AXIS
rom_weights_v1_0_M07_AXIS_inst : rom_weights_v1_0_M07_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M07_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M07_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights8,
		M_AXIS_ACLK	=> m07_axis_aclk,
		M_AXIS_ARESETN	=> m07_axis_aresetn,
		M_AXIS_TVALID	=> m07_axis_tvalid,
		M_AXIS_TDATA	=> m07_axis_tdata,
		M_AXIS_TSTRB	=> m07_axis_tstrb,
		M_AXIS_TLAST	=> m07_axis_tlast,
		M_AXIS_TREADY	=> m07_axis_tready
	);

-- Instantiation of Axi Bus Interface M08_AXIS
rom_weights_v1_0_M08_AXIS_inst : rom_weights_v1_0_M08_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M08_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M08_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights9,
		M_AXIS_ACLK	=> m08_axis_aclk,
		M_AXIS_ARESETN	=> m08_axis_aresetn,
		M_AXIS_TVALID	=> m08_axis_tvalid,
		M_AXIS_TDATA	=> m08_axis_tdata,
		M_AXIS_TSTRB	=> m08_axis_tstrb,
		M_AXIS_TLAST	=> m08_axis_tlast,
		M_AXIS_TREADY	=> m08_axis_tready
	);

-- Instantiation of Axi Bus Interface M09_AXIS
rom_weights_v1_0_M09_AXIS_inst : rom_weights_v1_0_M09_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M09_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M09_AXIS_START_COUNT
	)
	port map (
	    weights_input => weights10,
		M_AXIS_ACLK	=> m09_axis_aclk,
		M_AXIS_ARESETN	=> m09_axis_aresetn,
		M_AXIS_TVALID	=> m09_axis_tvalid,
		M_AXIS_TDATA	=> m09_axis_tdata,
		M_AXIS_TSTRB	=> m09_axis_tstrb,
		M_AXIS_TLAST	=> m09_axis_tlast,
		M_AXIS_TREADY	=> m09_axis_tready
	);

	-- Add user logic here
rom_weights_ins: rom_weights
    port map(
        clk => m00_axis_aclk,
        romAddress => address_out,
        weights1 => weights1,
        weights2 => weights2,
        weights3 => weights3,
        weights4 => weights4,
        weights5 => weights5,
        weights6 => weights6,
        weights7 => weights7,
        weights8 => weights8,
        weights9 => weights9,
        weights10 => weights10
    );
	-- User logic ends

end arch_imp;
