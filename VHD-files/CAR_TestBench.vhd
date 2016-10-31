--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   21:07:45 03/29/2016
-- Module Name:   U:/decoder_3to8/CAR_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: CAR
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CAR_TestBench IS
END CAR_TestBench;
 
ARCHITECTURE behavior OF CAR_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAR
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
			reset : IN std_logic;
			Clk : IN std_logic;
         Con : IN  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal Con : std_logic := '0';
	signal Clk : std_logic := '0';
	signal reset : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
 
   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAR PORT MAP (
          data_in => data_in,
			 reset => reset,
			 Clk => Clk,
          Con => Con,
          data_out => data_out
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
   stim_proc0: process
   begin		
		--Load the CAR with the input (condition == 1)
		data_in <= "01000001";
		Con <= '1';
		reset <='0';
		--data_out = 01000001
		wait for Clk_period*2;
		
		--Increment the CAR (condition == 0)
		data_in <= "01000001";
		Con <= '0';
		--data_out = 01000010
		wait;
   end process;

END;
