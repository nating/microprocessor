----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    12:56:58 04/01/2016 
-- Design Name: 
-- Module Name:    processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor is
	Port(
			Clk : in STD_LOGIC;
			reset : in STD_LOGIC
			);
end processor;

architecture Behavioral of processor is

COMPONENT Microprogrammed_control is
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
end COMPONENT;


COMPONENT last_data_path is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
			  data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : IN  std_logic_vector(3 downto 0);
           SA : IN  std_logic_vector(3 downto 0);
           SB : IN  std_logic_vector(3 downto 0);
           TD : IN  std_logic;
           TA : IN  std_logic;
           TB : IN  std_logic;
           Clk : in  STD_LOGIC;
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
end COMPONENT;

 
COMPONENT memory_512
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         MemWrite : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
	--signals
	signal V_signal : std_logic;
	signal C_signal : std_logic;
	signal N_signal : std_logic;
	signal Z_signal : std_logic;
	signal TD_signal : std_logic;
	signal TA_signal : std_logic;
	signal TB_signal : std_logic;
	signal MB_signal : std_logic;
	signal MD_signal : std_logic;
	signal RW_signal : std_logic;
	signal MM_signal : std_logic;
	signal MW_signal : std_logic;
	signal DR_signal : std_logic_vector(2 downto 0);
	signal SA_signal : std_logic_vector(2 downto 0);
	signal SB_signal : std_logic_vector(2 downto 0);
	signal FS_signal : std_logic_vector(5 downto 0);
	signal datapath_address_out : std_logic_vector(15 downto 0);
	signal datapath_data_out : std_logic_vector(15 downto 0);
	signal memory_data_out : std_logic_vector(15 downto 0);
	signal micro_pc_out : std_logic_vector(15 downto 0);
	
begin

micro_control : Microprogrammed_control PORT MAP (
          instruction_in => memory_data_out,
          reset => reset,
          V => V_signal,
          C => C_signal,
          N => N_signal,
          Z => Z_signal,
          Clk => Clk,
          pc_out => micro_pc_out,
          DR => DR_signal,
          SA => SA_signal,
          SB => SB_signal,
          TD => TD_signal,
          TA => TA_signal,
          TB => TB_signal,
          MB => MB_signal,
          FS => FS_signal,
          MD => MD_signal,
          RW => RW_signal,
          MM => MM_signal,
          MW => MW_signal
        );


data_path : last_data_path PORT MAP (
          PC => micro_pc_out,
          data_in => memory_data_out,
          DR => DR_signal,
          SA => SA_signal,
          SB => SB_signal,
          TD => TD_signal,
          TA => TA_signal,
          TB => TB_signal,
          Clk => Clk,
          FS => FS_signal,
          RW => RW_signal,
          MB => MB_signal,
          MM => MM_signal,
          MD => MD_signal,
          data_out => datapath_data_out,
          address_out => datapath_address_out,
          V => V_signal,
          C => C_signal,
          N => N_signal,
          Z => Z_signal
        );


mem : memory_512 PORT MAP (
          address => datapath_address_out,
          write_data => datapath_data_out,
          MemWrite => MW_signal,
          read_data => memory_data_out
        );
		  
		  
end Behavioral;
