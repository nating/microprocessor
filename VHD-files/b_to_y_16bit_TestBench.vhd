--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   10:46:58 03/10/2016
-- Module Name:   U:/decoder_3to8/b_to_y_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: b_to_y_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY b_to_y_16bit_TestBench IS
END b_to_y_16bit_TestBench;
 
ARCHITECTURE behavior OF b_to_y_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT b_to_y_16bit
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         Y : OUT  std_logic_vector(15 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: b_to_y_16bit PORT MAP (
          B => B,
          Y => Y,
          S0 => S0,
          S1 => S1
        );
     -- Stimulus process
	  
   stim_proc0: process
   begin			
		wait for 100 ns;
		B <= x"AAAA";
   end process;
	
   stim_proc1: process
   begin		
      wait for 50 ns;	
		S1 <= not S1;
   end process;
	
   stim_proc2: process
   begin		
      wait for 25 ns;	
		S0 <= not S0;
   end process;

END;
