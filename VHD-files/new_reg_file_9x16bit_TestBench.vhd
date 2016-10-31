--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   16:13:35 03/29/2016
-- Module Name:   U:/decoder_3to8/new_reg_file_9x16bit_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: new_reg_file_9x16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY new_reg_file_9x16bit_TestBench IS
END new_reg_file_9x16bit_TestBench;
 
ARCHITECTURE behavior OF new_reg_file_9x16bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT new_reg_file_9x16bit
    PORT(
         des_sel : IN  std_logic_vector(2 downto 0);
         a_sel : IN  std_logic_vector(2 downto 0);
         b_sel : IN  std_logic_vector(2 downto 0);
			TD : IN std_logic;
			TA : IN std_logic;
			TB : IN std_logic;
         load_enable : IN  std_logic;
         reset : IN  std_logic;
         Clk : IN  std_logic;
         input_data : IN  std_logic_vector(15 downto 0);
         a_data : OUT  std_logic_vector(15 downto 0);
         b_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal des_sel : std_logic_vector(2 downto 0) := (others => '0');
   signal a_sel : std_logic_vector(2 downto 0) := (others => '0');
   signal b_sel : std_logic_vector(2 downto 0) := (others => '0');
   signal load_enable : std_logic := '0';
   signal reset : std_logic := '0';
   signal TD : std_logic := '0';
   signal TA : std_logic := '0';
   signal TB : std_logic := '0';
   signal Clk : std_logic := '0';
   signal input_data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal a_data : std_logic_vector(15 downto 0);
   signal b_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: new_reg_file_9x16bit PORT MAP (
          des_sel => des_sel,
          a_sel => a_sel,
          b_sel => b_sel,
			 TD => TD,
			 TA => TA,
			 TB => TB,
          load_enable => load_enable,
			 reset => reset,
          Clk => Clk,
          input_data => input_data,
          a_data => a_data,
          b_data => b_data
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
		reset <= '1';
      wait for 100 ns;	
		load_enable <= '1';
		
		--Load 0x0 into reg0
		input_data <= x"0000";
		des_sel(0) <= '0';
		des_sel(1) <= '0';
		des_sel(2) <= '0';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x1 into reg1
		input_data <= x"0001";
		des_sel(0) <= '1';
		des_sel(1) <= '0';
		des_sel(2) <= '0';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x2 into reg2
		input_data <= x"0002";
		des_sel(0) <= '0';
		des_sel(1) <= '1';
		des_sel(2) <= '0';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x3 into reg3
		input_data <= x"0003";
		des_sel(0) <= '1';
		des_sel(1) <= '1';
		des_sel(2) <= '0';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x4 into reg4
		input_data <= x"0004";
		des_sel(0) <= '0';
		des_sel(1) <= '0';
		des_sel(2) <= '1';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x5 into reg5
		input_data <= x"0005";
		des_sel(0) <= '1';
		des_sel(1) <= '0';
		des_sel(2) <= '1';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x6 into reg6
		input_data <= x"0006";
		des_sel(0) <= '0';
		des_sel(1) <= '1';
		des_sel(2) <= '1';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x7 into reg7
		input_data <= x"0007";
		des_sel(0) <= '1';
		des_sel(1) <= '1';
		des_sel(2) <= '1';
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x8 into reg8
		input_data <= x"0008";
		des_sel(0) <= '0';
		des_sel(1) <= '0';
		des_sel(2) <= '0';
		TD <= '1';
      wait for Clk_period*10;
 
		--Load reg3's value into a_data
		a_sel(0) <= '1';
		a_sel(1) <= '1';
		a_sel(2) <= '0';
		TA <= '0';
		
		
		--Load reg5's value into b_data
		b_sel(0) <= '1';
		b_sel(1) <= '0';
		b_sel(2) <= '1';
		TB <= '0';
		wait;
      end process;


END;
