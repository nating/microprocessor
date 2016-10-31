----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    22:41:25 03/30/2016 
-- Module Name:    mux_8_to_1_1bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8_to_1_1bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           line_out : out  STD_LOGIC);
end mux_8_to_1_1bit;

architecture Behavioral of mux_8_to_1_1bit is

begin
line_out <= A(0) when (S2='0' and S1='0' and S0='0') else
A(1) when (S2='0' and S1='0' and S0='1') else
A(2) when (S2='0' and S1='1' and S0='0') else
A(3) when (S2='0' and S1='1' and S0='1') else
A(4) when (S2='1' and S1='0' and S0='0') else
A(5) when (S2='1' and S1='0' and S0='1') else
A(6) when (S2='1' and S1='1' and S0='0') else
A(7) when (S2='1' and S1='1' and S0='1') else '0';

end Behavioral;

