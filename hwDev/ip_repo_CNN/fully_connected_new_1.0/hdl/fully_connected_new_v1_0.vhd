library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fully_connected_new_v1_0 is
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

		-- Parameters of Axi Slave Bus Interface S08_AXIS
		C_S08_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S09_AXIS
		C_S09_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S10_AXIS
		C_S10_AXIS_TDATA_WIDTH	: integer	:= 32;
		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32

		-- Parameters of Axi Master Bus Interface M01_AXIS
--		C_M01_AXIS_TDATA_WIDTH	: integer	:= 32;
--		C_M01_AXIS_START_COUNT	: integer	:= 32;

--		-- Parameters of Axi Master Bus Interface M02_AXIS
--		C_M02_AXIS_TDATA_WIDTH	: integer	:= 32;
--		C_M02_AXIS_START_COUNT	: integer	:= 32
	);
	port (
	    last_check : out std_logic;
		-- Users to add ports here
        address : out std_logic_vector(10 downto 0);
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

		-- Ports of Axi Slave Bus Interface S08_AXIS
		s08_axis_aclk	: in std_logic;
		s08_axis_aresetn	: in std_logic;
		s08_axis_tready	: out std_logic;
		s08_axis_tdata	: in std_logic_vector(C_S08_AXIS_TDATA_WIDTH-1 downto 0);
		s08_axis_tstrb	: in std_logic_vector((C_S08_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s08_axis_tlast	: in std_logic;
		s08_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S09_AXIS
		s09_axis_aclk	: in std_logic;
		s09_axis_aresetn	: in std_logic;
		s09_axis_tready	: out std_logic;
		s09_axis_tdata	: in std_logic_vector(C_S09_AXIS_TDATA_WIDTH-1 downto 0);
		s09_axis_tstrb	: in std_logic_vector((C_S09_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s09_axis_tlast	: in std_logic;
		s09_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S10_AXIS
		s10_axis_aclk	: in std_logic;
		s10_axis_aresetn	: in std_logic;
		s10_axis_tready	: out std_logic;
		s10_axis_tdata	: in std_logic_vector(C_S10_AXIS_TDATA_WIDTH-1 downto 0);
		s10_axis_tstrb	: in std_logic_vector((C_S10_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s10_axis_tlast	: in std_logic;
		s10_axis_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk	: in std_logic;
		m00_axis_aresetn	: in std_logic;
		m00_axis_tvalid	: out std_logic;
		m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tstrb	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m00_axis_tlast	: out std_logic;
		m00_axis_tready	: in std_logic

--		-- Ports of Axi Master Bus Interface M01_AXIS
--		m01_axis_aclk	: in std_logic;
--		m01_axis_aresetn	: in std_logic;
--		m01_axis_tvalid	: out std_logic;
--		m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
--		m01_axis_tstrb	: out std_logic_vector((C_M01_AXIS_TDATA_WIDTH/8)-1 downto 0);
--		m01_axis_tlast	: out std_logic;
--		m01_axis_tready	: in std_logic;

--		-- Ports of Axi Master Bus Interface M02_AXIS
--		m02_axis_aclk	: in std_logic;
--		m02_axis_aresetn	: in std_logic;
--		m02_axis_tvalid	: out std_logic;
--		m02_axis_tdata	: out std_logic_vector(C_M02_AXIS_TDATA_WIDTH-1 downto 0);
--		m02_axis_tstrb	: out std_logic_vector((C_M02_AXIS_TDATA_WIDTH/8)-1 downto 0);
--		m02_axis_tlast	: out std_logic;
--		m02_axis_tready	: in std_logic
	);
end fully_connected_new_v1_0; 

architecture arch_imp of fully_connected_new_v1_0 is

	-- component declaration
	component fully_connected_new_v1_0_S00_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
	    address: out std_logic_vector(10 downto 0);
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S00_AXIS;

	component fully_connected_new_v1_0_S01_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S01_AXIS;

	component fully_connected_new_v1_0_S02_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S02_AXIS;

	component fully_connected_new_v1_0_S03_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S03_AXIS;

	component fully_connected_new_v1_0_S04_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S04_AXIS;

	component fully_connected_new_v1_0_S05_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S05_AXIS;

	component fully_connected_new_v1_0_S06_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S06_AXIS;

	component fully_connected_new_v1_0_S07_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S07_AXIS;

	component fully_connected_new_v1_0_S08_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S08_AXIS;

	component fully_connected_new_v1_0_S09_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S09_AXIS;

	component fully_connected_new_v1_0_S10_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(159 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component fully_connected_new_v1_0_S10_AXIS;

	component fully_connected_new_v1_0_M00_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
	    last_check : out std_logic;
		valid_output : in std_logic;
        fc_output_1 : in std_logic_vector(31 downto 0);
        fc_output_2 : in std_logic_vector(31 downto 0);
        fc_output_3 : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component fully_connected_new_v1_0_M00_AXIS;

--	component fully_connected_new_v1_0_M01_AXIS is
--		generic (
--		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
--		C_M_START_COUNT	: integer	:= 32
--		);
--		port (
--		valid_output : in std_logic;
--        fc_output : in std_logic_vector(31 downto 0);
--		M_AXIS_ACLK	: in std_logic;
--		M_AXIS_ARESETN	: in std_logic;
--		M_AXIS_TVALID	: out std_logic;
--		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
--		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
--		M_AXIS_TLAST	: out std_logic;
--		M_AXIS_TREADY	: in std_logic
--		);
--	end component fully_connected_new_v1_0_M01_AXIS;

--	component fully_connected_new_v1_0_M02_AXIS is
--		generic (
--		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
--		C_M_START_COUNT	: integer	:= 32
--		);
--		port (
--		valid_output : in std_logic;
--        fc_output : in std_logic_vector(31 downto 0);
--		M_AXIS_ACLK	: in std_logic;
--		M_AXIS_ARESETN	: in std_logic;
--		M_AXIS_TVALID	: out std_logic;
--		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
--		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
--		M_AXIS_TLAST	: out std_logic;
--		M_AXIS_TREADY	: in std_logic
--		);
--	end component fully_connected_new_v1_0_M02_AXIS;
	
	component fullyconnected is
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
    end component fullyconnected; 

signal fc_input, fc_weights_1, fc_weights_2 , fc_weights_3, fc_weights_4, fc_weights_5, fc_weights_6, fc_weights_7, fc_weights_8, fc_weights_9, fc_weights_10 : std_logic_vector(159 downto 0);
signal fc_output_1, fc_output_2, fc_output_3 : std_logic_vector(31 downto 0);
signal fc_output : std_logic_vector(79 downto 0);
signal ready, valid_input, valid_output, valid_weights_1, valid_weights_2, valid_weights_3, valid_weights_4, valid_weights_5, valid_weights_6, valid_weights_7, valid_weights_8, valid_weights_9, valid_weights_10 : std_logic;
--signal address : std_logic_vector(10 downto 0);
begin

-- Instantiation of Axi Bus Interface S00_AXIS
fully_connected_new_v1_0_S00_AXIS_inst : fully_connected_new_v1_0_S00_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S00_AXIS_TDATA_WIDTH
	)
	port map (
	    address => address,
	    output_row => fc_input,
		output_valid => valid_input,
		ready_conv => ready,
		S_AXIS_ACLK	=> s00_axis_aclk,
		S_AXIS_ARESETN	=> s00_axis_aresetn,
		S_AXIS_TREADY	=> s00_axis_tready,
		S_AXIS_TDATA	=> s00_axis_tdata,
		S_AXIS_TSTRB	=> s00_axis_tstrb,
		S_AXIS_TLAST	=> s00_axis_tlast,
		S_AXIS_TVALID	=> s00_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S01_AXIS
fully_connected_new_v1_0_S01_AXIS_inst : fully_connected_new_v1_0_S01_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S01_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_1,
		output_valid => valid_weights_1,
		ready_conv => ready,
		S_AXIS_ACLK	=> s01_axis_aclk,
		S_AXIS_ARESETN	=> s01_axis_aresetn,
		S_AXIS_TREADY	=> s01_axis_tready,
		S_AXIS_TDATA	=> s01_axis_tdata,
		S_AXIS_TSTRB	=> s01_axis_tstrb,
		S_AXIS_TLAST	=> s01_axis_tlast,
		S_AXIS_TVALID	=> s01_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S02_AXIS
fully_connected_new_v1_0_S02_AXIS_inst : fully_connected_new_v1_0_S02_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S02_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_2,
		output_valid => valid_weights_2,
		ready_conv => ready,
		S_AXIS_ACLK	=> s02_axis_aclk,
		S_AXIS_ARESETN	=> s02_axis_aresetn,
		S_AXIS_TREADY	=> s02_axis_tready,
		S_AXIS_TDATA	=> s02_axis_tdata,
		S_AXIS_TSTRB	=> s02_axis_tstrb,
		S_AXIS_TLAST	=> s02_axis_tlast,
		S_AXIS_TVALID	=> s02_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S03_AXIS
fully_connected_new_v1_0_S03_AXIS_inst : fully_connected_new_v1_0_S03_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S03_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_3,
		output_valid => valid_weights_3,
		ready_conv => ready,
		S_AXIS_ACLK	=> s03_axis_aclk,
		S_AXIS_ARESETN	=> s03_axis_aresetn,
		S_AXIS_TREADY	=> s03_axis_tready,
		S_AXIS_TDATA	=> s03_axis_tdata,
		S_AXIS_TSTRB	=> s03_axis_tstrb,
		S_AXIS_TLAST	=> s03_axis_tlast,
		S_AXIS_TVALID	=> s03_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S04_AXIS
fully_connected_new_v1_0_S04_AXIS_inst : fully_connected_new_v1_0_S04_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S04_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_4,
		output_valid => valid_weights_4,
		ready_conv => ready,
		S_AXIS_ACLK	=> s04_axis_aclk,
		S_AXIS_ARESETN	=> s04_axis_aresetn,
		S_AXIS_TREADY	=> s04_axis_tready,
		S_AXIS_TDATA	=> s04_axis_tdata,
		S_AXIS_TSTRB	=> s04_axis_tstrb,
		S_AXIS_TLAST	=> s04_axis_tlast,
		S_AXIS_TVALID	=> s04_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S05_AXIS
fully_connected_new_v1_0_S05_AXIS_inst : fully_connected_new_v1_0_S05_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S05_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_5,
		output_valid => valid_weights_5,
		ready_conv => ready,
		S_AXIS_ACLK	=> s05_axis_aclk,
		S_AXIS_ARESETN	=> s05_axis_aresetn,
		S_AXIS_TREADY	=> s05_axis_tready,
		S_AXIS_TDATA	=> s05_axis_tdata,
		S_AXIS_TSTRB	=> s05_axis_tstrb,
		S_AXIS_TLAST	=> s05_axis_tlast,
		S_AXIS_TVALID	=> s05_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S06_AXIS
fully_connected_new_v1_0_S06_AXIS_inst : fully_connected_new_v1_0_S06_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S06_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_6,
		output_valid => valid_weights_6,
		ready_conv => ready,
		S_AXIS_ACLK	=> s06_axis_aclk,
		S_AXIS_ARESETN	=> s06_axis_aresetn,
		S_AXIS_TREADY	=> s06_axis_tready,
		S_AXIS_TDATA	=> s06_axis_tdata,
		S_AXIS_TSTRB	=> s06_axis_tstrb,
		S_AXIS_TLAST	=> s06_axis_tlast,
		S_AXIS_TVALID	=> s06_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S07_AXIS
fully_connected_new_v1_0_S07_AXIS_inst : fully_connected_new_v1_0_S07_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S07_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_7,
		output_valid => valid_weights_7,
		ready_conv => ready,
		S_AXIS_ACLK	=> s07_axis_aclk,
		S_AXIS_ARESETN	=> s07_axis_aresetn,
		S_AXIS_TREADY	=> s07_axis_tready,
		S_AXIS_TDATA	=> s07_axis_tdata,
		S_AXIS_TSTRB	=> s07_axis_tstrb,
		S_AXIS_TLAST	=> s07_axis_tlast,
		S_AXIS_TVALID	=> s07_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S08_AXIS
fully_connected_new_v1_0_S08_AXIS_inst : fully_connected_new_v1_0_S08_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S08_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_8,
		output_valid => valid_weights_8,
		ready_conv => ready,
		S_AXIS_ACLK	=> s08_axis_aclk,
		S_AXIS_ARESETN	=> s08_axis_aresetn,
		S_AXIS_TREADY	=> s08_axis_tready,
		S_AXIS_TDATA	=> s08_axis_tdata,
		S_AXIS_TSTRB	=> s08_axis_tstrb,
		S_AXIS_TLAST	=> s08_axis_tlast,
		S_AXIS_TVALID	=> s08_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S09_AXIS
fully_connected_new_v1_0_S09_AXIS_inst : fully_connected_new_v1_0_S09_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S09_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_9,
		output_valid => valid_weights_9,
		ready_conv => ready,
		S_AXIS_ACLK	=> s09_axis_aclk,
		S_AXIS_ARESETN	=> s09_axis_aresetn,
		S_AXIS_TREADY	=> s09_axis_tready,
		S_AXIS_TDATA	=> s09_axis_tdata,
		S_AXIS_TSTRB	=> s09_axis_tstrb,
		S_AXIS_TLAST	=> s09_axis_tlast,
		S_AXIS_TVALID	=> s09_axis_tvalid
	);

-- Instantiation of Axi Bus Interface S10_AXIS
fully_connected_new_v1_0_S10_AXIS_inst : fully_connected_new_v1_0_S10_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S10_AXIS_TDATA_WIDTH
	)
	port map (
	    output_row => fc_weights_10,
		output_valid => valid_weights_10,
		ready_conv => ready,
		S_AXIS_ACLK	=> s10_axis_aclk,
		S_AXIS_ARESETN	=> s10_axis_aresetn,
		S_AXIS_TREADY	=> s10_axis_tready,
		S_AXIS_TDATA	=> s10_axis_tdata,
		S_AXIS_TSTRB	=> s10_axis_tstrb,
		S_AXIS_TLAST	=> s10_axis_tlast,
		S_AXIS_TVALID	=> s10_axis_tvalid
	);


-- Instantiation of Axi Bus Interface M00_AXIS
fully_connected_new_v1_0_M00_AXIS_inst : fully_connected_new_v1_0_M00_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
	)
	port map (
	     last_check => last_check,
	    valid_output => valid_output,
        fc_output_1 => fc_output_1,
        fc_output_2 => fc_output_2,
        fc_output_3 => fc_output_3,
		M_AXIS_ACLK	=> m00_axis_aclk,
		M_AXIS_ARESETN	=> m00_axis_aresetn,
		M_AXIS_TVALID	=> m00_axis_tvalid,
		M_AXIS_TDATA	=> m00_axis_tdata,
		M_AXIS_TSTRB	=> m00_axis_tstrb,
		M_AXIS_TLAST	=> m00_axis_tlast,
		M_AXIS_TREADY	=> m00_axis_tready
	);

-- Instantiation of Axi Bus Interface M01_AXIS
--fully_connected_new_v1_0_M01_AXIS_inst : fully_connected_new_v1_0_M01_AXIS
--	generic map (
--		C_M_AXIS_TDATA_WIDTH	=> C_M01_AXIS_TDATA_WIDTH,
--		C_M_START_COUNT	=> C_M01_AXIS_START_COUNT
--	)
--	port map (
--	    valid_output => valid_output,
--        fc_output => fc_output_2,
--		M_AXIS_ACLK	=> m01_axis_aclk,
--		M_AXIS_ARESETN	=> m01_axis_aresetn,
--		M_AXIS_TVALID	=> m01_axis_tvalid,
--		M_AXIS_TDATA	=> m01_axis_tdata,
--		M_AXIS_TSTRB	=> m01_axis_tstrb,
--		M_AXIS_TLAST	=> m01_axis_tlast,
--		M_AXIS_TREADY	=> m01_axis_tready
--	);

---- Instantiation of Axi Bus Interface M02_AXIS
--fully_connected_new_v1_0_M02_AXIS_inst : fully_connected_new_v1_0_M02_AXIS
--	generic map (
--		C_M_AXIS_TDATA_WIDTH	=> C_M02_AXIS_TDATA_WIDTH,
--		C_M_START_COUNT	=> C_M02_AXIS_START_COUNT
--	)
--	port map (
--	    valid_output => valid_output,
--        fc_output => fc_output_3,
--		M_AXIS_ACLK	=> m02_axis_aclk,
--		M_AXIS_ARESETN	=> m02_axis_aresetn,
--		M_AXIS_TVALID	=> m02_axis_tvalid,
--		M_AXIS_TDATA	=> m02_axis_tdata,
--		M_AXIS_TSTRB	=> m02_axis_tstrb,
--		M_AXIS_TLAST	=> m02_axis_tlast,
--		M_AXIS_TREADY	=> m02_axis_tready
--	);
	
	fc: fullyconnected
    Port map ( 
        clk => s00_axis_aclk,
        reset => s00_axis_aresetn,
        valid_input => valid_input,
        fc_input => fc_input,
        fc_weights_1 => fc_weights_1,
        fc_weights_2 => fc_weights_2,
        fc_weights_3 => fc_weights_3,
        fc_weights_4 => fc_weights_4,
        fc_weights_5 => fc_weights_5,
        fc_weights_6 => fc_weights_6,
        fc_weights_7 => fc_weights_7,
        fc_weights_8 => fc_weights_8,
        fc_weights_9 => fc_weights_9,
        fc_weights_10 => fc_weights_10,
        valid_output => valid_output,
        ready => ready,
        fc_output => fc_output
    );
    
fc_output_1 <= fc_output(79 downto 48);
fc_output_2 <= fc_output(47 downto 16);
fc_output_3 <= fc_output(15 downto 0) & "0000000000000000";

	-- Add user logic here

	-- User logic ends

end arch_imp;
