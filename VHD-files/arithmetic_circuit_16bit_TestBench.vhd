--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   14:45:05 03/11/2016
-- Module Name:   U:/decoder_3to8/arithmetic_circuit_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: arithmetic_circuit_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY arithmetic_circuit_16bit_TestBench IS
END arithmetic_circuit_16bit_TestBench;
 
ARCHITECTURE behavior OF arithmetic_circuit_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmetic_circuit_16bit
    PORT(
         Cin : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         G : OUT  std_logic_vector(15 downto 0);
         Cout : OUT  std_logic;
			Vout : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Cin : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal G : std_logic_vector(15 downto 0);
   signal Cout : std_logic;
   signal Vout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmetic_circuit_16bit PORT MAP (
          Cin => Cin,
          S0 => S0,
          S1 => S1,
          A => A,
          B => B,
          G => G,
          Cout => Cout,
			 Vout => Vout
        );

      -- Stimulus process
   stim_proc0: process
   begin		
		wait for 100 ns;
		Cin <= '0';
		S0 <= '0';
		S1 <= '0';
		A <= x"000A";
		B <= x"0000";
		--Should place 0xA000 into G
		
		wait for 100 ns;
		S0 <= '0';
		S1 <= '0';
		Cin <= '1';
		A <= x"000A";
		B <= x"0000";
		--Should place 0xA000 + 1 into G
		
		wait for 100 ns;
		S0 <= '0';
		S1 <= '1';
		Cin <= '0';
		A <= x"000A";
		B <= x"FFF1";
		--Should place 0xA000 + ~(0xFFF1) into G
		
		wait for 100 ns;
		S0 <= '0';
		S1 <= '1';
		Cin <= '1';
		A <= x"000A";
		B <= x"FFF1";
		--Should place 0xA000 + ~(0xFFF1) + 1 into G
		
		wait for 100 ns;
		S0 <= '1';
		S1 <= '0';
		Cin <= '0';
		A <= x"000A";
		B <= x"00A0";
		--Should place 0xA000 + 0x00A0 into G
		
		wait for 100 ns;
		S0 <= '1';
		S1 <= '0';
		Cin <= '1';
		A <= x"000A";
		B <= x"00A0";
		--Should place 0xA000 + 0x00A0 + 1 into G
		
		wait for 100 ns;
		S0 <= '1';
		S1 <= '1';
		Cin <= '0';
		A <= x"000A";
		B <= x"FFFF";
		--Should place 0xA000 - 1 into G
		
		wait for 100 ns;
		S0 <= '1';
		S1 <= '1';
		Cin <= '1';
		A <= x"000A";
		B <= x"FFFF";
		--Should place 0xA000 G
		
	end process;
END;
