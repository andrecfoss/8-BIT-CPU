----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:51 03/05/2023 
-- Design Name: 
-- Module Name:    ROMDecoder - Behavioral 
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

entity ROMDecoder is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_PC : out  STD_LOGIC_VECTOR (2 downto 0);
           SEL_FLAG : out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_FLAG : out  STD_LOGIC;
           SEL_ALU : out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_R : out  STD_LOGIC;
           SEL_Data : out  STD_LOGIC_VECTOR (1 downto 0);
           ESCR_P : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end ROMDecoder;

architecture Behavioral of ROMDecoder is

BEGIN
	PROCESS (opcode)						
		BEGIN
		CASE opcode IS																																																		-- INSTRUÇÃO --			-- DESCRIÇÃO --
																									
			-- PERIFÉRICOS		
			WHEN "00000" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "01";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- LDP Ri					-- Escreve no registo Ri uma cópia do valor de PIN
			WHEN "00001" => SEL_ALU <= "XXX";  ESCR_P <= '1';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- STP RA					-- Escreve no POUT uma cópia do registo RA
			
			-- LEITURA E ESCRITA
			WHEN "00010" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "11";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- LD Ri, Constante		-- Escreve no registo Ri o valor da Constante
			WHEN "00011" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "10";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- LD Ri, [Constante]	-- Escreve no registo Ri uma cópia da célula da RAM indicada pela Constante
			WHEN "00100" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '1';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- ST[Constante], RA		-- Escreve na célula da RAM indicada pela Constante uma cópia do registo RA
			
			-- LÓGICA E ARITMÉTICA
			WHEN "00101" => SEL_ALU <= "000";  ESCR_P <= '0';  SEL_Data <= "00";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- ADD RA, RB				-- Soma
			WHEN "00110" => SEL_ALU <= "001";  ESCR_P <= '0';  SEL_Data <= "00";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- SUB RA, RB				-- Subtrai 
			WHEN "00111" => SEL_ALU <= "010";  ESCR_P <= '0';  SEL_Data <= "00";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- AND RA, RB				-- Conjugação 
			WHEN "01000" => SEL_ALU <= "011";  ESCR_P <= '0';  SEL_Data <= "00";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- OR RA, RB				-- Disjunção 
			WHEN "01001" => SEL_ALU <= "100";  ESCR_P <= '0';  SEL_Data <= "00";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- NOR RA, RB				-- Negação da Disjunção
			WHEN "01010" => SEL_ALU <= "101";  ESCR_P <= '0';  SEL_Data <= "00";  ESCR_R <= '1';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- XOR RA, RB				-- Disjunção Exlusiva
			WHEN "01011" => SEL_ALU <= "110";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '1';  SEL_FLAG <= "XXX";		-- CMP RA, RB				-- Comparação
			
			-- SALTO
			WHEN "01100" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "000";  ESCR_FLAG <= '0';  SEL_FLAG <= "000";		-- JL Constante			-- (<)  = '1'
			WHEN "01101" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "000";  ESCR_FLAG <= '0';  SEL_FLAG <= "001";		-- JLE Constante			-- (<=) = '1'
			WHEN "01110" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "000";  ESCR_FLAG <= '0';  SEL_FLAG <= "010";		-- JE Constante			-- (=)  = '1'
			WHEN "01111" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "000";  ESCR_FLAG <= '0';  SEL_FLAG <= "011";		-- JG Constante			-- (>)  = '1'
			WHEN "10000" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "000";  ESCR_FLAG <= '0';  SEL_FLAG <= "100";		-- JGE Constante			-- (>=) = '1'
			WHEN "10001" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "001";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- JZ RA, Constante		-- RA   = '0'
			WHEN "10010" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "010";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- JN RA, Constante		-- RA   < '0'
			WHEN "10011" => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "100";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- JMP Constante			
			
			-- OUTROS
			WHEN OTHERS  => SEL_ALU <= "XXX";  ESCR_P <= '0';  SEL_Data <= "XX";  ESCR_R <= '0';  WR <= '0';  SEL_PC <= "011";  ESCR_FLAG <= '0';  SEL_FLAG <= "XXX";		-- NOP						-- Não executa nenhuma operação e apenas incrementa o contador do PC
		
		END CASE;
		
	END PROCESS;
	
END Behavioral;



