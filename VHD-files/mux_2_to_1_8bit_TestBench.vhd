--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:24:26 04/01/2016
-- Design Name:   
-- Module Name:   U:/decoder_3to8/mux_2_to_1_8bit_TestBench.vhd
-- Project Name:  decoder_3to8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_2_to_1_8bit
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_2_to_1_8bit_TestBench IS
END mux_2_to_1_8bit_TestBench;
 
ARCHITECTURE behavior OF mux_2_to_1_8bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2_to_1_8bit
    PORT(
         In0 : IN  std_logic_vector(7 downto 0);
         In1 : IN  std_logic_vector(7 downto 0);
         S : IN  std_logic;
         Z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In0 : std_logic_vector(7 downto 0) := (others => '0');
   signal In1 : std_logic_vector(7 downto 0) := (others => '0');
   signal S : std_logic := '0';

 	--Outputs
   signal Z : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2_to_1_8bit PORT MAP (
          In0 => In0,
          In1 => In1,
          S => S,
          Z => Z
        );
		  
	-- Stimulus process
   stim_proc0: process
   begin
      In0 <= x"AA";
		In1 <= x"FF";
		wait for 300 ns;
   end process;

   -- Stimulus process
   stim_proc1: process
   begin		
      wait for 100 ns;	
		S <= not S;
   end process;
END;
