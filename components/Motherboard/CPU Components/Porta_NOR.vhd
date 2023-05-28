----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:09 03/07/2023 
-- Design Name: 
-- Module Name:    Porta_NOR - Behavioral 
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

entity Porta_NOR is
	PORT (	Operando1: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				Output_NOR : out STD_LOGIC);
end Porta_NOR;

architecture Behavioral of Porta_NOR is

begin

	PROCESS (Operando1)
	BEGIN
	
		Output_NOR <= NOT(Operando1(7) OR Operando1(6) OR Operando1(5) OR Operando1(4) OR Operando1(3) OR Operando1(2) OR Operando1(1) OR Operando1(0));
	
	END PROCESS;

end Behavioral;

