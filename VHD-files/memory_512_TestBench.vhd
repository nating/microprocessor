--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   17:21:14 03/29/2016
-- Module Name:   U:/decoder_3to8/memory_512_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
-- VHDL Test Bench Created by ISE for module: memory_512
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memory_512_TestBench IS
END memory_512_TestBench;
 
ARCHITECTURE behavior OF memory_512_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory_512
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         MemWrite : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory_512 PORT MAP (
          address => address,
          write_data => write_data,
          MemWrite => MemWrite,
          read_data => read_data
        );

   -- Stimulus process 
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		write_data <= x"8003";
		address <= x"0002";
		MemWrite <= '1';
      wait for 100 ns;
		
      wait;
   end process;

END;
