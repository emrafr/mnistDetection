library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_conv_v2_0_S00_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
		output_row : out std_logic_vector(223 downto 0);
		output_valid : out std_logic;
		ready_conv : in std_logic;
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
end full_conv_v2_0_S00_AXIS;

architecture arch_imp of full_conv_v2_0_S00_AXIS is 

	-- Total number of input data.
	constant NUMBER_OF_INPUT_WORDS  : integer := 7;

	type state is ( IDLE,        -- This is the initial/idle state 
	                WRITE_FIFO); -- In this state FIFO is written with the
	                             -- input stream data S_AXIS_TDATA 
	                 
	signal axis_tready	: std_logic;
	-- State variable
	signal  mst_exec_state : state;  
	-- FIFO implementation signals
	signal  byte_index : integer;    
	-- FIFO write enable
	signal fifo_wren : std_logic;
	-- FIFO full flag
	signal fifo_full_flag : std_logic;
	-- FIFO write pointer
	signal write_pointer : integer range 0 to 7 ;
	signal counter : integer range 0 to 1800 ;
	signal counter2 : integer range 0 to 1800 ;
	-- sink has accepted all the streaming data and stored in FIFO
	signal writes_done : std_logic;
	
	type state_type is (s_init, s_send_data);
	signal current_state, next_state : state_type;
	signal current_row_reg, next_row_reg : std_logic_vector(223 downto 0);
    --changed fifo word length from byte(8bits) to 32bits
	type BYTE_FIFO_TYPE is array (0 to (NUMBER_OF_INPUT_WORDS-1)) of std_logic_vector(((C_S_AXIS_TDATA_WIDTH)-1)downto 0);
	signal stream_data_fifo : BYTE_FIFO_TYPE;
begin
	-- I/O Connections assignments

	S_AXIS_TREADY	<= axis_tready;
	-- Control state machine implementation
	process(S_AXIS_ACLK)
	begin
	  if (rising_edge (S_AXIS_ACLK)) then
	    if(S_AXIS_ARESETN = '0') then
	      -- Synchronous reset (active low)
	      mst_exec_state      <= IDLE;
	      current_row_reg <= (others => '0');
	      current_state <= s_init;
	      counter <= 0;
	      counter2 <= 0;
	    else
	       current_state <= next_state;
	       current_row_reg <= next_row_reg;
	       if counter2 < 1800 then
	           counter2 <= counter2 + 1;
	       else
	           counter2 <= 0;
	       end if;
	      case (mst_exec_state) is
	        when IDLE     => 
	          -- The sink starts accepting tdata when 
	          -- there tvalid is asserted to mark the
	          -- presence of 1798 streaming data 
	          if counter2 > 1798 then
	               counter <= 0;
	          end if;
	          if (S_AXIS_TVALID = '1' and counter < 187)then
	            mst_exec_state <= WRITE_FIFO;
	            --counter <= counter + 1;
	          else
	            mst_exec_state <= IDLE;
	          end if;
	      
	        when WRITE_FIFO => 
	          -- When the sink has accepted all the streaming input data,
	          -- the interface swiches functionality to a streaming master
	          if (writes_done = '1') then
	            mst_exec_state <= IDLE;
	          else
	            -- The sink accepts and stores tdata 
	            -- into FIFO
	            counter <= counter + 1;
	            mst_exec_state <= WRITE_FIFO;
	          end if;
	        
	        when others    => 
	          mst_exec_state <= IDLE;
	        
	      end case;
	    end if;  
	  end if;
	end process;
	-- AXI Streaming Sink 
	-- 
	-- The example design sink is always ready to accept the S_AXIS_TDATA  until
	-- the FIFO is not filled with NUMBER_OF_INPUT_WORDS number of input words.
	axis_tready <= '1' when ((mst_exec_state = WRITE_FIFO) and (write_pointer <= NUMBER_OF_INPUT_WORDS-1)) else '0';

	process(S_AXIS_ACLK)
	begin
	  if (rising_edge (S_AXIS_ACLK)) then
	    if(S_AXIS_ARESETN = '0') then
	       write_pointer <= 0;
	      writes_done <= '0';
	    else
	      if (write_pointer <= NUMBER_OF_INPUT_WORDS-1) then
	        if (fifo_wren = '1') then
	          -- write pointer is incremented after every write to the FIFO
	          -- when FIFO write signal is enabled.
	          write_pointer <= write_pointer + 1;
	          writes_done <= '0';
	        end if;
	        
	        if ((write_pointer >= NUMBER_OF_INPUT_WORDS-1) or S_AXIS_TLAST = '1') then
	          -- reads_done is asserted when NUMBER_OF_INPUT_WORDS numbers of streaming data 
	          -- has been written to the FIFO which is also marked by S_AXIS_TLAST(kept for optional usage).
	          writes_done <= '1';
	          if ready_conv = '1' then
	               write_pointer <= 0;
	          end if;
	        end if;
	      elsif ((write_pointer >= NUMBER_OF_INPUT_WORDS-1)) then
	          if ready_conv = '1' then
	               writes_done <= '0';
	               write_pointer <= 0;
	          end if;
	      end  if;
	    end if;
	  end if;
	end process;

	-- FIFO write enable generation
	fifo_wren <= S_AXIS_TVALID and axis_tready;

	-- FIFO Implementation

	  process(S_AXIS_ACLK)
	  begin
	    if (rising_edge (S_AXIS_ACLK)) then
	      if (fifo_wren = '1') then
	        stream_data_fifo(write_pointer) <= S_AXIS_TDATA(31 downto 0);
	      end if;  
	    end  if;
	  end process;

	-- Add user logic here
process(writes_done, stream_data_fifo, ready_conv, current_row_reg, current_state)
begin
case current_state is
when s_init =>
    output_valid <= '0';
    if writes_done = '1' then
        next_state <= s_send_data;
        next_row_reg <= stream_data_fifo(0) & stream_data_fifo(1) & stream_data_fifo(2) & stream_data_fifo(3) & stream_data_fifo(4) & stream_data_fifo(5) & stream_data_fifo(6);
    else
        next_state <= s_init;
        next_row_reg <= current_row_reg;

    end if;
when s_send_data =>
    output_valid <= '1';
    next_row_reg <= current_row_reg;
    if ready_conv = '1' then
        next_state <= s_init;
    else
        next_state <= s_send_data;
    end if;
end case;
    
        
end process;
output_row <= current_row_reg;
	-- User logic ends

end arch_imp;
