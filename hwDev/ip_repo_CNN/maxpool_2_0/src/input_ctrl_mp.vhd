library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_ctrl_mp is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
	    mp_ready : in std_logic;
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
end input_ctrl_mp;

architecture arch_imp of input_ctrl_mp is

type state_type is (s_idle, s_shift);
signal current_state, next_state : state_type;
signal next_rows1, current_rows1 : std_logic_vector(415 downto 0);
signal next_rows2, current_rows2 : std_logic_vector(415 downto 0);
signal next_rows3, current_rows3 : std_logic_vector(415 downto 0);
signal next_rows4, current_rows4 : std_logic_vector(415 downto 0);
signal next_counter, current_counter : unsigned(5 downto 0);



begin
	-- I/O Connections assignments
	-- Control state machine implementation
	process(S_AXIS_ACLK)
	begin
	  if (rising_edge (S_AXIS_ACLK)) then
	    if(S_AXIS_ARESETN = '0') then
            current_rows1 <= (others => '0');
            current_rows2 <= (others => '0');
            current_rows3 <= (others => '0');
            current_rows4 <= (others => '0');
            current_counter <= (others => '0');
            current_state <= s_idle;
	    else
            current_rows1 <= next_rows1;
            current_rows2 <= next_rows2;
            current_rows3 <= next_rows3;
            current_rows4 <= next_rows4;
            current_counter <= next_counter;
            current_state <= next_state;
	    end if;  
	  end if;
	end process;

	-- Add user logic here
	process(current_state, S_AXIS_TVALID, current_counter, mp_ready, S_AXIS_TDATA )
	begin
	case current_state is
        when s_idle =>
            S_AXIS_TREADY <= '0';
            valid_rows <= '0';
--            next_rows1 <= current_rows1;
--            next_rows2 <= current_rows2;
--            next_rows3 <= current_rows3;
--            next_rows4 <= current_rows4;
            if S_AXIS_TVALID = '1' then
                next_state <= s_shift;
                next_rows1 <= current_rows1(407 downto 0) & S_AXIS_TDATA(31 downto 24);
                next_rows2 <= current_rows2(407 downto 0) & S_AXIS_TDATA(23 downto 16);
                next_rows3 <= current_rows3(407 downto 0) & S_AXIS_TDATA(15 downto 8);
                next_rows4 <= current_rows4(407 downto 0) & S_AXIS_TDATA(7 downto 0);
                next_counter <= current_counter + 1;
            else
                next_state <= s_idle;
                next_rows1 <= current_rows1;
                next_rows2 <= current_rows2;
                next_rows3 <= current_rows3;
                next_rows4 <= current_rows4;
                next_counter <= current_counter;
            end if;
            
        when s_shift =>
            if current_counter > 51 then
                S_AXIS_TREADY <= '0'; 
                valid_rows <= '1';
                next_rows1 <= current_rows1;
                next_rows2 <= current_rows2;
                next_rows3 <= current_rows3;
                next_rows4 <= current_rows4;
                if mp_ready = '1' then
                    next_state <= s_idle;
                    next_counter <= (others => '0');
                else
                    next_state <= s_shift;
                    next_counter <= current_counter;
                end if;
            else
                S_AXIS_TREADY <= '1'; 
                valid_rows <= '0';
                next_state <= s_shift;
                if S_AXIS_TVALID = '1' then
                    next_rows1 <= current_rows1(407 downto 0) & S_AXIS_TDATA(31 downto 24);
                    next_rows2 <= current_rows2(407 downto 0) & S_AXIS_TDATA(23 downto 16);
                    next_rows3 <= current_rows3(407 downto 0) & S_AXIS_TDATA(15 downto 8);
                    next_rows4 <= current_rows4(407 downto 0) & S_AXIS_TDATA(7 downto 0);
                    next_counter <= current_counter + 1;
                else
                    next_rows1 <= current_rows1;
                    next_rows2 <= current_rows2;
                    next_rows3 <= current_rows3;
                    next_rows4 <= current_rows4;
                    next_counter <= current_counter;
                end if;
             end if;                
    end case;
	end process;
    rows1 <= current_rows1;
    rows2 <= current_rows2;
    rows3 <= current_rows3;
    rows4 <= current_rows4;
	-- User logic ends

end arch_imp;
