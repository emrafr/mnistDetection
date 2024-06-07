library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fully_connected_new_v1_0_M00_AXIS is
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
		last_check : out std_logic;
        valid_output : in std_logic;
        fc_output_1 : in std_logic_vector(31 downto 0);
        fc_output_2 : in std_logic_vector(31 downto 0);
        fc_output_3 : in std_logic_vector(31 downto 0);
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
end fully_connected_new_v1_0_M00_AXIS;

architecture implementation of fully_connected_new_v1_0_M00_AXIS is
type state_type is (s_idle, s_send);
signal current_input_1, next_input_1, current_input_2, next_input_2, current_input_3, next_input_3 : std_logic_vector(31 downto 0);
signal current_state, next_state : state_type;

begin

process(M_AXIS_ACLK, M_AXIS_ARESETN)
begin
    if M_AXIS_ARESETN = '0' then
        current_state <= s_idle;
        current_input_1 <= (others=>'0');
        current_input_2 <= (others=>'0');
        current_input_3 <= (others=>'0');
    elsif rising_edge(M_AXIS_ACLK) then
        current_state <= next_state;
        current_input_1 <= next_input_1;
        current_input_2 <= next_input_2;
        current_input_3 <= next_input_3;
    end if;
end process;

process(current_state, current_input_1, current_input_2, current_input_3, fc_output_1, fc_output_2, fc_output_3, M_AXIS_TREADY, valid_output)
begin
case current_state is
    when s_idle=>
        M_AXIS_TVALID <= '0';
        M_AXIS_TLAST <= '0';
        last_check <= '0';
        M_AXIS_TDATA <= (others => '0');
        if(valid_output ='1') then
            next_input_1 <= fc_output_1;
            next_input_2 <= fc_output_2;
            next_input_3 <= fc_output_3;
            next_state <= s_send;
        else
            next_input_1 <= current_input_1;
            next_input_2 <= current_input_2;
            next_input_3 <= current_input_3;
            next_state <= s_idle;
       end if;
       
   when s_send =>
         next_input_1 <= current_input_1;
        next_input_2 <= current_input_2;
        next_input_3 <= current_input_3;
        M_AXIS_TVALID <= '1';
        M_AXIS_TLAST <= '1';
        if(M_AXIS_TREADY = '1') then
            M_AXIS_TDATA <= (others => '0');
            --M_AXIS_TLAST <= '1';
            last_check <= '1';
            next_state <= s_idle;
            if(unsigned(current_input_1(31 downto 24))> 0) then
                M_AXIS_TDATA(0) <= '1';
            end if;
            if(unsigned(current_input_1(23 downto 16))> 0) then
                M_AXIS_TDATA(1) <= '1';
            end if;
            if(unsigned(current_input_1(15 downto 8))> 0) then
                M_AXIS_TDATA(2) <= '1';
            end if;
            if(unsigned(current_input_1(7 downto 0))> 0) then
                M_AXIS_TDATA(3) <= '1';
            end if;
            if(unsigned(current_input_2(31 downto 24))> 0) then
                M_AXIS_TDATA(4) <= '1';
            end if;
            if(unsigned(current_input_2(23 downto 16))> 0) then
                M_AXIS_TDATA(5) <= '1';
            end if;
            if(unsigned(current_input_2(15 downto 8))> 0) then
                M_AXIS_TDATA(6) <= '1';
            end if;
            if(unsigned(current_input_2(7 downto 0))> 0) then
                M_AXIS_TDATA(7) <= '1';
            end if;
            if(unsigned(current_input_3(31 downto 24))> 0) then
                M_AXIS_TDATA(8) <= '1';
            end if;
            if(unsigned(current_input_3(23 downto 16))> 0) then
                M_AXIS_TDATA(9) <= '1';
            end if;
        else
             --M_AXIS_TLAST <= '0';
             last_check <= '0';
             M_AXIS_TDATA <= (others => '0');
            next_state <= s_send;    
        end if;
end case;
end process;
	M_AXIS_TSTRB	<= (others => '1');
end implementation;
