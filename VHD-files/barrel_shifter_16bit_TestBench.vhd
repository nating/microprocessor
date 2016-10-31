--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   16:07:55 03/15/2016
-- Module Name:   U:/decoder_3to8/barrel_shifter_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: barrel_shifter_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY barrel_shifter_16bit_TestBench IS
END barrel_shifter_16bit_TestBench;
 
ARCHITECTURE behavior OF barrel_shifter_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barrel_shifter_16bit
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         F : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
   --Inputs
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';

 	--Outputs
   signal F : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: barrel_shifter_16bit PORT MAP (
          B => B,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
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
		B <= x"8000";
      wait for 400 ns;
		B <= x"C000";
      wait for 400 ns;
   end process;

END;
