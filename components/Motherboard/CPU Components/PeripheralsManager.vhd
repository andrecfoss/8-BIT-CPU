----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:05 03/05/2023 
-- Design Name: 
-- Module Name:    PeripheralsManager - Behavioral 
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

entity PeripheralsManager is
    Port ( ESCR_P : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
			  Operando1 : in STD_LOGIC_VECTOR (7 downto 0);
			  Dados_IN : out STD_LOGIC_VECTOR (7 downto 0);
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end PeripheralsManager;

architecture Behavioral of PeripheralsManager is

begin
	process(ESCR_P, PIN, clk, Operando1)
	begin
	
		if ESCR_P = '0' then
			Dados_IN <= PIN;
		end if;
		
		if rising_edge (clk) then
			if ESCR_P = '1' then
				POUT <= Operando1;
			end if;
		end if;
		
	end process;

end Behavioral;

