----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:06:18 03/05/2023 
-- Design Name: 
-- Module Name:    MUXProgramCounter - Behavioral 
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

entity MUXProgramCounter is
    Port ( SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
           S_FLAG : in  STD_LOGIC;
			  Output_NOR : IN STD_LOGIC;
			  Operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : out  STD_LOGIC);
end MUXProgramCounter;

architecture Behavioral of MUXProgramCounter is

begin
	process(SEL_PC, S_FLAG, Operando1)
	begin
		
		case SEL_PC is		-- determina os casos através do sinal de seleção do PC
			
			when "000"	=>	ESCR_PC	<=	S_FLAG;
	--		when "001"	=>	ESCR_PC	<=	NOT(Operando1(7) OR Operando1(6) OR Operando1(5) OR Operando1(4) OR Operando1(3) OR Operando1(2) OR Operando1(1) OR Operando1(0));
			WHEN "001"	=>	ESCR_PC	<= Output_NOR;
			when "010"	=>	ESCR_PC	<=	Operando1(7);
			when "011"	=>	ESCR_PC	<=	'0';
			when "100"	=>	ESCR_PC	<=	'1';
			
			when others =>	ESCR_PC	<=	'X';
	
		end case;
		
	end process;

end Behavioral;

