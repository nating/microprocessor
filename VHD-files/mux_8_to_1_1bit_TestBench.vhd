--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:46:17 03/30/2016
-- Design Name:   
-- Module Name:   U:/decoder_3to8/mux_8_to_1_1bit_TestBench.vhd
-- Project Name:  decoder_3to8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_8_to_1_1bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux_8_to_1_1bit_TestBench IS
END mux_8_to_1_1bit_TestBench;
 
ARCHITECTURE behavior OF mux_8_to_1_1bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8_to_1_1bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         line_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';

 	--Outputs
   signal line_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8_to_1_1bit PORT MAP (
          A => A,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          line_out => line_out
        );

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
	
	stim_proc4: process
   begin			
		A <= x"AA";
      wait for 400 ns;
   end process;

END;
