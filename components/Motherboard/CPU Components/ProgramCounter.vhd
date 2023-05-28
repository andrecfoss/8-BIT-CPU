----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:33 03/05/2023 
-- Design Name: 
-- Module Name:    ProgramCounter - Behavioral 
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

use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgramCounter is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
	PROCESS(Constante, ESCR_PC, clk, reset)
	variable conta : STD_LOGIC_VECTOR (7 downto 0);
	begin
	
	if rising_edge (clk) then
		if reset = '0' then
			if ESCR_PC = '0' then
				conta := conta + 1;
			else
				conta := Constante;
			end if;
		else
			conta := "00000000";
		end if;
	end if;
	
	Endereco <= conta;
	end process;

end Behavioral;

