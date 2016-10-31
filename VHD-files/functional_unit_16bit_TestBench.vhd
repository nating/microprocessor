--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   19:11:35 03/15/2016
-- Module Name:   U:/decoder_3to8/functional_unit_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: functional_unit_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY functional_unit_16bit_TestBench IS
END functional_unit_16bit_TestBench;
 
ARCHITECTURE behavior OF functional_unit_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT functional_unit_16bit
    PORT(
         FSS : IN  std_logic_vector(4 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         F : OUT  std_logic_vector(15 downto 0);
         V : OUT  std_logic;
         C : OUT  std_logic;
         N : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal FSS : std_logic_vector(4 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic_vector(15 downto 0);
   signal V : std_logic;
   signal C : std_logic;
   signal N : std_logic;
   signal Z : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: functional_unit_16bit PORT MAP (
          FSS => FSS,
          A => A,
          B => B,
          F => F,
          V => V,
          C => C,
          N => N,
          Z => Z
        );
	
	
	--CYCLE THROUGH INPUTS TO TEST
	--   EACH OPERATION
   stim_proc1: process
   begin		
      wait for 50 ns;	
		FSS(0) <= not FSS(0);
   end process;
	
   stim_proc2: process
   begin		
      wait for 100 ns;	
		FSS(1) <= not FSS(1);
   end process;
	
   stim_proc3: process
   begin		
      wait for 200 ns;	
		FSS(2) <= not FSS(2);
   end process;
	
   stim_proc4: process
   begin		
      wait for 400 ns;	
		FSS(3) <= not FSS(3);
   end process;
	
   stim_proc5: process
   begin		
      wait for 800 ns;	
		FSS(4) <= not FSS(4);
   end process;
	
	stim_proc6: process
   begin			
		A <= x"00FA";
		B <= x"002A";
      wait;
   end process;


END;
