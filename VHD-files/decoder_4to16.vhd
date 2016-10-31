----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    15:59:34 03/29/2016 
-- Module Name:    decoder_4to16 - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_4to16 is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out  STD_LOGIC;
           Q5 : out  STD_LOGIC;
           Q6 : out  STD_LOGIC;
           Q7 : out  STD_LOGIC;
           Q8 : out  STD_LOGIC;
           Q9 : out  STD_LOGIC;
           Q10 : out  STD_LOGIC;
           Q11 : out  STD_LOGIC;
           Q12 : out  STD_LOGIC;
           Q13 : out  STD_LOGIC;
           Q14 : out  STD_LOGIC;
           Q15 : out  STD_LOGIC);
end decoder_4to16;

architecture Behavioral of decoder_4to16 is

begin
Q0 <= ( (not A0) and (not A1) and (not A2) and (not A3) );
Q1 <= ( A0 and (not A1) and (not A2)  and (not A3));
Q2 <= ( (not A0) and A1 and (not A2)  and (not A3));
Q3 <= ( A0 and A1 and (not A2)  and (not A3));
Q4 <= ( (not A0) and (not A1) and A2  and (not A3));
Q5 <= ( A0 and (not A1) and A2  and (not A3));
Q6 <= ( (not A0) and A1 and A2  and (not A3));
Q7 <= ( A0 and A1 and A2  and (not A3));
Q8 <= ( (not A0) and (not A1) and (not A2) and A3);
Q9 <= ( A0 and (not A1) and (not A2)  and A3);
Q10 <= ( (not A0) and A1 and (not A2)  and A3);
Q11 <= ( A0 and A1 and (not A2)  and A3);
Q12 <= ( (not A0) and (not A1) and A2  and A3);
Q13 <= ( A0 and (not A1) and A2  and A3);
Q14 <= ( (not A0) and A1 and A2  and A3);
Q15 <= ( A0 and A1 and A2  and A3);
end Behavioral;

