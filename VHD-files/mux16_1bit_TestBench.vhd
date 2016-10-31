--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   16:01:07 03/15/2016
-- Module Name:   U:/decoder_3to8/mux16_1bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: mux16_1bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16_1bit_TestBench IS
END mux16_1bit_TestBench;
 
ARCHITECTURE behavior OF mux16_1bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux16_1bit
    PORT(
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         F : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';
   signal A : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux16_1bit PORT MAP (
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          A => A,
          F => F
        );

   -- Stimulus process
   stim_proc0: process
   begin	
      wait for 25 ns;	
		S0 <= not S0;
   end process;
	
   stim_proc1: process
   begin		
      wait for 50 ns;	
		S1 <= not S1;
   end process;
	
   stim_proc2: process
   begin		
      wait for 100 ns;	
		S2 <= not S2;
   end process;
	
	
   stim_proc3: process
   begin		
      wait for 200 ns;	
		S3 <= not S3;
   end process;
	
	stim_proc4: process
   begin			
		A <= x"AAAA";
      wait for 400 ns;
   end process;
	
END;
