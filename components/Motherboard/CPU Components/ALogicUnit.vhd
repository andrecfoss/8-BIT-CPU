----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:54 03/05/2023 
-- Design Name: 
-- Module Name:    ALogicUnit - Behavioral 
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

use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALogicUnit is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (2 downto 0);		-- 3-Bits in each operation
           E_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0));
end ALogicUnit;

architecture Behavioral of ALogicUnit is

begin
	process(Operando1,Operando2,SEL_ALU)
		variable vetor: STD_LOGIC_VECTOR (7 downto 0);
		begin
		
		case SEL_ALU is	-- sinal de selecção da ALU que determina os casos de todas as operações executadas na ALU
		
			when "000"	=>	vetor := Operando1 	+ 		Operando2;
			when "001"	=> vetor := Operando1 	- 		Operando2;
			when "010"	=> vetor := Operando1 	AND 	Operando2;
			when "011"	=> vetor := Operando1 	OR 	Operando2;
			when "100"	=> vetor := Operando1 	NOR 	Operando2;
			when "101"	=> vetor := Operando1 	XOR 	Operando2;
			
			WHEN "110"	=> IF (Operando1 < Operando2)
									then
										E_FLAG(0)	<=	'1';
									else
										E_FLAG(0)	<=	'0';
								END IF;
								
								IF (Operando1 <= Operando2)
									then
										E_FLAG(1)	<=	'1';
									else
										E_FLAG(1)	<=	'0';
								END IF;
								
								IF (Operando1 = Operando2)
									then
										E_FLAG(2)	<=	'1';
									else
										E_FLAG(2)	<=	'0';
								END IF;
								
								IF (Operando1 > Operando2)
									then
										E_FLAG(3)	<=	'1';
									else
										E_FLAG(3)	<=	'0';
								END IF;
								
								IF (Operando1 <= Operando2)
									then
										E_FLAG(4)	<=	'1';
									else
										E_FLAG(4)	<=	'0';
								END IF;

			when others	=>	vetor	:=	(others	=>	'0');		-- other cases
		
		end case;
		
		Resultado <= vetor;	-- Atribuição da variável à saída Resultado
		
		

	end process;


end Behavioral;

