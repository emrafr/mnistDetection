library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity stimulus_generator is
    generic (
        FILE_NAME: string := "input.txt";
        SAMPLE_WIDTH: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready : in std_logic;
        data_valid : out std_logic;
        stimulus_stream : out std_logic_vector(SAMPLE_WIDTH - 1 downto 0)
    );
end stimulus_generator;


architecture behavioral of stimulus_generator is

--    type state_type is (s_idle, s_read);
--    signal current_state, next_state : state_type;

--    signal reading : std_logic;
    --signal valid_next, valid_current : std_logic := '0';
    
    signal stimulus_sample: std_logic_vector(SAMPLE_WIDTH-1 downto 0) := (others => '0');

begin

--    process ( current_state)
--    begin 
--	case current_state is
--	    when s_read =>
--		  reading <= '1';
--	    when s_idle =>
--		  reading <= '0';
--	 end case;
--    end process;

    process (reset, clk)
        file test_vector_file: text open READ_MODE is FILE_NAME;
        variable file_row: line;
        variable stimulus_raw: std_logic_vector(SAMPLE_WIDTH-1 downto 0);
    begin
        if (reset = '0') then
            stimulus_sample <= (others => '0');  
            data_valid <= '0';
	        --current_state <= s_read;
	    --elsif ready = '1' then   	
            elsif rising_edge(clk) then
                --current_state <= next_state;
                stimulus_raw := (others => '0');
                if not endfile(test_vector_file) then
                    if ready = '1' then
                        readline(test_vector_file, file_row);
                        read(file_row, stimulus_raw);
                    end if;
                    data_valid <= '1';
                else
                    data_valid <= '0';          
                end if;
            stimulus_sample <= stimulus_raw;
            end if;
--        else 
--            data_valid <= '0';
--        end if;
    end process;
      
    stimulus_stream <= stimulus_sample;

end behavioral;
