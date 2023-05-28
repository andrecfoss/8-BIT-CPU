--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:04:07 03/05/2023
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/CPU_SAMPLE/Motherboard_TESTE.vhd
-- Project Name:  CPU_SAMPLE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Motherboard
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Motherboard_TESTE IS
END Motherboard_TESTE;
 
ARCHITECTURE behavior OF Motherboard_TESTE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Motherboard
    PORT(
         clk : IN  std_logic;
         PIN : IN  std_logic_vector(7 downto 0);
			
         reset : IN  std_logic;
         POUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal POUT : std_logic_vector(7 downto 0);
	
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Motherboard PORT MAP (
          clk => clk,
          PIN => PIN,
			 
          reset => reset,
          POUT => POUT
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		

		reset	<=	'1';
		WAIT FOR clk_period;
		reset <= '0'; 
		WAIT FOR clk_period;
		PIN <=	"00010011";
		wait for clk_period * 15;
		

      -- insert stimulus here 

      wait;
   end process;

END;
