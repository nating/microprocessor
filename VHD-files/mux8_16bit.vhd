----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    11:33:23 02/16/2016 
-- Module Name:    mux8_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_16bit is
    Port ( S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR (15 downto 0);
           In1 : in  STD_LOGIC_VECTOR (15 downto 0);
           In2 : in  STD_LOGIC_VECTOR (15 downto 0);
           In3 : in  STD_LOGIC_VECTOR (15 downto 0);
           In4 : in  STD_LOGIC_VECTOR (15 downto 0);
           In5 : in  STD_LOGIC_VECTOR (15 downto 0);
           In6 : in  STD_LOGIC_VECTOR (15 downto 0);
           In7 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is

begin
Z <= In0 when (S0='0' and S1='0' and S2='0') else
In1 when (S0='1' and S1='0' and S2='0') else
In2 when (S0='0' and S1='1' and S2='0') else
In3 when (S0='1' and S1='1' and S2='0') else
In4 when (S0='0' and S1='0' and S2='1') else
In5 when (S0='1' and S1='0' and S2='1') else
In6 when (S0='0' and S1='1' and S2='1') else
In7 when (S0='1' and S1='1' and S2='1') else
x"0000";
end Behavioral;

