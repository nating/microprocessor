--------------------------------------------------------------------------------
-- Engineer: 		 Geoff Natin 14318196
-- Create Date:    21:04:00 04/01/2016
-- Module Name:    U:/decoder_3to8/processor_final_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY processor_final_TestBench IS
END processor_final_TestBench;
 
ARCHITECTURE behavior OF processor_final_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor_final
    PORT(
         Clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor_final PORT MAP (
          Clk => Clk,
          reset => reset
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 100 ns;	
		reset <= '0';
      wait;
   end process;

END;
