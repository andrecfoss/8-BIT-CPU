----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:40 03/05/2023 
-- Design Name: 
-- Module Name:    RegistoA - Behavioral 
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

entity RegistoA is
    Port ( ESCR_R : in  STD_LOGIC;
           Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0));
end RegistoA;

architecture Behavioral of RegistoA is

BEGIN
	PROCESS(ESCR_R, Dados_R, SEL_R, clk)
	Variable registo1 : STD_LOGIC_VECTOR (7 downto 0);
	BEGIN
		IF ESCR_R = '0' THEN
		 --Operando1 <= registo1;
		ELSE 
			IF RISING_EDGE (clk) THEN
				IF SEL_R = '0' THEN
					registo1 := Dados_R;
				END IF;
			END IF;
		END IF;
	Operando1 <= registo1;	
	END PROCESS;

END Behavioral;

