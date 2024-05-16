library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conv_v2_0_M00_AXIS is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32

	); 
	port (
		-- Users to add ports here
        valid_output : in std_logic;
        conv_output : in std_logic_vector(7 downto 0);
		-- User ports ends
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
end conv_v2_0_M00_AXIS;

architecture implementation of conv_v2_0_M00_AXIS is
                    
	--type state_type is ( IDLE,        -- This is the initial/idle state                    
	                --SEND_STREAM);  -- In this state the                               
	                             -- stream data is output through M_AXIS_TDATA        
	-- State variable                                                                 
	--signal  current_state, next_state : state_type;         
	signal  current_output_reg, next_output_reg : std_logic_vector(31 downto 0);
	signal current_counter, next_counter : unsigned(2 downto 0);                                        
	signal current_output_counter, next_output_counter : unsigned(2 downto 0);                                        


begin
	-- I/O Connections assignments

	M_AXIS_TDATA	<= current_output_reg;
	M_AXIS_TLAST	<= '0';
	M_AXIS_TSTRB	<= (others => '1');


	-- Control state machine implementation                                               
	process(M_AXIS_ACLK)                                                                        
	begin                                                                                       
	  if (rising_edge (M_AXIS_ACLK)) then                                                       
	    if(M_AXIS_ARESETN = '0') then                                                           
	      -- Synchronous reset (active low)                                                     
	      --current_state      <= IDLE; 
	      current_output_reg <= (others => '0');
	      current_counter <= ( others => '0');                                                         
	      current_output_counter <= ( others => '0');                                                         
	    else 
	      -- current_state <= next_state;
	       current_output_reg <= next_output_reg;                                                                                                                                                                
	       current_counter <= next_counter;
	       current_output_counter <= next_output_counter;
	    end if;                                                                                 
	  end if;                                                                                   
	end process;    
	

	process(current_counter, current_output_reg, conv_output, valid_output, current_output_counter)
	begin
	   if valid_output = '1' then
	       next_output_reg <= current_output_reg(23 downto 0) & conv_output;
           if current_counter > 3 and valid_output = '1' then
               M_AXIS_TVALID <= '1';
               if current_output_counter >  6 then
                   next_counter <= (others => '0');
                   next_output_counter <= (others => '0');
               else
                   next_counter <= "001";
                   next_output_counter <= current_output_counter + 1;
               end if;
           else	           
               M_AXIS_TVALID <= '0'; 
               next_counter <= current_counter + 1;
               next_output_counter <= current_output_counter;
           end if;       
	   else
	       if current_output_counter < 7 and current_output_counter > 0 then
               if current_counter < 4 and current_counter > 0 then
                   M_AXIS_TVALID <= '0';
                   next_output_reg <= current_output_reg(23 downto 0) & "00000000";
                   next_counter <= current_counter + 1;
                   next_output_counter <= current_output_counter; 
               elsif current_counter > 3 then
                   next_output_reg <= current_output_reg;
                   M_AXIS_TVALID <= '1';
                   next_output_counter <= current_output_counter + 1;
                   next_counter <= (others => '0');
               else
                   M_AXIS_TVALID <= '0';
                   next_output_reg <= current_output_reg;
                   next_output_counter <= current_output_counter;
                   next_counter <= current_counter;
               end if;
	       	else
               M_AXIS_TVALID <= '0';
               next_output_reg <= current_output_reg;
               next_output_counter <= (others => '0');
               next_counter <= current_counter;
	       	end if;  	               
	   end if;
	   
	   
	   
	   
--	   if current_counter > 3 and valid_output = '1' then
--	       M_AXIS_TVALID <= '1';
--	       if current_output_counter >  6 then
--	           next_counter <= (others => '0');
--	           next_output_counter <= (others => '0');
--	       else
--	           next_counter <= "001";
--	           next_output_counter <= current_output_counter + 1;
--	       end if;
--	   else	           
--	   	   M_AXIS_TVALID <= '0'; 
--	       next_counter <= current_counter + 1;
--	       next_output_counter <= current_output_counter;
--	   end if;

--	   if current_counter > 3 then
--	       M_AXIS_TVALID <= '1';
--	       if valid_output = '1' then       
--	           next_output_reg <= current_output_reg(23 downto 0) & conv_output;
--	           next_counter <= "001";
--	       else
--               next_output_reg <= current_output_reg;
--               next_counter <= (others => '0');
--	       end if;
--	   else
--	   	   M_AXIS_TVALID <= '0';
--	       if valid_output = '1' then       
--	           next_output_reg <= current_output_reg(23 downto 0) & conv_output;
--	           next_counter <= current_counter + 1;
--	       else
--	           if current_counter < 4 then
--	               next_output_reg <= current_output_reg(23 downto 0) & "00000000";
--	               next_counter <= current_counter + 1;
--	           else
--                   next_output_reg <= current_output_reg;
--                   next_counter <= current_counter;
--               end if;
--	       end if;
--	   end if;
	       
	end process;                                                                            
end implementation;
