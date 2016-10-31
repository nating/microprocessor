----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    15:50:26 03/15/2016 
-- Module Name:    mux16_1bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16_1bit is
    Port ( S0 : in  STD_LOGIC;
			  S1 : in  STD_LOGIC;
			  S2 : in  STD_LOGIC;
			  S3 : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC);
end mux16_1bit;

architecture Behavioral of mux16_1bit is

begin
F <= A(0) when (S3='0' and S2='0' and S1='0' and S0='0') else
A(1) when (S3='0' and S2='0' and S1='0' and S0='1') else
A(2) when (S3='0' and S2='0' and S1='1' and S0='0') else
A(3) when (S3='0' and S2='0' and S1='1' and S0='1') else
A(4) when (S3='0' and S2='1' and S1='0' and S0='0') else
A(5) when (S3='0' and S2='1' and S1='0' and S0='1') else
A(6) when (S3='0' and S2='1' and S1='1' and S0='0') else
A(7) when (S3='0' and S2='1' and S1='1' and S0='1') else
A(8) when (S3='1' and S2='0' and S1='0' and S0='0') else
A(9) when (S3='1' and S2='0' and S1='0' and S0='1') else
A(10) when (S3='1' and S2='0' and S1='1' and S0='0') else
A(11) when (S3='1' and S2='0' and S1='1' and S0='1') else
A(12) when (S3='1' and S2='1' and S1='0' and S0='0') else
A(13) when (S3='1' and S2='1' and S1='0' and S0='1') else
A(14) when (S3='1' and S2='1' and S1='1' and S0='0') else
A(15) when (S3='1' and S2='1' and S1='1' and S0='1');
end Behavioral;

