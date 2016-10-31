--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   17:01:58 03/15/2016
-- Module Name:   U:/decoder_3to8/logic_circuit_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: logic_circuit_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY logic_circuit_16bit_TestBench IS
END logic_circuit_16bit_TestBench;
 
ARCHITECTURE behavior OF logic_circuit_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logic_circuit_16bit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logic_circuit_16bit PORT MAP (
          A => A,
          B => B,
          s0 => s0,
          s1 => s1,
          Y => Y
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
		A <= x"00A0";
		B <= x"002A";
      wait for 100 ns;
   end process;
END;
