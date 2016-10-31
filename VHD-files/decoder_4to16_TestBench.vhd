--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   16:08:33 03/29/2016
-- Module Name:   U:/decoder_3to8/decoder_4to16_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: decoder_4to16
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder_4to16_TestBench IS
END decoder_4to16_TestBench;
 
ARCHITECTURE behavior OF decoder_4to16_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_4to16
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         A3 : IN  std_logic;
         Q0 : OUT  std_logic;
         Q1 : OUT  std_logic;
         Q2 : OUT  std_logic;
         Q3 : OUT  std_logic;
         Q4 : OUT  std_logic;
         Q5 : OUT  std_logic;
         Q6 : OUT  std_logic;
         Q7 : OUT  std_logic;
         Q8 : OUT  std_logic;
         Q9 : OUT  std_logic;
         Q10 : OUT  std_logic;
         Q11 : OUT  std_logic;
         Q12 : OUT  std_logic;
         Q13 : OUT  std_logic;
         Q14 : OUT  std_logic;
         Q15 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';

 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;
   signal Q2 : std_logic;
   signal Q3 : std_logic;
   signal Q4 : std_logic;
   signal Q5 : std_logic;
   signal Q6 : std_logic;
   signal Q7 : std_logic;
   signal Q8 : std_logic;
   signal Q9 : std_logic;
   signal Q10 : std_logic;
   signal Q11 : std_logic;
   signal Q12 : std_logic;
   signal Q13 : std_logic;
   signal Q14 : std_logic;
   signal Q15 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_4to16 PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7,
          Q8 => Q8,
          Q9 => Q9,
          Q10 => Q10,
          Q11 => Q11,
          Q12 => Q12,
          Q13 => Q13,
          Q14 => Q14,
          Q15 => Q15
        );

   -- Stimulus process
	
   stim_proc3: process
   begin		
      wait for 200 ns;	
		A3 <= not A3;
   end process;
	
   stim_proc0: process
   begin		
      wait for 100 ns;	
		A2 <= not A2;
   end process;
	
   stim_proc1: process
   begin		
      wait for 50 ns;	
		A1 <= not A1;
   end process;
	
   stim_proc2: process
   begin		
      wait for 25 ns;	
		A0 <= not A0;
   end process;

END;
