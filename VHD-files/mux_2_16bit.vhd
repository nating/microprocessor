----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    12:29:29 02/17/2016 
-- Module Name:    mux_2_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_16bit is
    Port ( S : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR (15 downto 0);
           In1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux_2_16bit;

architecture Behavioral of mux_2_16bit is

begin
Z <= In0 when S='0' else
In1 when S='1' else
x"0000";
end Behavioral;

