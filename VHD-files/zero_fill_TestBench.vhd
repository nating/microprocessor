--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   13:22:45 03/30/2016
-- Module Name:   U:/decoder_3to8/zero_fill_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: zero_fill
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY zero_fill_TestBench IS
END zero_fill_TestBench;
 
ARCHITECTURE behavior OF zero_fill_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zero_fill
    PORT(
         SB : IN  std_logic_vector(2 downto 0);
         constant_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal constant_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_fill PORT MAP (
          SB => SB,
          constant_out => constant_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		--Test with the constant as 5
		SB <= "101";
      wait for 100 ns;
		
		--Test with the constant as 0
		SB <= "000";
      wait for 100 ns;
		
		--Test with the constant as 2
		SB <= "010";
		wait;
      end process;

END;
