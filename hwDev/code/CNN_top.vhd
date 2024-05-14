----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:44:30 AM
-- Design Name: 
-- Module Name: CNN_top - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CNN_top is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        tvalid : in std_logic;
        tlast : in std_logic;
        tdata : in std_logic_vector(31 downto 0);
        tready : out std_logic
    );
end CNN_top;

architecture Behavioral of CNN_top is

component input_ctrl is
    port(
        clk : in std_logic;
        reset : in std_logic;
        tvalid : in std_logic;
        tlast : in std_logic;
        tdata : in std_logic_vector(31 downto 0);
        tready : out std_logic;
        output : out std_logic_vector(223 downto 0)
        );
end component;

component conv is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        conv_input : in std_logic_vector(223 downto 0);
        valid_output : out  std_logic;
        conv_output : out std_logic_vector(207 downto 0)        
    );   
end component;

component maxpool is
    port(
        clk : in std_logic;
        reset : in std_logic;
        valid_input : in std_logic;
        mp_input : in std_logic_vector(415 downto 0);
        mp_output : out std_logic_vector(7 downto 0);
        ready : out std_logic; --added
        valid_output : out  std_logic    
    );
end component;

component fc is
    Port ( 
        clk : in std_logic;
        reset : in std_logic;
        fc_input : in std_logic_vector(1759 downto 0);
        fc_weights : in std_logic_vector(1759 downto 0);
        fc_bias : in std_logic_vector(7 downto 0);
        valid_output : out std_logic;
        fc_output : out std_logic_vector(79 downto 0)
    );
end component;

begin


end Behavioral;
