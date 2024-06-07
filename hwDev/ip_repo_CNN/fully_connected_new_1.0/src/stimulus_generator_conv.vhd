library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity stimulus_generator_conv is
    generic (
        FILE_NAME_INPUT: string := "input.txt";
        FILE_NAME1: string := "input.txt";
        FILE_NAME2: string := "input.txt";
        FILE_NAME3: string := "input.txt";
        FILE_NAME4: string := "input.txt";
        FILE_NAME5: string := "input.txt";
        FILE_NAME6: string := "input.txt";
        FILE_NAME7: string := "input.txt";
        FILE_NAME8: string := "input.txt";
        FILE_NAME9: string := "input.txt";
        FILE_NAME10: string := "input.txt";
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
        stimulus_stream_output1: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output2: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output3: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output4: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output5: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output6: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output7: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output8: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output9: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0);
        stimulus_stream_output10: out std_logic_vector(SAMPLE_WIDTH2 - 1 downto 0)
    );
end stimulus_generator_conv;


architecture behavioral of stimulus_generator_conv is
    type state_type is (idle, send);
    signal current_state, next_state : state_type;
    
    signal stimulus_sample1, stimulus_sample2, stimulus_sample3, stimulus_sample4, stimulus_sample5, stimulus_sample6, stimulus_sample7, stimulus_sample8, stimulus_sample9, stimulus_sample10: std_logic_vector(SAMPLE_WIDTH2-1 downto 0) := (others => '0');
    signal stimulus_sample : std_logic_vector(SAMPLE_WIDTH-1 downto 0) := (others => '0');
    signal begin_reading : std_logic;
begin
    process (reset, clk, current_state, ready, begin_reading)
        file test_vector_file: text open READ_MODE is FILE_NAME_INPUT;
        variable file_row: line;
        variable stimulus_raw: std_logic_vector(SAMPLE_WIDTH-1 downto 0);
        
        file test_vector_file1: text open READ_MODE is FILE_NAME2;
        variable file_row1: line;
        variable stimulus_raw1: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file2: text open READ_MODE is FILE_NAME2;
        variable file_row2: line;
        variable stimulus_raw2: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file3: text open READ_MODE is FILE_NAME2;
        variable file_row3: line;
        variable stimulus_raw3: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file4: text open READ_MODE is FILE_NAME2;
        variable file_row4: line;
        variable stimulus_raw4: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file5: text open READ_MODE is FILE_NAME2;
        variable file_row5: line;
        variable stimulus_raw5: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file6: text open READ_MODE is FILE_NAME2;
        variable file_row6: line;
        variable stimulus_raw6: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file7: text open READ_MODE is FILE_NAME2;
        variable file_row7: line;
        variable stimulus_raw7: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file8: text open READ_MODE is FILE_NAME2;
        variable file_row8: line;
        variable stimulus_raw8: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file9: text open READ_MODE is FILE_NAME2;
        variable file_row9: line;
        variable stimulus_raw9: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
        
        file test_vector_file10: text open READ_MODE is FILE_NAME2;
        variable file_row10: line;
        variable stimulus_raw10: std_logic_vector(SAMPLE_WIDTH2-1 downto 0);
    begin
        if (reset = '0') then
            stimulus_sample <= (others => '0');  
            data_valid <= '0';
            begin_reading <= '1';
            current_state <= idle;
            stimulus_raw := (others => '0');
            stimulus_raw1 := (others => '0');
            stimulus_raw2 := (others => '0');
            stimulus_raw3 := (others => '0');
            stimulus_raw4 := (others => '0');
            stimulus_raw5 := (others => '0');
            stimulus_raw6 := (others => '0');
            stimulus_raw7 := (others => '0');
            stimulus_raw8 := (others => '0');
            stimulus_raw9 := (others => '0');
            stimulus_raw10 := (others => '0');

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
            if not endfile(test_vector_file1) then
                if ready = '1' then
                    readline(test_vector_file1, file_row1);
                    read(file_row1, stimulus_raw1); 
                end if;
                
            end if;   
             if not endfile(test_vector_file2) then
                if ready = '1' then
                    readline(test_vector_file2, file_row2);
                    read(file_row2, stimulus_raw2); 
                end if;
                
            end if;   
             if not endfile(test_vector_file3) then
                if ready = '1' then
                    readline(test_vector_file3, file_row3);
                    read(file_row3, stimulus_raw3); 
                end if;
                
            end if;   
             if not endfile(test_vector_file4) then
                if ready = '1' then
                    readline(test_vector_file4, file_row4);
                    read(file_row4, stimulus_raw4); 
                end if;
                
            end if;   
             if not endfile(test_vector_file5) then
                if ready = '1' then
                    readline(test_vector_file5, file_row5);
                    read(file_row5, stimulus_raw5); 
                end if;
                
            end if;   
             if not endfile(test_vector_file6) then
                if ready = '1' then
                    readline(test_vector_file6, file_row6);
                    read(file_row6, stimulus_raw6); 
                end if;
                
            end if;   
             if not endfile(test_vector_file7) then
                if ready = '1' then
                    readline(test_vector_file7, file_row7);
                    read(file_row7, stimulus_raw7); 
                end if;
                
            end if;   
             if not endfile(test_vector_file8) then
                if ready = '1' then
                    readline(test_vector_file8, file_row8);
                    read(file_row8, stimulus_raw8); 
                end if;
                
            end if;   
             if not endfile(test_vector_file9) then
                if ready = '1' then
                    readline(test_vector_file9, file_row9);
                    read(file_row9, stimulus_raw9); 
                end if;
                
            end if;   
          if not endfile(test_vector_file10) then
                if ready = '1' then
                    readline(test_vector_file10, file_row10);
                    read(file_row10, stimulus_raw10); 
                end if;
                
            end if;   
            stimulus_sample1 <= stimulus_raw1;   
            stimulus_sample2 <= stimulus_raw2;   
            stimulus_sample3 <= stimulus_raw3;   
            stimulus_sample4 <= stimulus_raw4;   
            stimulus_sample5 <= stimulus_raw5;   
            stimulus_sample6 <= stimulus_raw6;   
            stimulus_sample7 <= stimulus_raw7;   
            stimulus_sample8 <= stimulus_raw8;         
            stimulus_sample9 <= stimulus_raw9;         
            stimulus_sample10 <= stimulus_raw10;         
        end if;


    end process;
     
    stimulus_stream_input <= stimulus_sample;
    stimulus_stream_output1 <= stimulus_sample1;
    stimulus_stream_output2 <= stimulus_sample2;
    stimulus_stream_output3 <= stimulus_sample3;
    stimulus_stream_output4 <= stimulus_sample4;
    stimulus_stream_output5 <= stimulus_sample5;
    stimulus_stream_output6 <= stimulus_sample6;
    stimulus_stream_output7 <= stimulus_sample7;
    stimulus_stream_output8 <= stimulus_sample8;
    stimulus_stream_output9 <= stimulus_sample9;
    stimulus_stream_output10 <= stimulus_sample10;

end behavioral;