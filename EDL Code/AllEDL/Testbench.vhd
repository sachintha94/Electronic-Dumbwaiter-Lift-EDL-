--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:46 12/21/2022
-- Design Name:   
-- Module Name:   C:/Users/Sachintha/Desktop/OUSL/2022/EEX5351 Digital Electronic Sys/LAB/Lab 02/Code/AllEDL/Testbench.vhd
-- Project Name:  AllEDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ELD_TEST
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Testbench IS
END Testbench;
 
ARCHITECTURE behavior OF Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ELD_TEST
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         LS0 : IN  std_logic;
         LS1 : IN  std_logic;
         LS2 : IN  std_logic;
         RET : IN  std_logic;
         M : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal LS0 : std_logic := '0';
   signal LS1 : std_logic := '0';
   signal LS2 : std_logic := '0';
   signal RET : std_logic := '0';

 	--Outputs
   signal M : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ELD_TEST PORT MAP (
          clk => clk,
          reset => reset,
          BTN1 => BTN1,
          BTN2 => BTN2,
          LS0 => LS0,
          LS1 => LS1,
          LS2 => LS2,
          RET => RET,
          M => M
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
      -- hold reset state for 100 ns.
		 BTN1 <= '1', LS0 <= '1';
       wait for clk_period;
		 
		 BTN1 <= '1', LS1 <= '1';
       wait for clk_period;
		 
		 RET <= '1', LS1 <= '1';
       wait for clk_period;
		 
		 RET <= '1', LS0 <= '1';
       wait for clk_period;
		 
		 BTN2 <= 1,LS0 <= 1;
       wait for clk_period;
		 
		 BTN2 <= '1', LS2 <= '1';
       wait for clk_period;
		 
		 RET <= '1', LS2 <= '1';
       wait for clk_period;
		 
		 RET <= '1', LS0 <= '1';
       wait for clk_period;

      -- insert stimulus here 

      wait;
   end process;

END;
