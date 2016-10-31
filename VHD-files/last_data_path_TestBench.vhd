--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:00:16 04/01/2016
-- Design Name:   
-- Module Name:   U:/decoder_3to8/last_data_path_TestBench.vhd
-- Project Name:  
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY last_data_path_TestBench IS
END last_data_path_TestBench;
 
ARCHITECTURE behavior OF last_data_path_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT last_data_path
    PORT(
         PC : IN  std_logic_vector(15 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         DR : IN  std_logic_vector(2 downto 0);
         SA : IN  std_logic_vector(2 downto 0);
         SB : IN  std_logic_vector(2 downto 0);
         TD : IN  std_logic;
         TA : IN  std_logic;
         TB : IN  std_logic;
         Clk : IN  std_logic;
			reset : IN std_logic;
         FS : IN  std_logic_vector(4 downto 0);
         RW : IN  std_logic;
         MB : IN  std_logic;
         MM : IN  std_logic;
         MD : IN  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0);
         address_out : OUT  std_logic_vector(15 downto 0);
         V : OUT  std_logic;
         C : OUT  std_logic;
         N : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal DR : std_logic_vector(2 downto 0) := (others => '0');
   signal SA : std_logic_vector(2 downto 0) := (others => '0');
   signal SB : std_logic_vector(2 downto 0) := (others => '0');
   signal TD : std_logic := '0';
   signal TA : std_logic := '0';
   signal TB : std_logic := '0';
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal FS : std_logic_vector(4 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal MB : std_logic := '0';
   signal MM : std_logic := '0';
   signal MD : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);
   signal address_out : std_logic_vector(15 downto 0);
   signal V : std_logic;
   signal C : std_logic;
   signal N : std_logic;
   signal Z : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: last_data_path PORT MAP (
          PC => PC,
          data_in => data_in,
          DR => DR,
          SA => SA,
          SB => SB,
          TD => TD,
          TA => TA,
          TB => TB,
          Clk => Clk,
          reset => reset,
          FS => FS,
          RW => RW,
          MB => MB,
          MM => MM,
          MD => MD,
          data_out => data_out,
          address_out => address_out,
          V => V,
          C => C,
          N => N,
          Z => Z
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
