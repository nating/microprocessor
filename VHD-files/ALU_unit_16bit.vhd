----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date:    17:16:55 03/15/2016 
-- Module Name:    ALU_unit_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_unit_16bit is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Cin : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Vout : out  STD_LOGIC;
           G : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU_unit_16bit;

architecture Behavioral of ALU_unit_16bit is


    COMPONENT arithmetic_circuit_16bit
    PORT(
         Cin : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         G : OUT  std_logic_vector(15 downto 0);
         Cout : OUT  std_logic;
         Vout : OUT  std_logic
        );
    END COMPONENT;
    
    COMPONENT logic_circuit_16bit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

    COMPONENT mux_2_16bit
    PORT(
         S : IN  std_logic;
         In0 : IN  std_logic_vector(15 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	 
	-- signals
	signal arith_out : std_logic_vector(15 downto 0);
	signal logic_out : std_logic_vector(15 downto 0);

begin
--portmaps:

--arithmetic circuit
ac: arithmetic_circuit_16bit PORT MAP (
          Cin => Cin,
          S0 => S0,
          S1 => S1,
          A => A,
          B => B,
          G => arith_out,
          Cout => Cout,
          Vout => Vout
        );

--logical circuit
lc: logic_circuit_16bit PORT MAP (
          A => A,
          B => B,
          s0 => s0,
          s1 => s1,
          Y => logic_out
        );

--2 to 1 multiplexer
   mux: mux_2_16bit PORT MAP (
          S => s2,
          In0 => arith_out,
          In1 => logic_out,
          Z => G
        );
		  
end Behavioral;

