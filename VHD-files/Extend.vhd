----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    18:38:47 03/31/2016 
-- Module Name:    Extend - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extend is
    Port ( DR : in  STD_LOGIC_VECTOR (2 downto 0);
           SB : in  STD_LOGIC_VECTOR (2 downto 0);
           extension : out  STD_LOGIC_VECTOR (15 downto 0));
end Extend;

architecture Behavioral of Extend is

begin
	extension(15 downto 6) <= "0000000000" when (DR(2)='0') else "1111111111";
	extension(5 downto 3) <= DR;
	extension(2 downto 0) <= SB;
end Behavioral;

