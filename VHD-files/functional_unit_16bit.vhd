----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    17:45:49 03/15/2016 
-- Module Name:    functional_unit_16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity functional_unit_16bit is
    Port ( FSS : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0);
           V : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end functional_unit_16bit;

architecture Behavioral of functional_unit_16bit is


    COMPONENT ALU_unit_16bit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         Cout : OUT  std_logic;
         Vout : OUT  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

    COMPONENT barrel_shifter_16bit
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         F : OUT  std_logic_vector(15 downto 0)
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
	 
	 
   --Inputs
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';
	signal In0 : std_logic_vector(15 downto 0) := (others => '0');
	signal In1 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal Vout : std_logic;
   signal alu_out : std_logic_vector(15 downto 0);
   signal shift_out : std_logic_vector(15 downto 0);
	
begin
--ALU
   aluu: ALU_unit_16bit PORT MAP (
          A => A,
          B => B,
          Cin => FSS(0),--carry only used for some operations determined by FS
          S0 => FSS(1),
          S1 => FSS(2),
          S2 => FSS(3),
          Cout => C,
          Vout => V,
          G => alu_out
        );
--shifter
  shifter: barrel_shifter_16bit PORT MAP (
          B => B,
          S0 => FSS(3),
          S1 => FSS(2),
          S2 => FSS(1),
          S3 => FSS(0),
          F => shift_out
        );
--mux
  mux: mux_2_16bit PORT MAP (
          S => FSS(4),
          In0 => alu_out,
          In1 => shift_out,
          Z => F
        );

Z <= '1' when (alu_out=x"0000") else '0';
N <= alu_out(15);
end Behavioral;

