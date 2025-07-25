--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:12 07/22/2025
-- Design Name:   
-- Module Name:   D:/Importants/FPGA_study/ButtonToLed/main_tb.vhd
-- Project Name:  ButtonToLed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY main_tb IS
END main_tb;
 
ARCHITECTURE behavior OF main_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn_inc : IN  std_logic;
         btn_show : IN  std_logic;
         seg : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn_inc : std_logic := '0';
   signal btn_show : std_logic := '0';

 	--Outputs
   signal seg : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
          rst => rst,
          btn_inc => btn_inc,
          btn_show => btn_show,
          seg => seg
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
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

		-- Initial reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        -- Nhan nut 4 lan
        wait for 50 ns;
        btn_inc <= '1';
        wait for 20 ns;
        btn_inc <= '0';

        wait for 50 ns;
        btn_inc <= '1';
        wait for 20 ns;
        btn_inc <= '0';

        wait for 50 ns;
        btn_inc <= '1';
        wait for 20 ns;
        btn_inc <= '0';
		  
		  wait for 50 ns;
        btn_inc <= '1';
        wait for 20 ns;
        btn_inc <= '0';

        -- Nhan nut hien thi
        wait for 50 ns;
        btn_show <= '1';
        wait for 20 ns;
        btn_show <= '0';

        wait for 100 ns;

        wait;
   end process;
END;
