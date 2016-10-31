----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    19:48:00 03/29/2016 
-- Module Name:    IR - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           IL : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           Opcode : out  STD_LOGIC_VECTOR (6 downto 0);
           DR : out  STD_LOGIC_VECTOR (2 downto 0);
           SA : out  STD_LOGIC_VECTOR (2 downto 0);
           SB : out  STD_LOGIC_VECTOR (2 downto 0));
end IR;

architecture Behavioral of IR is

	-- 16 bit Register 
	COMPONENT reg16
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
signal data_out : std_logic_vector(15 downto 0);
	
begin

	-- register
	reg: reg16 PORT MAP(
		D => data_in,
		load => IL,
		Clk => Clk,
		Q => data_out
	);

	Opcode<=data_out(15 downto 9);
	DR<=data_out(8 downto 6);
	SA<=data_out(5 downto 3);
	SB<=data_out(2 downto 0);
	
end Behavioral;

