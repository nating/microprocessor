--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   15:49:00 03/29/2016
-- Module Name:   U:/decoder_3to8/mux16_16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: mux16_16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux16_16bit_TestBench IS
END mux16_16bit_TestBench;
 
ARCHITECTURE behavior OF mux16_16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux16_16bit
    PORT(
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         In0 : IN  std_logic_vector(15 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         In2 : IN  std_logic_vector(15 downto 0);
         In3 : IN  std_logic_vector(15 downto 0);
         In4 : IN  std_logic_vector(15 downto 0);
         In5 : IN  std_logic_vector(15 downto 0);
         In6 : IN  std_logic_vector(15 downto 0);
         In7 : IN  std_logic_vector(15 downto 0);
         In8 : IN  std_logic_vector(15 downto 0);
         In9 : IN  std_logic_vector(15 downto 0);
         In10 : IN  std_logic_vector(15 downto 0);
         In11 : IN  std_logic_vector(15 downto 0);
         In12 : IN  std_logic_vector(15 downto 0);
         In13 : IN  std_logic_vector(15 downto 0);
         In14 : IN  std_logic_vector(15 downto 0);
         In15 : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');
   signal In2 : std_logic_vector(15 downto 0) := (others => '0');
   signal In3 : std_logic_vector(15 downto 0) := (others => '0');
   signal In4 : std_logic_vector(15 downto 0) := (others => '0');
   signal In5 : std_logic_vector(15 downto 0) := (others => '0');
   signal In6 : std_logic_vector(15 downto 0) := (others => '0');
   signal In7 : std_logic_vector(15 downto 0) := (others => '0');
   signal In8 : std_logic_vector(15 downto 0) := (others => '0');
   signal In9 : std_logic_vector(15 downto 0) := (others => '0');
   signal In10 : std_logic_vector(15 downto 0) := (others => '0');
   signal In11 : std_logic_vector(15 downto 0) := (others => '0');
   signal In12 : std_logic_vector(15 downto 0) := (others => '0');
   signal In13 : std_logic_vector(15 downto 0) := (others => '0');
   signal In14 : std_logic_vector(15 downto 0) := (others => '0');
   signal In15 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux16_16bit PORT MAP (
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          In0 => In0,
          In1 => In1,
          In2 => In2,
          In3 => In3,
          In4 => In4,
          In5 => In5,
          In6 => In6,
          In7 => In7,
          In8 => In8,
          In9 => In9,
          In10 => In10,
          In11 => In11,
          In12 => In12,
          In13 => In13,
          In14 => In14,
          In15 => In15,
          Z => Z
        );

     -- Stimulus process
   stim_proc4: process
   begin		
      wait for 200 ns;	
		S3 <= not S3;
   end process;
	
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
		In8 <= x"0008";
		In9 <= x"0009";
		In10 <= x"000A";
		In11 <= x"000B";
		In12 <= x"000C";
		In13 <= x"000D";
		In14 <= x"000E";
		In15 <= x"000F";
		wait;
	end process;
	

END;
