--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   12:13:35 02/17/2016
-- Module Name:   U:/decoder_3to8/mux8_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: mux8_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux8_16bit_TestBench IS
END mux8_16bit_TestBench;
 
ARCHITECTURE behavior OF mux8_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_16bit
    PORT(
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         In0 : IN  std_logic_vector(15 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         In2 : IN  std_logic_vector(15 downto 0);
         In3 : IN  std_logic_vector(15 downto 0);
         In4 : IN  std_logic_vector(15 downto 0);
         In5 : IN  std_logic_vector(15 downto 0);
         In6 : IN  std_logic_vector(15 downto 0);
         In7 : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');
   signal In2 : std_logic_vector(15 downto 0) := (others => '0');
   signal In3 : std_logic_vector(15 downto 0) := (others => '0');
   signal In4 : std_logic_vector(15 downto 0) := (others => '0');
   signal In5 : std_logic_vector(15 downto 0) := (others => '0');
   signal In6 : std_logic_vector(15 downto 0) := (others => '0');
   signal In7 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_16bit PORT MAP (
          S0 => S0,
          S1 => S1,
          S2 => S2,
          In0 => In0,
          In1 => In1,
          In2 => In2,
          In3 => In3,
          In4 => In4,
          In5 => In5,
          In6 => In6,
          In7 => In7,
          Z => Z
        );

     -- Stimulus process
   stim_proc0: process
   begin		
      wait for 100 ns;	
		S2 <= not S2;
   end process;
	
   stim_proc1: process
   begin		
      wait for 50 ns;	
		S1 <= not S1;
   end process;
	
   stim_proc2: process
   begin		
      wait for 25 ns;	
		S0 <= not S0;
   end process;
	
	stim_proc3: process
	begin
		In0 <= x"0000";
		In1 <= x"0001";
		In2 <= x"0002";
		In3 <= x"0003";
		In4 <= x"0004";
		In5 <= x"0005";
		In6 <= x"0006";
		In7 <= x"0007";
		wait for 200 ns;
	end process;
	
END;
