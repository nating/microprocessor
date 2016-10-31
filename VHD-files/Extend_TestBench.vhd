--------------------------------------------------------------------------------
-- Company: Geoff Natin 14318196
-- Create Date:   18:50:37 03/31/2016
-- Module Name:   U:/decoder_3to8/Extend_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Extend_TestBench IS
END Extend_TestBench;
 
ARCHITECTURE behavior OF Extend_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Extend
    PORT(
         DR : IN  std_logic_vector(2 downto 0);
         SB : IN  std_logic_vector(2 downto 0);
         extension : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DR : std_logic_vector(2 downto 0) := (others => '0');
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal extension : std_logic_vector(15 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Extend PORT MAP (
          DR => DR,
          SB => SB,
          extension => extension
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- Test with most significant  bit = 1
		DR <= "101";
		SB <= "010";
		-- Extension = 1111111111101010
      wait for 100 ns;	

      -- Test with most significant  bit = 0
		DR <= "011";
		SB <= "011";
		-- Extension = 0000000000011011
      wait;
   end process;

END;
