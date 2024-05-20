----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2024 11:22:23 AM
-- Design Name: 
-- Module Name: max_block - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity max_block is
    Port ( input1 : in unsigned(7 downto 0);
           input2 : in unsigned(7 downto 0);
           input3 : in unsigned(7 downto 0);
           input4 : in unsigned(7 downto 0);
           output : out unsigned(7 downto 0));
end max_block;

architecture Behavioral of max_block is

begin

process(input1, input2, input3, input4)
begin
    if input1 > input2 then
        if input1 > input3 then
            if input1 > input4 then
                output <= input1;
            else
                output <= input4;
            end if;
         elsif input3 > input4 then
            output <= input3;
         else
            output <= input4;
         end if;
    elsif input2 > input3 then
        if input2 > input4 then
            output <= input2;
        else
            output <= input4;
        end if;
    elsif input3 > input4 then
        output <= input3;
    else
        output <= input4;
    end if;
       
end process;


end Behavioral;
