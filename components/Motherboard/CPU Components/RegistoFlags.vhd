----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:40 03/05/2023 
-- Design Name: 
-- Module Name:    RegistoFlags - Behavioral 
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

entity RegistoFlags is
    Port ( E_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           ESCR_FLAG : in  STD_LOGIC;
           SEL_FLAG : in  STD_LOGIC_VECTOR (2 downto 0);
           S_FLAG : out  STD_LOGIC);
end RegistoFlags;

architecture Behavioral of RegistoFlags is

begin
	process(E_FLAG, clk, ESCR_FLAG, SEL_FLAG)
	Variable VAR_E_FLAG : STD_LOGIC_VECTOR(4 DOWNTO 0);
	BEGIN
	
	IF RISING_EDGE(CLK) THEN			-- Transição Ascendente do Ciclo de Relógio
		IF ESCR_FLAG = '1' THEN			-- Se a Flag de Escrita estiver ativa 
		
			VAR_E_FLAG := E_FLAG;		-- Atribuímos uma variável à FLAG
		
		END IF;
	
	END IF;
		
		CASE SEL_FLAG IS					-- FLAG de Seleção que determina cada caso
			
			WHEN "000"  => S_FLAG <= VAR_E_FLAG(0);		-- Operação (< )
			WHEN "001"  => S_FLAG <= VAR_E_FLAG(1);		-- Operação (<=)
			WHEN "010"  => S_FLAG <= VAR_E_FLAG(2);		-- Operação (= )
			WHEN "011"  => S_FLAG <= VAR_E_FLAG(3);		-- Operação (> )
			WHEN "100"  => S_FLAG <= VAR_E_FLAG(4);		-- Operação (>=)
			WHEN OTHERS => S_FLAG <= 'X';						-- Restantes Casos ..
		
		END CASE;
	
	END PROCESS;

END Behavioral;
