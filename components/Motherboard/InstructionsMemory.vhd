----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:07 03/05/2023 
-- Design Name: 
-- Module Name:    InstructionsMemory - Behavioral 
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

entity InstructionsMemory is
   Port (  Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
			  opcode : out  STD_LOGIC_VECTOR (4 downto 0);
			  SEL_R : out  STD_LOGIC;
			  Constante : out  STD_LOGIC_VECTOR (7 downto 0));
end InstructionsMemory;

ARCHITECTURE Behavioral of InstructionsMemory is

begin

	PROCESS (Endereco) 
	--BEGIN
		
		TYPE Memory IS ARRAY (0 TO 255) OF STD_LOGIC_VECTOR (13 DOWNTO 0);			-- DIMENSÃO de 14-Bits : 
		Variable Address_Memory : Memory;														-- opcode 		- 5-Bits
		BEGIN																								-- SEL_R			- 1-Bit
																											-- Constante 	- 8-Bits
		CASE Endereco IS		-- Todos os casos dos endereços em 8-Bits Binary
			
-- ENDEREÇO -- INSTRUÇÃO																-- DESCRIÇÃO de cada Instrução															
			
--	0			-- LD RB, 10
				WHEN "00000000" 	=> 	opcode 		<= 	"00010";				-- LDP Ri, Constante
												SEL_R 		<= 	'1';					-- RB -> SEL_R = '1'
												Constante 	<= 	"00001010";			-- 10 -> 1010
			
--	1			-- LDP RA
				WHEN "00000001" 	=> 	opcode 		<= 	"00000";				-- LDP Ri
												SEL_R 		<= 	'0';					-- RA -> SEL_R = '0'
												Constante	<= 	"XXXXXXXX";			-- Não existe Constante
			
--	2			-- JN RA, 7
				WHEN "00000010" 	=> 	opcode		<= 	"10010";				-- JN RA, Constante
												SEL_R 		<= 	'0';					-- RA -> SEL_R = '0'
												Constante 	<= 	"00000111";			-- 7 -> 111
			
--	3			-- CMP RA, RB
				WHEN "00000011"	=> 	opcode		<= 	"01011";				-- CMP RA, RB
												SEL_R			<= 	'X';					-- RA e RB na mesma instrução -> SEL_R = 'X'
												Constante   <= 	"XXXXXXXX";			-- Não existe Constante
			
-- 4			-- JG 14
				WHEN "00000100"	=>		opcode		<= 	"01111";				-- JG Constante
												SEL_R			<= 	'X';					-- Não existe Registos nesta instrução
												Constante	<= 	"00001110";			-- 14 -> 1110
			
-- 5			-- LD RA, -1
				WHEN "00000101"	=> 	opcode		<= 	"00010";				-- LD Ri, Constante
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"11111111";			-- -1 -> 1111 1111
											
-- 6			-- JMP 29
				WHEN "00000110"	=>		opcode		<=		"10011";				-- JMP Constante
												SEL_R			<=		'X';					-- Não existe Registos nesta instrução
												Constante	<=		"00011101";			-- 29 -> 11101
											
-- 7			-- LD RB, -1
				WHEN "00000111"	=>		opcode		<=		"00010";				-- LD Ri, Constante
												SEL_R			<=		'1';					-- RB -> SEL_R = '1'
												Constante	<=		"11111111";			-- -1 -> 1111 1111
			
-- 8			-- XOR RA, RB
				WHEN "00001000"	=>		opcode		<=		"01010";				-- XOR RA, RB
												SEL_R			<=		'0';					-- Não existe Registos nesta instrução
												Constante	<=		"XXXXXXXX";			-- Não existe Constante
												
-- 9			-- LD RB, 1								
				WHEN "00001001"	=>		opcode		<=		"00010";				-- LD Ri, Constante
												SEL_R			<=		'1';					-- RB -> SEL_R = '1'
												Constante	<=		"00000001";			-- 1 -> 1
											
-- 10 		-- ADD RA, RB
				WHEN "00001010"	=>		opcode		<=		"00101";				-- ADD RA, RB
												SEL_R			<=		'0';					-- RA e RB na mesma instrução -> SEL_R = 'X'
												Constante	<=		"XXXXXXXX";			-- Não existe Constante
			
-- 11			-- LD RB, 14
				WHEN "00001011"	=>		opcode		<=		"00010";				-- LD Ri, Constante
												SEL_R			<=		'1';					-- RB -> SEL_R = '1'
												Constante	<=		"00001110";			-- 14 -> 1110
			
-- 12			-- SUB RA, RB
				WHEN "00001100"	=>		opcode		<=		"00110";				-- SUB RA, RB
												SEL_R			<=		'0';					-- RA e RB na mesma instrução -> SEL_R = 'X'
												Constante	<=		"XXXXXXXX";			-- Não existe Constante
											
-- 13			-- JMP 29
				WHEN "00001101"	=>		opcode		<=		"10011";				-- JMP Constante
												SEL_R			<=		'X';					-- Não existe Registos nesta instrução
												Constante	<=		"00011101";			-- 29 -> 11101
			
-- 14			-- ST[10], RA
				WHEN "00001110"	=>		opcode		<=		"00100";				-- ST[Constante], RA
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00001010";			-- 10 -> 1010
			
-- 15			-- LD RA, 0
				WHEN "00001111"	=>		opcode		<=		"00010";				-- LD Ri, Constante
												SEL_R			<= 	'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00000000";			-- 0 -> 0
											
-- 16			-- ST[11], RA
				WHEN "00010000"	=>		opcode		<=		"00100";				-- ST[Constante], RA
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00001011";			-- 11 -> 1011
			
-- 17			-- LD RA, 3
				WHEN "00010001"	=>		opcode		<=		"00010";				-- LD Ri, Constante
												SEL_R			<= 	'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00000011";			-- 3 -> 11
			
-- 18			-- ST[5], RA
				WHEN "00010010"	=>		opcode		<=		"00100";				-- ST[Constante], RA
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00000101";			-- 5 -> 101
			
-- 19			-- LD RA, [11]
				WHEN "00010011"	=>		opcode		<=		"00011";				-- LD Ri, [Constante]
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00001011";			-- 11 -> 1011
											
-- 20			-- LD RB, [10]
				WHEN "00010100"	=>		opcode		<=		"00011";				-- LD Ri, [Constante]
												SEL_R 		<=		'1';					-- RB -> SEL_R = '1'
												Constante	<=		"00001010";			-- 10 -> 1010

-- 21			-- ADD RA, RB
				WHEN "00010101" 	=> 	opcode		<=		"00101";				-- ADD RA, RB
												SEL_R			<=		'0';					-- RA e RB na mesma instrução -> SEL_R = 'X'
												Constante	<=		"XXXXXXXX";			-- Não existe Constante

-- 22			-- ST[11], RA
				WHEN "00010110"	=>		opcode		<=		"00100";				-- ST[Constante], RA
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00001011";			-- 11 -> 1011
			
-- 23			-- LD RA, [5]
				WHEN "00010111"	=>		opcode		<=		"00011";				-- LD Ri, [Constante]
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00000101";			-- 5 -> 101

-- 24			-- LD RB, 1
				WHEN "00011000"	=>		opcode		<=		"00010";				-- LD Ri, Constante
												SEL_R			<=		'1';					-- RB -> SEL_R = '1'
												Constante	<=		"00000001";			-- 1 -> 1
											
-- 25			-- SUB RA, RB
				WHEN "00011001"	=>		opcode		<=		"00110";				-- SUB RA, RB
												SEL_R			<=		'0';					-- RA e RB na mesma instrução -> SEL_R = 'X'
												Constante	<=		"XXXXXXXX";			-- Não existe Constante

-- 26			-- JZ RA, 28
				WHEN "00011010"	=>		opcode		<=		"10001";				-- JZ RA, Constante
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"00011100";			-- 28 -> 11100

-- 27			-- JMP 18
				WHEN "00011011"	=>		opcode		<=		"10011";				-- JMP Constante
												SEL_R			<=		'X';					-- Não existe Registos nesta instrução
												Constante 	<=		"00010010";			-- 18 -> 10010

-- 28			-- LD RA, [11]
				WHEN "00011100"	=>		opcode		<=		"00011";				-- LD Ri, [Constante]
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<= 	"00001011";			-- 11 -> 1011

-- 29 		-- STP RA
				WHEN "00011101"	=>		opcode		<=		"00001";				-- STP RA
												SEL_R			<=		'0';					-- RA -> SEL_R = '0'
												Constante	<=		"XXXXXXXX";			-- Não existe Constante
											
-- 30			-- JMP 30
				WHEN "00011110"	=>		opcode		<=		"10011";				-- JMP Constante
												SEL_R			<=		'X';					-- Não existe Registos nesta instrução
												Constante	<=		"00011110";			-- 30 -> 11110

-- NOP		-- OUTROS CASOS															-- NO Operation
				WHEN OTHERS			=>		opcode		<=		"XXXXX";
												SEL_R			<=		'X';
												Constante	<=		"XXXXXXXX";

		END CASE;
		
	END PROCESS;

end Behavioral;

