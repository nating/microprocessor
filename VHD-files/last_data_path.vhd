----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    16:45:46 03/29/2016 
-- Module Name:    last_data_path - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity last_data_path is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
			  data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : IN  std_logic_vector(2 downto 0);
           SA : IN  std_logic_vector(2 downto 0);
           SB : IN  std_logic_vector(2 downto 0);
           TD : IN  std_logic;
           TA : IN  std_logic;
           TB : IN  std_logic;
           Clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           FS : IN  std_logic_vector(4 downto 0);
           RW : IN  std_logic;
           MB : IN  std_logic;
           MM : IN  std_logic;
           MD : IN  std_logic;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           address_out : out  STD_LOGIC_VECTOR (15 downto 0);
           V : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end last_data_path;

architecture Behavioral of last_data_path is

    COMPONENT new_reg_file_9x16bit
    PORT(
         des_sel : IN  std_logic_vector(2 downto 0);
         a_sel : IN  std_logic_vector(2 downto 0);
         b_sel : IN  std_logic_vector(2 downto 0);
			TD : IN std_logic;
			TA : IN std_logic;
			TB : IN std_logic;
         load_enable : IN  std_logic;
			reset : in std_logic;
         Clk : IN  std_logic;
         input_data : IN  std_logic_vector(15 downto 0);
         a_data : OUT  std_logic_vector(15 downto 0);
         b_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT zero_fill
	 PORT(
			SB : IN std_logic_vector(2 downto 0);
			constant_out : out std_logic_vector(15 downto 0)
			);
	 END COMPONENT;
	 
    COMPONENT functional_unit_16bit
    PORT(
         FSS : IN  std_logic_vector(4 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         F : OUT  std_logic_vector(15 downto 0);
         V : OUT  std_logic;
         C : OUT  std_logic;
         N : OUT  std_logic;
         Z : OUT  std_logic
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
	 
	  	--signals
   signal Cout : std_logic;
   signal Vout : std_logic;
   signal mux_b_out : std_logic_vector(15 downto 0);
   signal mux_d_out : std_logic_vector(15 downto 0);
   signal zero_fill_out : std_logic_vector(15 downto 0);
   signal functional_unit_out : std_logic_vector(15 downto 0);
   signal d_data : std_logic_vector(15 downto 0);
   signal a_reg_file_out : std_logic_vector(15 downto 0);
   signal b_reg_file_out : std_logic_vector(15 downto 0);
	 
begin
		  
reg_file: new_reg_file_9x16bit PORT MAP (
          des_sel(2 downto 0) => DR,
			 TD => TD,
          a_sel(2 downto 0) => SA,
			 TA => TA,
          b_sel(2 downto 0) => SB,
			 TB => TB,
          load_enable => RW,
			 reset => reset,
          Clk => Clk,
          input_data => mux_d_out,
          a_data => a_reg_file_out,
          b_data => b_reg_file_out
        );
		  
z_fill: zero_fill PORT MAP (
			SB => SB,
			constant_out => zero_fill_out
			);
		  
func_unit: functional_unit_16bit PORT MAP (
          FSS => FS,
          A => a_reg_file_out,
          B => mux_b_out,
          F => functional_unit_out,
          V => V,
          C => C,
          N => N,
          Z => Z
        );
		   
mux_b: mux_2_16bit PORT MAP (
          S => MB,
          In0 => b_reg_file_out,
          In1 => zero_fill_out,
          Z => mux_b_out
        );
	
mux_d: mux_2_16bit PORT MAP (
          S => MD,
          In0 => functional_unit_out,
          In1 => data_in,
          Z => mux_d_out
        );
		   
mux_m: mux_2_16bit PORT MAP (
          S => MM,
          In0 => a_reg_file_out,
          In1 => PC,
          Z => address_out
        );
		  
data_out <= mux_b_out;
end Behavioral;