library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity stimulus_generator_conv is
    generic (
        FILE_NAME: string := "input.txt";
        FILE_NAME2: string := "input.txt";
        SAMPLE_WIDTH: positive;
        SAMPLE_WIDTH2: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        ready : in std_logic;
        tvalid_m : in std_logic;
        data_valid : out std_logic;
        stimulus_stream_input : out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output1: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output2: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output3: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output4: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output5: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output6: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output7: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
        stimulus_stream_output8: out std_logic_vector(SAMPLE_WIDTH - 1 downto 0)
    );
end stimulus_generator_conv;


architecture behavioral of stimulus_generator_conv is
    type state_type is (idle, send);
    signal current_state, next_state : state_type;
    
    signal stimulus_sample, stimulus_sample1, stimulus_sample2, stimulus_sample3, stimulus_sample4, stimulus_sample5, stimulus_sample6, stimulus_sample7, stimulus_sample8: std_logic_vector(SAMPLE_WIDTH-1 downto 0) := (others => '0');
    signal begin_reading : std_logic;
begin
    process (reset, clk, current_state, ready, begin_reading, tvalid_m)
        file test_vector_file: text open READ_MODE is FILE_NAME;
        variable file_row: line;
        variable stimulus_raw: std_logic_vector(SAMPLE_WIDTH-1 downto 0);
        file test_vector_file2: text open READ_MODE is FILE_NAME2;
        variable file_row2: line;
        variable stimulus_raw2: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
    begin
        if (reset = '0') then
            stimulus_sample <= (others => '0');  
            data_valid <= '0';
            begin_reading <= '1';
            current_state <= idle;
            stimulus_raw := (others => '0');
            stimulus_raw2 := (others => '0');

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
            if not endfile(test_vector_file2) then
                if tvalid_m = '1' then
                    readline(test_vector_file2, file_row2);
                    read(file_row2, stimulus_raw2); 
--                else
--                    stimulus_raw2 := (others => '0');
                end if;
                
            end if;   
            stimulus_sample1 <= stimulus_raw2(255 downto 224);   
            stimulus_sample2 <= stimulus_raw2(223 downto 192);   
            stimulus_sample3 <= stimulus_raw2(191 downto 160);   
            stimulus_sample4 <= stimulus_raw2(159 downto 128);   
            stimulus_sample5 <= stimulus_raw2(127 downto 96);   
            stimulus_sample6 <= stimulus_raw2(95 downto 64);   
            stimulus_sample7 <= stimulus_raw2(63 downto 32);   
            stimulus_sample8 <= stimulus_raw2(31 downto 0);         
        end if;


    end process;
    
--    process(tvalid_m) 
--        file test_vector_file2: text open READ_MODE is FILE_NAME2;
--        variable file_row2: line;
--        variable stimulus_raw2: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
--    begin 
--        if not endfile(test_vector_file2) then
--            if tvalid_m = '1' then
--                readline(test_vector_file2, file_row2);
--                read(file_row2, stimulus_raw2); 
--            else
--                stimulus_raw2 := (others => '0');
--            end if;
            
--        end if;   
--        stimulus_sample1 <= stimulus_raw2(255 downto 224);   
--        stimulus_sample2 <= stimulus_raw2(223 downto 192);   
--        stimulus_sample3 <= stimulus_raw2(191 downto 160);   
--        stimulus_sample4 <= stimulus_raw2(159 downto 128);   
--        stimulus_sample5 <= stimulus_raw2(127 downto 96);   
--        stimulus_sample6 <= stimulus_raw2(95 downto 64);   
--        stimulus_sample7 <= stimulus_raw2(63 downto 32);   
--        stimulus_sample8 <= stimulus_raw2(31 downto 0);   
--    end process;
      
    stimulus_stream_input <= stimulus_sample;
    stimulus_stream_output1 <= stimulus_sample1;
    stimulus_stream_output2 <= stimulus_sample2;
    stimulus_stream_output3 <= stimulus_sample3;
    stimulus_stream_output4 <= stimulus_sample4;
    stimulus_stream_output5 <= stimulus_sample5;
    stimulus_stream_output6 <= stimulus_sample6;
    stimulus_stream_output7 <= stimulus_sample7;
    stimulus_stream_output8 <= stimulus_sample8;

end behavioral;
