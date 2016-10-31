----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    15:25:27 03/29/2016 
-- Module Name:    new_reg_file_9x16bit - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity new_reg_file_9x16bit is
    Port ( des_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           a_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           b_sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  TD : in STD_LOGIC;
			  TA : in STD_LOGIC;
			  TB : in STD_LOGIC;
           load_enable : in  STD_LOGIC;
			  reset : in std_logic;
           Clk : in  STD_LOGIC;
           input_data : in  STD_LOGIC_VECTOR (15 downto 0);
           a_data : out  STD_LOGIC_VECTOR (15 downto 0);
           b_data : out  STD_LOGIC_VECTOR (15 downto 0));
end new_reg_file_9x16bit;

architecture Behavioral of new_reg_file_9x16bit is
-- components
	-- 16 bit Register for register file
	COMPONENT reg16
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
		-- 3 to 8 Decoder
	COMPONENT decoder_4to16
	PORT(
		A0 : IN std_logic;
		A1 : IN std_logic;
		A2 : IN std_logic;
		A3 : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		Q8 : OUT std_logic;
		Q9 : OUT std_logic;
		Q10 : OUT std_logic;
		Q11 : OUT std_logic;
		Q12 : OUT std_logic;
		Q13 : OUT std_logic;
		Q14 : OUT std_logic;
		Q15 : OUT std_logic
		);
	END COMPONENT;
	
	-- 2 to 1 line multiplexer
	COMPONENT mux_2_16bit
	PORT(
		In0 : IN std_logic_vector(15 downto 0);
		In1 : IN std_logic_vector(15 downto 0);
		s : IN std_logic;
		Z : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	-- 16 to 1 line multiplexer
	COMPONENT mux16_16bit
	PORT(
		In0 : IN std_logic_vector(15 downto 0);
		In1 : IN std_logic_vector(15 downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		In3 : IN std_logic_vector(15 downto 0);
		In4 : IN std_logic_vector(15 downto 0);
		In5 : IN std_logic_vector(15 downto 0);
		In6 : IN std_logic_vector(15 downto 0);
		In7 : IN std_logic_vector(15 downto 0);
		In8 : IN std_logic_vector(15 downto 0);
		In9 : IN std_logic_vector(15 downto 0);
		In10 : IN std_logic_vector(15 downto 0);
		In11 : IN std_logic_vector(15 downto 0);
		In12 : IN std_logic_vector(15 downto 0);
		In13 : IN std_logic_vector(15 downto 0);
		In14 : IN std_logic_vector(15 downto 0);
		In15 : IN std_logic_vector(15 downto 0);
		S0 : IN std_logic;
		S1 : IN std_logic;
		S2 : IN std_logic;
		S3 : IN std_logic;
		Z : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	-- signals
	signal d_data : std_logic_vector(15 downto 0);
	signal load_reg0, load_reg1, load_reg2, load_reg3,
	load_reg4, load_reg5, load_reg6, load_reg7, load_reg8, load_reg9, load_reg10,
	load_reg11, load_reg12, load_reg13, load_reg14, load_reg15 : std_logic;
	signal reg0_q, reg1_q, reg2_q, reg3_q,
	reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, reg9_q, reg10_q,
	reg11_q, reg12_q, reg13_q, reg14_q, reg15_q : std_logic_vector(15 downto 0);
	signal write_reg0, write_reg1, write_reg2, write_reg3,
	write_reg4, write_reg5, write_reg6, write_reg7, write_reg8, write_reg9, write_reg10,
	write_reg11, write_reg12, write_reg13, write_reg14, write_reg15 : std_logic;

begin
-- port maps ;-)

-- register 0
reg00: reg16 PORT MAP(
	D => d_data,
	load => write_reg0,
	Clk => Clk,
	Q => reg0_q
);
-- register 1
reg01: reg16 PORT MAP(
	D => d_data,
	load => write_reg1,
	Clk => Clk,
	Q => reg1_q
);
-- register 2
reg02: reg16 PORT MAP(
	D => d_data,
	load => write_reg2,
	Clk => Clk,
	Q => reg2_q
);
-- register 3
reg03: reg16 PORT MAP(
	D => d_data,
	load => write_reg3,
	Clk => Clk,
	Q => reg3_q
);
-- register 4
reg04: reg16 PORT MAP(
	D => d_data,
	load => write_reg4,
	Clk => Clk,
	Q => reg4_q
);
-- register 5
reg05: reg16 PORT MAP(
	D => d_data,
	load => write_reg5,
	Clk => Clk,
	Q => reg5_q
);
-- register 6
reg06: reg16 PORT MAP(
	D => d_data,
	load => write_reg6,
	Clk => Clk,
	Q => reg6_q
);
-- register 7
reg07: reg16 PORT MAP(
	D => d_data,
	load => write_reg7,
	Clk => Clk,
	Q => reg7_q
);
-- register 8
reg08: reg16 PORT MAP(
	D => d_data,
	load => write_reg8,
	Clk => Clk,
	Q => reg8_q
);

-- Destination register decoder
des_decoder_4to16: decoder_4to16 PORT MAP(
	A0 => des_sel(0),
	A1 => des_sel(1),
	A2 => des_sel(2),
	A3 => TD,
	Q0 => load_reg0,
	Q1 => load_reg1,
	Q2 => load_reg2,
	Q3 => load_reg3,
	Q4 => load_reg4,
	Q5 => load_reg5,
	Q6 => load_reg6,
	Q7 => load_reg7,
	Q8 => load_reg8,
	Q9 => load_reg9,
	Q10 => load_reg10,
	Q11 => load_reg11,
	Q12 => load_reg12,
	Q13 => load_reg13,
	Q14 => load_reg14,
	Q15 => load_reg15
);


-- 16 to 1 source register multiplexer
a_data_mux: mux16_16bit PORT MAP(
	In0 => reg0_q,
	In1 => reg1_q,
	In2 => reg2_q,
	In3 => reg3_q,
	In4 => reg4_q,
	In5 => reg5_q,
	In6 => reg6_q,
	In7 => reg7_q,
	In8 => reg8_q,
	In9 => reg9_q,
	In10 => reg10_q,
	In11 => reg11_q,
	In12 => reg12_q,
	In13 => reg13_q,
	In14 => reg14_q,
	In15 => reg15_q,
	S0 => a_sel(0),
	S1 => a_sel(1),
	S2 => a_sel(2),
	S3 => TA,
	Z => a_data
);

-- 16 to 1 source register multiplexer
b_data_mux: mux16_16bit PORT MAP(
	In0 => reg0_q,
	In1 => reg1_q,
	In2 => reg2_q,
	In3 => reg3_q,
	In4 => reg4_q,
	In5 => reg5_q,
	In6 => reg6_q,
	In7 => reg7_q,
	In8 => reg8_q,
	In9 => reg9_q,
	In10 => reg10_q,
	In11 => reg11_q,
	In12 => reg12_q,
	In13 => reg13_q,
	In14 => reg14_q,
	In15 => reg15_q,
	S0 => b_sel(0),
	S1 => b_sel(1),
	S2 => b_sel(2),
	S3 => TB,
	Z => b_data
);
	
	write_reg0 <= (load_reg0 and load_enable) or reset;
	write_reg1 <= (load_reg1 and load_enable) or reset;
	write_reg2 <= (load_reg2 and load_enable) or reset;
	write_reg3 <= (load_reg3 and load_enable) or reset;
	write_reg4 <= (load_reg4 and load_enable) or reset;
	write_reg5 <= (load_reg5 and load_enable) or reset;
	write_reg6 <= (load_reg6 and load_enable) or reset;
	write_reg7 <= (load_reg7 and load_enable) or reset;
	write_reg8 <= ( TD and load_enable) or reset;
	write_reg9 <= (load_reg9 and load_enable) or reset;
	write_reg10 <= (load_reg10 and load_enable) or reset;
	write_reg11 <= (load_reg11 and load_enable) or reset;
	write_reg12 <= (load_reg12 and load_enable) or reset;
	write_reg13 <= (load_reg13 and load_enable) or reset;
	write_reg14 <= (load_reg14 and load_enable) or reset;
	write_reg15 <= (load_reg15 and load_enable) or reset;
	
	d_data <= x"0000" when reset='1' else input_data;
	
end Behavioral;
