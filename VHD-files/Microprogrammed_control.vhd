----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    22:35:59 03/30/2016 
-- Module Name:    Microprogrammed_control - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprogrammed_control is
    Port ( instruction_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  reset : in STD_LOGIC;
           V : in  STD_LOGIC;
           C : in  STD_LOGIC;
           N : in  STD_LOGIC;
           Z : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           pc_out : out  STD_LOGIC_VECTOR (15 downto 0);
           DR : out  STD_LOGIC_VECTOR (2 downto 0);
           SA : out  STD_LOGIC_VECTOR (2 downto 0);
           SB : out  STD_LOGIC_VECTOR (2 downto 0);
           TD : out  STD_LOGIC;
           TA : out  STD_LOGIC;
           TB : out  STD_LOGIC;
           MB : out  STD_LOGIC;
           FS : out  STD_LOGIC_VECTOR (4 downto 0);
           MD : out  STD_LOGIC;
           RW : out  STD_LOGIC;
           MM : out  STD_LOGIC;
           MW : out  STD_LOGIC);
end Microprogrammed_control;

architecture Behavioral of Microprogrammed_control is

COMPONENT PC
    PORT(
         Extend : IN  std_logic_vector(15 downto 0);
         reset : IN  std_logic;
         PI : IN  std_logic;
         PL : IN  std_logic;
         Clk : IN  std_logic;
         PC_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 
COMPONENT mux_8_to_1_1bit
	PORT(
			A : IN  std_logic_vector(7 downto 0);
			S0 : IN std_logic;
			S1 : IN std_logic;
			S2 : IN std_logic;
			line_out : OUT std_logic
		);
		END COMPONENT;
		
		
COMPONENT Extend
    PORT(
         DR : IN  std_logic_vector(2 downto 0);
         SB : IN  std_logic_vector(2 downto 0);
         extension : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	 
COMPONENT IR
    PORT(
         data_in : IN  std_logic_vector(15 downto 0);
         IL : IN  std_logic;
			Clk : IN std_logic;
         Opcode : OUT  std_logic_vector(6 downto 0);
         DR : OUT  std_logic_vector(2 downto 0);
         SA : OUT  std_logic_vector(2 downto 0);
         SB : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    
 
COMPONENT mux_2_to_1_8bit
    PORT(
         S : IN  std_logic;
         In0 : IN  std_logic_vector(7 downto 0);
         In1 : IN  std_logic_vector(7 downto 0);
         Z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	 
COMPONENT CAR
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
			reset : IN std_logic;
			Clk : IN std_logic;
         Con : IN  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
 
COMPONENT control_memory
    PORT(
         MW : OUT  std_logic;
         MM : OUT  std_logic;
         RW : OUT  std_logic;
         MD : OUT  std_logic;
         FS : OUT  std_logic_vector(4 downto 0);
         MB : OUT  std_logic;
         TB : OUT  std_logic;
         TA : OUT  std_logic;
         TD : OUT  std_logic;
         PL : OUT  std_logic;
         PI : OUT  std_logic;
         IL : OUT  std_logic;
         MC : OUT  std_logic;
         MS : OUT  std_logic_vector(2 downto 0);
         NA : OUT  std_logic_vector(7 downto 0);
         IN_CAR : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 	  	--signals
   signal MC : std_logic;
   signal IL : std_logic;
   signal PI : std_logic;
   signal PL : std_logic;
   signal not_Z : std_logic;
   signal not_C : std_logic;
   signal mux_s_out : std_logic;
   signal MS : std_logic_vector(2 downto 0);
   signal DR_signal : std_logic_vector(2 downto 0);
   signal SA_signal : std_logic_vector(2 downto 0);
   signal SB_signal : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
   signal mux_c_out : std_logic_vector(7 downto 0);
   signal car_out : std_logic_vector(7 downto 0);
   signal extend_out : std_logic_vector(15 downto 0);
   signal ir_opcode_out : std_logic_vector(6 downto 0);
	 
begin

extender : Extend PORT MAP (
          DR => DR_signal,
          SB => SB_signal,
          extension => extend_out
        );


program_counter : PC PORT MAP (
          Extend => extend_out,
			 reset => reset,
			 Clk => Clk,
          PL => PL,
          PI => PI,
          PC_out => pc_out
        );
		  
mux_s : mux_8_to_1_1bit PORT MAP (
          A(0) => '0',
          A(1) => '1',
          A(2) => C,
          A(3) => V,
          A(4) => Z,
          A(5) => N,
          A(6) => not_C,
          A(7) => not_Z,
          S0 => MS(0),
          S1 => MS(1),
          S2 => MS(2),
          line_out => mux_s_out
        );		  

instruction_register : IR PORT MAP (
          data_in => instruction_in,
          IL => IL,
			 Clk => Clk,
          Opcode => ir_opcode_out,
          DR => DR_signal,
          SA => SA_signal,
          SB => SB_signal
        );
		  
mux_c : mux_2_to_1_8bit PORT MAP (
          In0 => NA,
			 In1(7) => '0',
          In1(6 downto 0) => ir_opcode_out,
          S => MC,
          Z => mux_c_out
        );
		  

control_addres_register : CAR PORT MAP (
          data_in => mux_c_out,
			 reset => reset,
			 Clk => Clk,
          Con => mux_s_out,
          data_out => car_out
        );
		  
control_me : control_memory PORT MAP (
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          FS => FS,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          MS => MS,
          NA => NA,
          IN_CAR => car_out
        );
		  
DR <= DR_signal;
SB <= SB_signal;	
SA <= SA_signal;	
not_C <= not C;
not_Z <= not Z;	  
end Behavioral;

