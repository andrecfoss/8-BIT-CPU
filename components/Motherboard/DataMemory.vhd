----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:29 03/05/2023 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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

USE IEEE.NUMERIC_STD.ALL;		-- To declare TO_INTEGER

ENTITY DataMemory IS
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
END DataMemory;

ARCHITECTURE Behavioral OF DataMemory IS

BEGIN
	PROCESS(Operando1, WR, clk, Constante)
		
	-- Cria um array de 256 bits 
	TYPE Memory IS ARRAY (0 TO 255) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	Variable AMemory : Memory;
	BEGIN
	
		IF WR = '0' THEN
			Dados_M	<=	AMemory(TO_INTEGER(unsigned(Constante)));
		ELSE
			IF RISING_EDGE(clk) THEN
				AMemory(TO_INTEGER(unsigned(Constante))) := Operando1;
			END IF;
		END IF;
		
	END PROCESS;

END Behavioral;

