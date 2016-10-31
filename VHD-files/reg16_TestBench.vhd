--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   14:27:19 02/18/2016
-- Module Name:   U:/decoder_3to8/reg16_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: reg16
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY reg16_TestBench IS
END reg16_TestBench;
 
ARCHITECTURE behavior OF reg16_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg16
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         Clk : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16 PORT MAP (
          D => D,
          load => load,
          Clk => Clk,
          Q => Q
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
		wait for Clk_period*2;
		load <= '1';
		D <= x"AAAA";
		--Should load 0xAAAA into D
		
		wait for Clk_period*2;
		load <= '0';
		D <= x"1111";
		--Should not load 0x1111 into Q
		
		wait for Clk_period*2;
		load <= '1';
		D <= x"1111";
		--Should load 0x1111 into Q
		
   end process;
END;
