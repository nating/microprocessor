--------------------------------------------------------------------------------
-- Company: Geoff Natin 124318196
-- Create Date:   13:52:32 04/01/2016
-- Module Name:   U:/decoder_3to8/Microprogrammed_control_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Microprogrammed_control_TestBench IS
END Microprogrammed_control_TestBench;
 
ARCHITECTURE behavior OF Microprogrammed_control_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Microprogrammed_control
    PORT(
         instruction_in : IN  std_logic_vector(15 downto 0);
         reset : IN  std_logic;
         V : IN  std_logic;
         C : IN  std_logic;
         N : IN  std_logic;
         Z : IN  std_logic;
         Clk : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         DR : OUT  std_logic_vector(2 downto 0);
         SA : OUT  std_logic_vector(2 downto 0);
         SB : OUT  std_logic_vector(2 downto 0);
         TD : OUT  std_logic;
         TA : OUT  std_logic;
         TB : OUT  std_logic;
         MB : OUT  std_logic;
         FS : OUT  std_logic_vector(4 downto 0);
         MD : OUT  std_logic;
         RW : OUT  std_logic;
         MM : OUT  std_logic;
         MW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal instruction_in : std_logic_vector(15 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal V : std_logic := '0';
   signal C : std_logic := '0';
   signal N : std_logic := '0';
   signal Z : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(15 downto 0);
   signal DR : std_logic_vector(2 downto 0);
   signal SA : std_logic_vector(2 downto 0);
   signal SB : std_logic_vector(2 downto 0);
   signal TD : std_logic;
   signal TA : std_logic;
   signal TB : std_logic;
   signal MB : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MD : std_logic;
   signal RW : std_logic;
   signal MM : std_logic;
   signal MW : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Microprogrammed_control PORT MAP (
          instruction_in => instruction_in,
          reset => reset,
          V => V,
          C => C,
          N => N,
          Z => Z,
          Clk => Clk,
          pc_out => pc_out,
          DR => DR,
          SA => SA,
          SB => SB,
          TD => TD,
          TA => TA,
          TB => TB,
          MB => MB,
          FS => FS,
          MD => MD,
          RW => RW,
          MM => MM,
          MW => MW
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   
   stim_proc: process
   begin		
	 reset <= '1';
	 wait for 20 ns;
	
	-- Testing instruction = 1101001000110111
	reset <= '0';
	instruction_in <= x"D237";
	-- output should be 
	-- pc 000000000000001
	-- dr 000
	-- sa 110
	-- sb 111
	-- td 0
	-- ta 0
	-- tb 0
	-- mb 0
	-- fs 00000
	-- md 0
	-- rw 0
	-- mm 0
	-- mw 0

      wait;
   end process;

END;
