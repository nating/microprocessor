--------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:   12:38:54 04/01/2016
-- Module Name:   U:/decoder_3to8/control_memory_TestBench.vhd
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY control_memory_TestBench IS
END control_memory_TestBench;
 
ARCHITECTURE behavior OF control_memory_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal IN_CAR : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MB : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal IL : std_logic;
   signal MC : std_logic;
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_memory PORT MAP (
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
          IN_CAR => IN_CAR
        );
		  
      -- Stimulus process
   stim_proc0: process
   begin		
		--Test that accessing IF address gives out the IF code: 
		-- Next Address   MS		MC IL	PI	PL	TD TA	TB	MB	 FS   MD	RW	MM	MW
		-- 		C1			001	0	1	1	0	0	0	0	0	00000	0	0	1	0
		IN_CAR <= x"C0";
		wait for 100 ns;
		
		--Test that accessing B address gives out the B code: 
		-- Next Address   MS		MC IL	PI	PL	TD TA	TB	MB	 FS   MD	RW	MM	MW
		-- 		C0			001	0	0	0	1	0	0	0	0	00000	0	0	0	0
		IN_CAR <= x"30";
		wait;
		
   end process;

END;
