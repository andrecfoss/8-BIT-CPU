----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:35 03/05/2023 
-- Design Name: 
-- Module Name:    Processor - Struct 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Processor IS
    Port ( clk : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC;
           opcode : IN STD_LOGIC_VECTOR (4 downto 0);
           SEL_R : in  STD_LOGIC;
           Constante : IN  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Endereco : OUT  STD_LOGIC_VECTOR (7 downto 0);
           WR : out  STD_LOGIC;
			  
			  Operando1 : INOUT STD_LOGIC_VECTOR (7 downto 0);
			  
			  -----------------------------------------------
			  
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
END Processor;

ARCHITECTURE Struct OF Processor IS

component PeripheralsManager is
    Port ( ESCR_P : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
			  Operando1 : in STD_LOGIC_VECTOR (7 downto 0);
			  Dados_IN : out STD_LOGIC_VECTOR (7 downto 0);
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MultiplexerRegistos is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_Data : in  STD_LOGIC_VECTOR (1 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RegistoA is
    Port ( ESCR_R : in  STD_LOGIC;
           Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RegistoB is
    Port ( ESCR_R : in  STD_LOGIC;
           Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component ALogicUnit is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (2 downto 0);		-- 3-Bits in each operation
           E_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RegistoFlags is
    Port ( E_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           ESCR_FLAG : in  STD_LOGIC;
           SEL_FLAG : in  STD_LOGIC_VECTOR (2 downto 0);
           S_FLAG : out  STD_LOGIC);
end component;

component ProgramCounter is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUXProgramCounter is
    Port ( SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
           S_FLAG : in  STD_LOGIC;
			  Output_NOR : IN STD_LOGIC;
			  Operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : out  STD_LOGIC);
end component;

COMPONENT Porta_NOR IS
	PORT (	Operando1: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				Output_NOR : out STD_LOGIC);
END COMPONENT;

component ROMDecoder is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_PC : out  STD_LOGIC_VECTOR (2 downto 0);
           SEL_FLAG : out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_FLAG : out  STD_LOGIC;
           SEL_ALU : out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_R : out  STD_LOGIC;
           SEL_Data : out  STD_LOGIC_VECTOR (1 downto 0);
           ESCR_P : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end component;

SIGNAL ESCR_P : STD_LOGIC;
SIGNAL Dados_IN : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL Resultado : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL SEL_Data : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL Dados_R : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL ESCR_R : STD_LOGIC;
SIGNAL Operando2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL E_FLAG : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL SEL_ALU : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL ESCR_PC : STD_LOGIC;
SIGNAL SEL_FLAG : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL S_FLAG : STD_LOGIC;
SIGNAL Output_NOR : STD_LOGIC;
SIGNAL SEL_PC : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL ESCR_FLAG : STD_LOGIC;

BEGIN

-- ASSEMBLING EACH COMPONENT --

Peripherals : PeripheralsManager 	PORT MAP (ESCR_P, clk, PIN, Operando1, Dados_IN, POUT);
MuxRegistos : MultiplexerRegistos 	PORT MAP (Constante, Dados_M, Dados_IN, Resultado, SEL_Data, Dados_R);
REGA 			: RegistoA 					PORT MAP (ESCR_R, Dados_R, SEL_R, clk, Operando1);
REGB 			: RegistoB 					PORT MAP (ESCR_R, Dados_R, SEL_R, clk, Operando2);
LogicUnit 	: ALogicUnit 				PORT MAP (Operando1, Operando2, SEL_ALU, E_FLAG, Resultado);
RegFlags 	: RegistoFlags 			PORT MAP (E_FLAG, clk, ESCR_FLAG, SEL_FLAG, S_FLAG);
PCounter 	: ProgramCounter 			PORT MAP (Constante, ESCR_PC, clk, reset, Endereco);
MUXPC 		: MUXProgramCounter 		PORT MAP (SEL_PC, S_FLAG, Output_NOR, Operando1, ESCR_PC);
NOR_GATE		: Porta_NOR					PORT MAP (Operando1, Output_NOR);
ROMD 			: ROMDecoder 				PORT MAP (opcode, SEL_PC, SEL_FLAG, ESCR_FLAG, SEL_ALU, ESCR_R, SEL_Data, ESCR_P, WR);

-- #

END Struct;

