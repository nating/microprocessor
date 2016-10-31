----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    21:54:58 03/09/2016 
-- Module Name:    arithmetic_circuit_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit_16bit is
    Port ( Cin : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           G : out  STD_LOGIC_VECTOR (15 downto 0);
           Cout : out  STD_LOGIC;
           Vout : out  STD_LOGIC);
end arithmetic_circuit_16bit;


architecture Behavioral of arithmetic_circuit_16bit is
-- components
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


	COMPONENT b_to_y_16bit
	PORT(
		B : IN std_logic_vector(15 downto 0);
		S0 : IN std_logic;
		S1 : IN std_logic;
		Y : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

--signals
signal from_logic_to_adder : std_logic_vector(15 downto 0);

begin
-- port maps ;-)

-- ripple_adder_16bit
adder: ripple_adder_16bit PORT MAP(
	A => A,
	B => from_logic_to_adder,
	Cin => Cin, 
	S => G,
	Cout => Cout,
	Vout => Vout
);

-- b_to_y_16bit
bitslice_logic: b_to_y_16bit PORT MAP(
	B => B,
	S0 => S0,
	S1 => S1,
	Y => from_logic_to_adder
);

end Behavioral;

