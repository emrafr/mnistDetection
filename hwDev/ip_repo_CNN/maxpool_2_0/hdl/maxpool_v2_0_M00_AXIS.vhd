library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maxpool_v2_0_M00_AXIS is
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
end maxpool_v2_0_M00_AXIS;

architecture implementation of maxpool_v2_0_M00_AXIS is
                    
	type state_type is ( IDLE,        -- This is the initial/idle state                    
	                SEND_STREAM);  -- In this state the                               
	                             -- stream data is output through M_AXIS_TDATA        
	-- State variable                                                                 
	signal  current_state, next_state : state_type;         
	signal  current_output_reg, next_output_reg : std_logic_vector(255 downto 0);
	signal  current_save_reg, next_save_reg : std_logic_vector(255 downto 0);
	signal current_counter, next_counter : unsigned(10 downto 0);                                        
	signal current_counter2, next_counter2 : unsigned(3 downto 0);
	type FIFO_TYPE is array (0 to 200) of std_logic_vector(255 downto 0);
	signal stream_data_fifo : FIFO_TYPE;  
    signal write_pointer : integer range 0 to 200;
    signal read_pointer : integer range 0 to 200;
    signal fifo_wren : std_logic; 
    signal incr_rp : std_logic; 
    signal incr_wp : std_logic; 
                                      


begin
	-- I/O Connections assignments

	M_AXIS_TDATA	<= current_output_reg(255 downto 224);
	M_AXIS_TLAST	<= '0';
	M_AXIS_TSTRB	<= (others => '1');


	-- Control state machine implementation                                               
	process(M_AXIS_ACLK, incr_rp, incr_wp)                                                                        
	begin                                                                                       
	  if (rising_edge (M_AXIS_ACLK)) then                                                       
	    if(M_AXIS_ARESETN = '0') then                                                           
	      -- Synchronous reset (active low)                                                     
	      current_state      <= IDLE; 
	      current_output_reg <= (others => '0');
	      current_save_reg <= (others => '0');
	      current_counter <= ( others => '0');                                                         
	      current_counter2 <= ( others => '0');
	      write_pointer <= 0;                                                         
	      read_pointer <= 0;                                                         
	    else 
	       current_state <= next_state;
	       current_counter <= next_counter;
	       current_counter2 <= next_counter2;
	       current_output_reg <= next_output_reg;                                                                                                                                                                
	       current_save_reg <= next_save_reg;
	       if incr_rp = '1' then
	           read_pointer <= read_pointer + 1;
	       end if;
	       if incr_wp = '1' then
	           write_pointer <= write_pointer + 1;
--	       else
--	           write_pointer <= 0;
	       end if;                                                                                                                                                                
	    end if;                                                                                 
	  end if;                                                                                   
	end process;
--	fifo_wren <= valid_output;
--    process(fifo_wren, M_AXIS_ACLK)
--	  begin
--	    if (rising_edge (M_AXIS_ACLK)) then
--	      if (fifo_wren = '1') then
--	        stream_data_fifo(write_pointer) <= current_save_reg;
--	        incr_wp <= '1' ;
--	      else
--	        incr_wp <= '0';
--	      end if;
--	    end  if;
--	end process;    
	
	process(current_counter, current_output_reg, valid_output, current_state, current_counter2, M_AXIS_TREADY, mp_output, read_pointer, write_pointer)
	begin
	case current_state is
	when IDLE =>
	   M_AXIS_TVALID	<= '0';
       next_counter <= current_counter;
       next_counter2 <= current_counter2;
--       next_save_reg <= current_save_reg;
       if valid_output = '1' then       
           next_output_reg <= mp_output;
           next_save_reg <= mp_output;
           next_state <= SEND_STREAM;
           stream_data_fifo(write_pointer) <= mp_output;
           incr_wp <= '1' ;
           incr_rp <= '1';
       else
           next_output_reg <= current_output_reg;
           next_save_reg <= current_save_reg;
           next_state <= IDLE;
           incr_wp <= '0' ;
           incr_rp <= '0';
           
       end if;
       
	when SEND_STREAM =>
	   M_AXIS_TVALID	<= '1';
       if current_counter > 1350 then
           next_state <= IDLE;
           next_counter <=  (others => '0');
           next_counter2 <= (others => '0');
           next_output_reg <= current_output_reg;
--           next_save_reg <= current_save_reg;
           incr_rp <= '0';
       else
           next_state <= SEND_STREAM; 
           if M_AXIS_TREADY = '1' then
               next_counter <= current_counter + 1;

               if current_counter2 > 6 then
--                    next_output_reg <= current_save_reg(1023 downto 768);
                    next_output_reg <= stream_data_fifo(read_pointer);
                    incr_rp <= '1';
                    next_counter2 <= (others => '0');
               else 
                   next_output_reg <= current_output_reg(223 downto 0) & "00000000000000000000000000000000"; 
                   next_counter2 <= current_counter2 + 1;
                   incr_rp <= '0';
               end if;
           else
               incr_rp <= '0';
               next_counter <= current_counter;
               next_counter2 <= current_counter2;
               next_output_reg <= current_output_reg;
           end if;
           
           if valid_output = '1' then
                next_save_reg <= mp_output;
                stream_data_fifo(write_pointer) <= mp_output;
                incr_wp <= '1' ;
           else
                next_save_reg <= current_save_reg;
                incr_wp <= '0' ;
           end if;
       end if;
    
	end case;
	end process;     
                                                                       
end implementation;

