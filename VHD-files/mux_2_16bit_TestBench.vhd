--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   12:31:00 02/17/2016
-- Module Name:   U:/decoder_3to8/mux_2_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: mux_2_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2_16bit_TestBench IS
END mux_2_16bit_TestBench;
 
ARCHITECTURE behavior OF mux_2_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2_16bit
    PORT(
         S : IN  std_logic;
         In0 : IN  std_logic_vector(15 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal S : std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2_16bit PORT MAP (
          S => S,
          In0 => In0,
          In1 => In1,
          Z => Z
        );

	-- Stimulus process
   stim_proc0: process
   begin
      In0 <= x"AAAA";
		In1 <= x"FFFF";
		wait for 300 ns;
   end process;

   -- Stimulus process
   stim_proc1: process
   begin		
      wait for 100 ns;	
		S <= not S;
   end process;
END;
