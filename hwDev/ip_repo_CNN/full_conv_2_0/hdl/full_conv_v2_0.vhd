library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_conv_v2_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;

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
end full_conv_v2_0;

architecture arch_imp of full_conv_v2_0 is
    component conv is
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
    end component; 
	-- component declaration
	component full_conv_v2_0_S00_AXIS is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		output_row : out std_logic_vector(223 downto 0);
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
	end component full_conv_v2_0_S00_AXIS;

	component full_conv_v2_0_M00_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M00_AXIS;

	component full_conv_v2_0_M01_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M01_AXIS;

	component full_conv_v2_0_M02_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M02_AXIS;

	component full_conv_v2_0_M03_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (		
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M03_AXIS;

	component full_conv_v2_0_M04_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (		
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M04_AXIS;

	component full_conv_v2_0_M05_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (		
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M05_AXIS;

	component full_conv_v2_0_M06_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (		
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M06_AXIS;

	component full_conv_v2_0_M07_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (		
		valid_output : in std_logic;
        conv_output : in std_logic_vector(31 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component full_conv_v2_0_M07_AXIS;
signal conv_input : std_logic_vector(223 downto 0);
signal conv_output0, conv_output1, conv_output2, conv_output3, conv_output4, conv_output5, conv_output6, conv_output7 : std_logic_vector(31 downto 0);
signal ready, valid_input, valid_output : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXIS
full_conv_v2_0_S00_AXIS_inst : full_conv_v2_0_S00_AXIS
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S00_AXIS_TDATA_WIDTH
	)
	port map (
		output_row => conv_input,
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

-- Instantiation of Axi Bus Interface M00_AXIS
full_conv_v2_0_M00_AXIS_inst : full_conv_v2_0_M00_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output0,
		M_AXIS_ACLK	=> m00_axis_aclk,
		M_AXIS_ARESETN	=> m00_axis_aresetn,
		M_AXIS_TVALID	=> m00_axis_tvalid,
		M_AXIS_TDATA	=> m00_axis_tdata,
		M_AXIS_TSTRB	=> m00_axis_tstrb,
		M_AXIS_TLAST	=> m00_axis_tlast,
		M_AXIS_TREADY	=> m00_axis_tready
	);

-- Instantiation of Axi Bus Interface M01_AXIS
full_conv_v2_0_M01_AXIS_inst : full_conv_v2_0_M01_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M01_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M01_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output1,
		M_AXIS_ACLK	=> m01_axis_aclk,
		M_AXIS_ARESETN	=> m01_axis_aresetn,
		M_AXIS_TVALID	=> m01_axis_tvalid,
		M_AXIS_TDATA	=> m01_axis_tdata,
		M_AXIS_TSTRB	=> m01_axis_tstrb,
		M_AXIS_TLAST	=> m01_axis_tlast,
		M_AXIS_TREADY	=> m01_axis_tready
	);

-- Instantiation of Axi Bus Interface M02_AXIS
full_conv_v2_0_M02_AXIS_inst : full_conv_v2_0_M02_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M02_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M02_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output2,
		M_AXIS_ACLK	=> m02_axis_aclk,
		M_AXIS_ARESETN	=> m02_axis_aresetn,
		M_AXIS_TVALID	=> m02_axis_tvalid,
		M_AXIS_TDATA	=> m02_axis_tdata,
		M_AXIS_TSTRB	=> m02_axis_tstrb,
		M_AXIS_TLAST	=> m02_axis_tlast,
		M_AXIS_TREADY	=> m02_axis_tready
	);

-- Instantiation of Axi Bus Interface M03_AXIS
full_conv_v2_0_M03_AXIS_inst : full_conv_v2_0_M03_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M03_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M03_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output3,
		M_AXIS_ACLK	=> m03_axis_aclk,
		M_AXIS_ARESETN	=> m03_axis_aresetn,
		M_AXIS_TVALID	=> m03_axis_tvalid,
		M_AXIS_TDATA	=> m03_axis_tdata,
		M_AXIS_TSTRB	=> m03_axis_tstrb,
		M_AXIS_TLAST	=> m03_axis_tlast,
		M_AXIS_TREADY	=> m03_axis_tready
	);

-- Instantiation of Axi Bus Interface M04_AXIS
full_conv_v2_0_M04_AXIS_inst : full_conv_v2_0_M04_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M04_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M04_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output4,
		M_AXIS_ACLK	=> m04_axis_aclk,
		M_AXIS_ARESETN	=> m04_axis_aresetn,
		M_AXIS_TVALID	=> m04_axis_tvalid,
		M_AXIS_TDATA	=> m04_axis_tdata,
		M_AXIS_TSTRB	=> m04_axis_tstrb,
		M_AXIS_TLAST	=> m04_axis_tlast,
		M_AXIS_TREADY	=> m04_axis_tready
	);

-- Instantiation of Axi Bus Interface M05_AXIS
full_conv_v2_0_M05_AXIS_inst : full_conv_v2_0_M05_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M05_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M05_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output5,
		M_AXIS_ACLK	=> m05_axis_aclk,
		M_AXIS_ARESETN	=> m05_axis_aresetn,
		M_AXIS_TVALID	=> m05_axis_tvalid,
		M_AXIS_TDATA	=> m05_axis_tdata,
		M_AXIS_TSTRB	=> m05_axis_tstrb,
		M_AXIS_TLAST	=> m05_axis_tlast,
		M_AXIS_TREADY	=> m05_axis_tready
	);

-- Instantiation of Axi Bus Interface M06_AXIS
full_conv_v2_0_M06_AXIS_inst : full_conv_v2_0_M06_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M06_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M06_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output6,
		M_AXIS_ACLK	=> m06_axis_aclk,
		M_AXIS_ARESETN	=> m06_axis_aresetn,
		M_AXIS_TVALID	=> m06_axis_tvalid,
		M_AXIS_TDATA	=> m06_axis_tdata,
		M_AXIS_TSTRB	=> m06_axis_tstrb,
		M_AXIS_TLAST	=> m06_axis_tlast,
		M_AXIS_TREADY	=> m06_axis_tready
	);

-- Instantiation of Axi Bus Interface M07_AXIS
full_conv_v2_0_M07_AXIS_inst : full_conv_v2_0_M07_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> C_M07_AXIS_TDATA_WIDTH,
		C_M_START_COUNT	=> C_M07_AXIS_START_COUNT
	)
	port map (		
		valid_output => valid_output,
        conv_output => conv_output7,
		M_AXIS_ACLK	=> m07_axis_aclk,
		M_AXIS_ARESETN	=> m07_axis_aresetn,
		M_AXIS_TVALID	=> m07_axis_tvalid,
		M_AXIS_TDATA	=> m07_axis_tdata,
		M_AXIS_TSTRB	=> m07_axis_tstrb,
		M_AXIS_TLAST	=> m07_axis_tlast,
		M_AXIS_TREADY	=> m07_axis_tready
	);

	-- Add user logic here
conv_inst : conv 
    Port map ( 
        clk => s00_axis_aclk,
        reset => s00_axis_aresetn,
        valid_input => valid_input,
        conv_input => conv_input,
        ready => ready,
        valid_output => valid_output,
        conv_output0 => conv_output0,       
        conv_output1 => conv_output1,        
        conv_output2 => conv_output2,         
        conv_output3 => conv_output3,        
        conv_output4 => conv_output4,         
        conv_output5 => conv_output5,         
        conv_output6 => conv_output6,         
        conv_output7 => conv_output7         
    ); 
	-- User logic ends

end arch_imp;
