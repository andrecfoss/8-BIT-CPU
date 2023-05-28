-----------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:24 03/05/2023 
-- Design Name: 
-- Module Name:    Motherboard - Struct 
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
------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;	-- IMPORTAR BIBLIOTECAS --

ENTITY Motherboard IS
    Port ( clk : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
			  
           reset : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
END Motherboard;

ARCHITECTURE Struct OF Motherboard IS

COMPONENT Processor IS
    Port ( clk : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC;
           opcode : IN  STD_LOGIC_VECTOR (4 downto 0);
           SEL_R : in  STD_LOGIC;
           Constante : IN  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Endereco : OUT  STD_LOGIC_VECTOR (7 downto 0);
           WR : out  STD_LOGIC;
			  
			  Operando1 : INOUT  STD_LOGIC_VECTOR (7 downto 0);
			  
			  --------------------------------------------------
			  
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT InstructionsMemory IS
    Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
			  opcode : out  STD_LOGIC_VECTOR (4 downto 0);
			  SEL_R : out  STD_LOGIC;
			  Constante : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT DataMemory IS
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL opcode : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL SEL_R : STD_LOGIC;
SIGNAL Constante : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL Dados_M : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL Endereco : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL WR : STD_LOGIC;
SIGNAL Operando1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

Processador : 	Processor 				PORT MAP (clk, PIN, reset, opcode, SEL_R, Constante, Dados_M, Endereco, WR, Operando1, POUT);
IMEM : 			InstructionsMemory 	PORT MAP (Endereco, opcode, SEL_R, Constante);
RAMD : 			DataMemory 				PORT MAP (Operando1, WR, clk, Constante, Dados_M);

END Struct;

