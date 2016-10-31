----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    13:08:21 04/01/2016 
-- Module Name:    mux_2_to_1_8bit - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_to_1_8bit is
    Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
			  S : in STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_2_to_1_8bit;

architecture Behavioral of mux_2_to_1_8bit is

begin
Z <= In0 when S='0' else
In1 when S='1' else
x"00";
end Behavioral;

