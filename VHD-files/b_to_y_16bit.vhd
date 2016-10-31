----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    10:14:17 03/10/2016 
-- Module Name:    b_to_y_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b_to_y_16bit is
    Port ( B : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
			  S0 : in std_logic;
			  S1 : in std_logic
		);
end b_to_y_16bit;

architecture Behavioral of b_to_y_16bit is

begin
Y <= x"0000" when (S0='0' and S1='0') else
B when (S0='1' and S1='0') else
(not B) when (S0='0' and S1='1') else
x"FFFF" when (S0='1' and S1='1');
end Behavioral;

