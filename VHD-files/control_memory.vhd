----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    17:54:17 03/29/2016 
-- Module Name:    control_memory - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_memory is
Port ( 
		MW : out std_logic;
		MM : out std_logic;
		RW : out std_logic;
		MD : out std_logic;
		FS : out std_logic_vector(4 downto 0);
		MB : out std_logic;
		TB : out std_logic;
		TA : out std_logic;
		TD : out std_logic;
		PL : out std_logic;
		PI : out std_logic;
		IL : out std_logic;
		MC : out std_logic;
		MS : out std_logic_vector(2 downto 0);
		NA : out std_logic_vector(7 downto 0);
		IN_CAR : in std_logic_vector(7 downto 0));
end control_memory;

architecture Behavioral of control_memory is
type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);

----------------------------------------------------------------------------------------------------

--Instruction	Address	Next Address . MS		MC.IL	PI	PL	TD.TA	TB	MB	. FS .MD	RW	MM	MW		Code

--		ADI			00		  IF  -> C0		001	0	0	0	0	0	0	0	1	00010	0	1	0	0	=	0xC020224
--		LD				01		  IF  -> C0		001	0	0	0	0	0	0	0	0	00000	1	1	0	0	=	0xC02000C
--		ST				02		  IF  -> C0		001	0	0	0	0	0	0	0	0	00000	0	0	0	1	=	0xC020001
--		INC			03		  IF  -> C0		001	0	0	0	0	0	0	0	0	00001	0	1	0	0	=	0xC020014
--		NOT			04		  IF  -> C0		001	0	0	0	0	0	0	0	0	01110	0	1	0	0	=	0xC0200E4
--		ADD			05		  IF  -> C0		001	0	0	0	0	0	0	0	0	00010	0	1	0	0	=	0xC020024

--		LRI			06		  LRI2-> 86		001	0	0	0	0	0	0	0	0	00000	1	1	0	0	=	0x862000C
--		SR				07		  SR2 -> 87		111	0	0	0	0	1	0	0	0	00000	0	1	0	0	=	0x87E1004

--		BEQ			09		  B   -> 30		100	0	0	0	1  1  1  1	0  10000	0	1	0	0	=	0x0081D04
--		Catch			0A		  IF  -> C0		001	0	0	0	0	0	0	0	0	00000	0	0	0	0	=	0xC020000

--		BNZ			0B		  B   -> 30		111	0	0	0	0	0	0	0	0	00000	0	0	0	0	=	0x30E0000
--		Catch			0C		  IF  -> C0		001	0	0	0	0	0	0	0	0	00000	0	0	0	0	=	0xC020000

--		CMP 			0D		  IF  -> C0		001	0	0	0	0	1	0	0	0	00101	0	1	0	0	=	0xC021054
--		LR 			29		  IF  -> C0		001	0	0	0	0	0	0	0	0	00000	1	1	0	0	=	0xC02000C
--		B				30		  IF  -> C0		001	0	0	0	1	0	0	0	0	00000	0	0	0	0	=	0xC022000

--		LRI2			86		  IF  -> C0		001	0	0	0	0	0	1	0	0	00000	1	1	0	0	=	0xC02080C
--		SR2			87		  SR3 -> 89		001	0	0	0	0	0	0	0	0	10100	0	1	0	0	=	0x8820144
--		SR3			88		  SR2 -> 87		100	0	0	0	0	1	1	0	0	00110	0	1	0	0	=	0x8781864
--		Catch			89		  IF  -> C0		001	0	0	0	0	0	0	0	0	00000	0	0	0	0	=	0xC020000

--		IF				C0		  EXO -> C1		000	0	1	1	0	0	0	0	0	00000	0	0	1	0	=	0xC10C002
--		EXO			C1		  --	->	00		001	1	0	0	0	0	0	0	0	00000	0	0	0	0	=	0x0030000

----------------------------------------------------------------------------------------------------

begin

memory_m: process(IN_CAR)
variable control_mem : mem_array:=(

X"C020224", -- 0x00	ADI:	Add immediate constant
X"C02000C", -- 0x01	LD:	Load
X"C020001", -- 0x02	ST:	Store
X"C020014", -- 0x03	INC:	Increment
X"C0200E4", -- 0x04	NOT:	Not
X"C020024", -- 0x05	ADD:	Add
X"862000C", -- 0x06	LRI:	Load into immediate register	Micro operation 1
X"87E1004", -- 0x07	SR:	Shift Right 						Micro-operation 1
X"C020000", -- 0x08	Catch (to fall through to if shifted right by zero)
X"3080000", -- 0x09	BEQ:  Branch if equal
X"C020000", -- 0x0A	Catch (to fall through to if branch not taken)
X"30E0000", -- 0x0B	BNZ:	Branch if not zero
X"C020000", -- 0x0C	Catch (to fall through to if branch not taken)
X"C021054", -- 0x0D	CMP:  Compare
X"0000000", -- 0x0E
X"0000000", -- 0x0F

X"0000000", -- 0x10
X"0000000", -- 0x11
X"0000000", -- 0x12
X"0000000", -- 0x13
X"0000000", -- 0x14
X"0000000", -- 0x15
X"0000000", -- 0x16
X"0000000", -- 0x17
X"0000000", -- 0x18
X"0000000", -- 0x19
X"0000000", -- 0x1A
X"0000000", -- 0x1B
X"0000000", -- 0x1C
X"0000000", -- 0x1D
X"0000000", -- 0x1E
X"0000000", -- 0x1F

X"0000000", -- 0x20
X"0000000", -- 0x21
X"0000000", -- 0x22
X"0000000", -- 0x23
X"0000000", -- 0x24
X"0000000", -- 0x25
X"0000000", -- 0x26
X"0000000", -- 0x27
X"0000000", -- 0x28
X"C02000C", -- 0x29	LR: Load
X"0000000", -- 0x2A
X"0000000", -- 0x2B
X"0000000", -- 0x2C
X"0000000", -- 0x2D
X"0000000", -- 0x2E
X"0000000", -- 0x2F

X"C022000", -- 0x30	B: Unconditional Branch
X"0000000", -- 0x31
X"0000000", -- 0x32
X"0000000", -- 0x33
X"0000000", -- 0x34
X"0000000", -- 0x35
X"0000000", -- 0x36
X"0000000", -- 0x37
X"0000000", -- 0x38
X"0000000", -- 0x39
X"0000000", -- 0x3A
X"0000000", -- 0x3B
X"0000000", -- 0x3C
X"0000000", -- 0x3D
X"0000000", -- 0x3E
X"0000000", -- 0x3F

X"0000000", -- 0x40
X"0000000", -- 0x41
X"0000000", -- 0x42
X"0000000", -- 0x43
X"0000000", -- 0x44
X"0000000", -- 0x45
X"0000000", -- 0x46
X"0000000", -- 0x47
X"0000000", -- 0x48
X"0000000", -- 0x49
X"0000000", -- 0x4A
X"0000000", -- 0x4B
X"0000000", -- 0x4C
X"0000000", -- 0x4D
X"0000000", -- 0x4E
X"0000000", -- 0x4F

X"0000000", -- 0x50
X"0000000", -- 0x51
X"0000000", -- 0x52
X"0000000", -- 0x53
X"0000000", -- 0x54
X"0000000", -- 0x55
X"0000000", -- 0x56
X"0000000", -- 0x57
X"0000000", -- 0x58
X"0000000", -- 0x59
X"0000000", -- 0x5A
X"0000000", -- 0x5B
X"0000000", -- 0x5C
X"0000000", -- 0x5D
X"0000000", -- 0x5E
X"0000000", -- 0x5F

X"0000000", -- 0x60
X"0000000", -- 0x61
X"0000000", -- 0x62
X"0000000", -- 0x63
X"0000000", -- 0x64
X"0000000", -- 0x65
X"0000000", -- 0x66
X"0000000", -- 0x67
X"0000000", -- 0x68
X"0000000", -- 0x69
X"0000000", -- 0x6A
X"0000000", -- 0x6B
X"0000000", -- 0x6C
X"0000000", -- 0x6D
X"0000000", -- 0x6E
X"0000000", -- 0x6F

X"0000000", -- 0x70
X"0000000", -- 0x71
X"0000000", -- 0x72
X"0000000", -- 0x73
X"0000000", -- 0x74
X"0000000", -- 0x75
X"0000000", -- 0x76
X"0000000", -- 0x77
X"0000000", -- 0x78
X"0000000", -- 0x79
X"0000000", -- 0x7A
X"0000000", -- 0x7B
X"0000000", -- 0x7C
X"0000000", -- 0x7D
X"0000000", -- 0x7E
X"0000000", -- 0x7F

X"0000000", -- 0x80
X"0000000", -- 0x81
X"0000000", -- 0x82
X"0000000", -- 0x83
X"0000000", -- 0x84
X"0000000", -- 0x85
X"C02080C", -- 0x86	LRI2:	Load Immediate Register Micro-operation 2
X"8820144", -- 0x87	SRM2: Shift Register	Micro-operation 2
X"8781864", -- 0x88	SRM3: Shift Register	Micro-operation 3
X"C020000", -- 0x89	Catch (to fall through to if finished shifting right)
X"0000000", -- 0x8A
X"0000000", -- 0x8B
X"0000000", -- 0x8C
X"0000000", -- 0x8D
X"0000000", -- 0x8E
X"0000000", -- 0x8F

X"0000000", -- 0x90
X"0000000", -- 0x91
X"0000000", -- 0x92
X"0000000", -- 0x93
X"0000000", -- 0x94
X"0000000", -- 0x95
X"0000000", -- 0x96
X"0000000", -- 0x97
X"0000000", -- 0x98
X"0000000", -- 0x99
X"0000000", -- 0x9A
X"0000000", -- 0x9B
X"0000000", -- 0x9C
X"0000000", -- 0x9D
X"0000000", -- 0x9E
X"0000000", -- 0x9F

X"0000000", -- 0xA0
X"0000000", -- 0xA1
X"0000000", -- 0xA2
X"0000000", -- 0xA3
X"0000000", -- 0xA4
X"0000000", -- 0xA5
X"0000000", -- 0xA6
X"0000000", -- 0xA7
X"0000000", -- 0xA8
X"0000000", -- 0xA9
X"0000000", -- 0xAA
X"0000000", -- 0xAB
X"0000000", -- 0xAC
X"0000000", -- 0xAD
X"0000000", -- 0xAE
X"0000000", -- 0xAF

X"0000000", -- 0xB0
X"0000000", -- 0xB1
X"0000000", -- 0xB2
X"0000000", -- 0xB3
X"0000000", -- 0xB4
X"0000000", -- 0xB5
X"0000000", -- 0xB6
X"0000000", -- 0xB7
X"0000000", -- 0xB8
X"0000000", -- 0xB9
X"0000000", -- 0xBA
X"0000000", -- 0xBB
X"0000000", -- 0xBC
X"0000000", -- 0xBD
X"0000000", -- 0xBE
X"0000000", -- 0xBF

X"C10C002", -- 0xC0	Instruction fetch
X"0030000", -- 0xC1	EXO
X"0000000", -- 0xC2
X"0000000", -- 0xC3
X"0000000", -- 0xC4
X"0000000", -- 0xC5
X"0000000", -- 0xC6
X"0000000", -- 0xC7
X"0000000", -- 0xC8
X"0000000", -- 0xC9
X"0000000", -- 0xCA
X"0000000", -- 0xCB
X"0000000", -- 0xCC
X"0000000", -- 0xCD
X"0000000", -- 0xCE
X"0000000", -- 0xCF

X"0000000", -- 0xD0
X"0000000", -- 0xD1
X"0000000", -- 0xD2
X"0000000", -- 0xD3
X"0000000", -- 0xD4
X"0000000", -- 0xD5
X"0000000", -- 0xD6
X"0000000", -- 0xD7
X"0000000", -- 0xD8
X"0000000", -- 0xD9
X"0000000", -- 0xDA
X"0000000", -- 0xDB
X"0000000", -- 0xDC
X"0000000", -- 0xDD
X"0000000", -- 0xDE
X"0000000", -- 0xDF

X"0000000", -- 0xE0
X"0000000", -- 0xE1
X"0000000", -- 0xE2
X"0000000", -- 0xE3
X"0000000", -- 0xE4
X"0000000", -- 0xE5
X"0000000", -- 0xE6
X"0000000", -- 0xE7
X"0000000", -- 0xE8
X"0000000", -- 0xE9
X"0000000", -- 0xEA
X"0000000", -- 0xEB
X"0000000", -- 0xEC
X"0000000", -- 0xED
X"0000000", -- 0xEE
X"0000000", -- 0xEF

X"0000000", -- 0xF0
X"0000000", -- 0xF1
X"0000000", -- 0xF2
X"0000000", -- 0xF3
X"0000000", -- 0xF4
X"0000000", -- 0xF5
X"0000000", -- 0xF6
X"0000000", -- 0xF7
X"0000000", -- 0xF8
X"0000000", -- 0xF9
X"0000000", -- 0xFA
X"0000000", -- 0xFB
X"0000000", -- 0xFC
X"0000000", -- 0xFD
X"0000000", -- 0xFE
X"0000000"  -- 0xFF
);
variable addr : integer;
variable control_out : std_logic_vector(27 downto 0);

begin
	addr := conv_integer(IN_CAR);
	control_out := control_mem(addr);
	MW <= control_out(0);
	MM <= control_out(1);
	RW <= control_out(2);
	MD <= control_out(3);
	FS <= control_out(8 downto 4);
	MB <= control_out(9);
	TB <= control_out(10);
	TA <= control_out(11);
	TD <= control_out(12);
	PL <= control_out(13);
	PI <= control_out(14);
	IL <= control_out(15);
	MC <= control_out(16);
	MS <= control_out(19 downto 17);
	NA <= control_out(27 downto 20);
	end process;
end Behavioral;

