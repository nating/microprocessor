--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   15:45:51 02/18/2016
-- Module Name:   U:/decoder_3to8/ripple_adder_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: ripple_adder
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ripple_adder_16bit_TestBench IS
END ripple_adder_16bit_TestBench;
 
ARCHITECTURE behavior OF ripple_adder_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_adder_16bit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Vout : OUT  std_logic;
         S : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Vout : std_logic;
   signal S : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder_16bit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Vout => Vout,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	
		-- 0 + 0 = 0
		A <= x"0000";
		B <= x"0000";
		Cin <= '0';
      wait for 100 ns;
			
		-- 2 + 2 = 4
		A <= x"0002";
		B <= x"0002";
		Cin <= '0';
      wait for 100 ns;
			
		-- 0 + 0 + 1 = 1
		A <= x"0000";
		B <= x"0000";
		Cin <= '1';
      wait for 100 ns;
		
		-- 65535 + 65535 = 0 (+ carry)
		A <= x"FFFF";
		B <= x"FFFF";
		Cin <= '0';
      wait for 100 ns;
 
      end process;
END;
