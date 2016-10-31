----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    15:38:36 03/15/2016 
-- Module Name:    barrel_shifter_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------


--THIS BARRELL SHIFTER HAS BEEN ALTERED TO ONLY SHIFT ZERO BITS, 1 BIT LEFT OR 1 BIT RIGHT

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter_16bit is
    Port ( B : in  STD_LOGIC_VECTOR (15 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           S3 : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (15 downto 0));
end barrel_shifter_16bit;

architecture Behavioral of barrel_shifter_16bit is 
	-- 16 to 1 line multiplexer
	COMPONENT mux16_1bit
	PORT(
		S0 : IN std_logic;
		S1 : IN std_logic;
		S2 : IN std_logic;
		S3 : IN std_logic;
		A : IN std_logic_vector(15 downto 0);
		F : OUT std_logic
		);
	END COMPONENT;
	
	signal fs_shift : std_logic_vector(3 downto 0);

begin
-- port maps ;-)

-- mux 0
mux : for i in 0 to 15 generate

mux0to16: mux16_1bit PORT MAP(
	S0 => fs_shift(0),
	S1 => fs_shift(1),
	S2 => fs_shift(2),
	S3 => fs_shift(3),
	A(0) => B(i+0),
	A(1) => B((i+15) mod 16),
	A(2) => B((i+14) mod 16),
	A(3) => B((i+13) mod 16),
	A(4) => B((i+12) mod 16),
	A(5) => B((i+11) mod 16),
	A(6) => B((i+10) mod 16),
	A(7) => B((i+9) mod 16),
	A(8) => B((i+8) mod 16),
	A(9) => B((i+7) mod 16),
	A(10) => B((i+6) mod 16),
	A(11) => B((i+5) mod 16),
	A(12) => B((i+4) mod 16),
	A(13) => B((i+3) mod 16),
	A(14) => B((i+2) mod 16),
	A(15) => B((i+1) mod 16),
	F => F(i)
);
end generate;

fs_shift <= "0000" when (S0='0' and S1='0') else "1111" when (S0='0' and S1='1') else "0001" when S0='1';

end Behavioral;

