--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   15:33:44 03/09/2016
-- Module Name:   U:/decoder_3to8/full_adder_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: full_adder
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_TestBench IS
END full_adder_TestBench;
 
ARCHITECTURE behavior OF full_adder_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc0: process
   begin
		wait for 25 ns;
      Cin <= not Cin;
   end process;

   -- Stimulus process
   stim_proc1: process
   begin		
      wait for 50 ns;
      B <= not B;	
   end process;
	
   -- Stimulus process
   stim_proc2: process
   begin		
      wait for 100 ns;
      A <= not A;	
   end process;

END;
