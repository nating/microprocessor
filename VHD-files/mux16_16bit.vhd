----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    15:41:47 03/29/2016 
-- Module Name:    mux16_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16_16bit is
    Port ( S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           S3 : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR (15 downto 0);
           In1 : in  STD_LOGIC_VECTOR (15 downto 0);
           In2 : in  STD_LOGIC_VECTOR (15 downto 0);
           In3 : in  STD_LOGIC_VECTOR (15 downto 0);
           In4 : in  STD_LOGIC_VECTOR (15 downto 0);
           In5 : in  STD_LOGIC_VECTOR (15 downto 0);
           In6 : in  STD_LOGIC_VECTOR (15 downto 0);
           In7 : in  STD_LOGIC_VECTOR (15 downto 0);
           In8 : in  STD_LOGIC_VECTOR (15 downto 0);
           In9 : in  STD_LOGIC_VECTOR (15 downto 0);
           In10 : in  STD_LOGIC_VECTOR (15 downto 0);
           In11 : in  STD_LOGIC_VECTOR (15 downto 0);
           In12 : in  STD_LOGIC_VECTOR (15 downto 0);
           In13 : in  STD_LOGIC_VECTOR (15 downto 0);
           In14 : in  STD_LOGIC_VECTOR (15 downto 0);
           In15 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux16_16bit;

architecture Behavioral of mux16_16bit is

begin
Z <= In0 when (S0='0' and S1='0' and S2='0' and S3='0') else
In1 when (S0='1' and S1='0' and S2='0' and S3='0') else
In2 when (S0='0' and S1='1' and S2='0' and S3='0') else
In3 when (S0='1' and S1='1' and S2='0' and S3='0') else
In4 when (S0='0' and S1='0' and S2='1' and S3='0') else
In5 when (S0='1' and S1='0' and S2='1' and S3='0') else
In6 when (S0='0' and S1='1' and S2='1' and S3='0') else
In7 when (S0='1' and S1='1' and S2='1' and S3='0') else
In8 when (S0='0' and S1='0' and S2='0' and S3='1') else
In9 when (S0='1' and S1='0' and S2='0' and S3='1') else
In10 when (S0='0' and S1='1' and S2='0' and S3='1') else
In11 when (S0='1' and S1='1' and S2='0' and S3='1') else
In12 when (S0='0' and S1='0' and S2='1' and S3='1') else
In13 when (S0='1' and S1='0' and S2='1' and S3='1') else
In14 when (S0='0' and S1='1' and S2='1' and S3='1') else
In15 when (S0='1' and S1='1' and S2='1' and S3='1') else
x"0000";
end Behavioral;

