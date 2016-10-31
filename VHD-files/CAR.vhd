----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    20:46:25 03/29/2016 
-- Module Name:    CAR - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CAR is
    Port ( data_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  reset : in STD_LOGIC;
           Con : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end CAR;


architecture Behavioral of CAR is

	COMPONENT ripple_adder_16bit
	PORT(
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		Cin : IN std_logic;
		S : OUT std_logic_vector(15 downto 0);
		Cout : OUT std_logic;
		Vout : OUT std_logic
		);
	END COMPONENT;
	
	-- 16 bit Register 
	COMPONENT reg16
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
signal increment : std_logic_vector(7 downto 0);
signal unused : std_logic_vector (7 downto 0);
signal current_val : std_logic_vector (15 downto 0);
signal into_reg : std_logic_vector (15 downto 0);

begin

	-- ripple_adder_16bit
	adder: ripple_adder_16bit PORT MAP(
		A(7 downto 0) => current_val(7 downto 0),
		A(15 downto 8) => x"00",
		B => x"0001",
		Cin => '0', 
		S(7 downto 0) => increment,
		s(15 downto 8) => unused
	);

	-- register
		reg: reg16 PORT MAP(
			D => into_reg,
			load => '1',
			Clk => Clk,
			Q => current_val
		);
		
--into_reg(7 downto 0) <= x"C0" when reset='1' else data_in when Con = '1' else increment;
into_reg(7 downto 0) <= data_in when Con = '1' else increment;
into_reg(15 downto 8) <= x"00";
data_out <= current_val(7 downto 0);

end Behavioral;

