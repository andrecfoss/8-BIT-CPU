----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:38 03/05/2023 
-- Design Name: 
-- Module Name:    MultiplexerRegistos - Behavioral 
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

ENTITY MultiplexerRegistos IS
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_Data : in  STD_LOGIC_VECTOR (1 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0));
END MultiplexerRegistos;

ARCHITECTURE Behavioral OF MultiplexerRegistos IS

BEGIN
	PROCESS(Constante, Dados_M, Dados_IN, Resultado, SEL_Data)		-- Inicia o Processo do MUX R
	BEGIN
		
		CASE SEL_Data IS
		
			WHEN 	"00"	=>	Dados_R	<=	Resultado;
			WHEN	"01"	=>	Dados_R	<=	Dados_IN;
			WHEN	"10"	=>	Dados_R	<=	Dados_M;
			WHEN	"11"	=>	Dados_R	<=	Constante;
			
			WHEN OTHERS	=>	Dados_R	<=	"XXXXXXXX";
		
		END CASE;
		
	END PROCESS;

END Behavioral;

