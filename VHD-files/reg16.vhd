----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    12:36:53 02/17/2016 
-- Module Name:    reg16 - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16 is
    Port ( D : in  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end reg16;

architecture Behavioral of reg16 is

begin
process(Clk)
begin
if (rising_edge(Clk)) then
	if load='1' then
		Q<=D;
	end if;
end if;
end process;
end Behavioral;

