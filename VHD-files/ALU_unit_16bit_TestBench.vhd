-------------------------------------------------------------------------------- 
-- Engineer: Geoff Natin 14318196
-- Create Date:   17:26:06 03/15/2016
-- Module Name:   U:/decoder_3to8/ALU_unit_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: ALU_unit_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_unit_16bit_TestBench IS
END ALU_unit_16bit_TestBench;
 
ARCHITECTURE behavior OF ALU_unit_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_unit_16bit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : in  STD_LOGIC;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         Cout : OUT  std_logic;
         Vout : OUT  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Vout : std_logic;
   signal G : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_unit_16bit PORT MAP (
          A => A,
          B => B,
			 Cin => Cin,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          Cout => Cout,
          Vout => Vout,
          G => G
        );
	
	--CYCLE TROUGH DIFFERENT INPUTS
	--  TO TEST EACH OPERATION
   stim_proc1: process
   begin		
      wait for 50 ns;	
		S0 <= not S0;
   end process;
	
   stim_proc2: process
   begin		
      wait for 100 ns;	
		S1 <= not S1;
   end process;
	
   stim_proc3: process
   begin		
      wait for 200 ns;	
		S2 <= not S2;
   end process;
	
	stim_proc4: process
   begin			
		A <= x"00FA";
		B <= x"002A";
      wait for 400 ns;
   end process;

END;
