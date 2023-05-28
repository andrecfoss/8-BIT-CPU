----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:40 03/05/2023 
-- Design Name: 
-- Module Name:    RegistoB - Behavioral 
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

ENTITY RegistoB IS
    Port ( ESCR_R : in  STD_LOGIC;
           Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0));
END RegistoB;

ARCHITECTURE Behavioral OF RegistoB IS

BEGIN

	PROCESS(ESCR_R, Dados_R, SEL_R, clk)
	Variable registo2 : STD_LOGIC_VECTOR (7 downto 0);
	BEGIN
		IF ESCR_R = '0' THEN
		 --Operando2 <= registo2;
		ELSE 
			IF RISING_EDGE (clk) THEN
				IF SEL_R = '1' THEN
					registo2 := Dados_R;
				END IF;
			END IF;
		END IF;
	Operando2 <= registo2;	
	END PROCESS;


END Behavioral;

