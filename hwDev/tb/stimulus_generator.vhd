library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity stimulus_generator is
    generic (
        FILE_NAME: string := "input.txt";
        FILE_NAME2: string := "input.txt";
        SAMPLE_WIDTH: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready : in std_logic;
        tvalid_m : in std_logic;
        data_valid : out std_logic;
        stimulus_stream : out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream2 : out std_logic_vector(SAMPLE_WIDTH - 1 downto 0)
    );
end stimulus_generator;


architecture behavioral of stimulus_generator is
    type state_type is (idle, send);
    signal current_state, next_state : state_type;
    
    signal stimulus_sample, stimulus_sample2: std_logic_vector(SAMPLE_WIDTH-1 downto 0) := (others => '0');
    signal begin_reading : std_logic;
begin
    process (reset, clk, current_state, ready, begin_reading)
        file test_vector_file: text open READ_MODE is FILE_NAME;
        variable file_row: line;
        variable stimulus_raw: std_logic_vector(SAMPLE_WIDTH-1 downto 0);
    begin
        if (reset = '0') then
            stimulus_sample <= (others => '0');  
            data_valid <= '0';
            begin_reading <= '1';
            current_state <= idle;
            stimulus_raw := (others => '0');
        elsif rising_edge(clk) then
            --stimulus_sample <= stimulus_sample_next;
            current_state <= next_state;
            if begin_reading = '1' then
                readline(test_vector_file, file_row);
                read(file_row, stimulus_raw);
                begin_reading <='0';
                data_valid <= '1';
            else
                if not endfile(test_vector_file) then
                    if ready = '1' then
                        readline(test_vector_file, file_row);
                        read(file_row, stimulus_raw); 
                    end if;
                    data_valid <= '1';
                else
                    data_valid <= '0';          
                end if;
            end if;
            stimulus_sample <= stimulus_raw;
            
--            if not endfile(test_vector_file2) then
--                if tvalid_m = '1' then
--                    readline(test_vector_file2, file_row2);
--                    read(file_row2, stimulus_raw2); 
--                end if;
--            end if;   
--            stimulus_sample2 <= stimulus_raw2;   
        end if;

    end process;
    
    process(tvalid_m) 
        file test_vector_file2: text open READ_MODE is FILE_NAME2;
        variable file_row2: line;
        variable stimulus_raw2: std_logic_vector(SAMPLE_WIDTH-1 downto 0);
    begin 
        if not endfile(test_vector_file2) then
            if tvalid_m = '1' then
                readline(test_vector_file2, file_row2);
                read(file_row2, stimulus_raw2); 
            else
                stimulus_raw2 := (others => '0');
            end if;
            
        end if;   
        stimulus_sample2 <= stimulus_raw2;   
    end process;
      
    stimulus_stream <= stimulus_sample;
    stimulus_stream2 <= stimulus_sample2;

end behavioral;
