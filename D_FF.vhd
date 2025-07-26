----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:17 07/22/2025 
-- Design Name: 
-- Module Name:    D_FF - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D_FF is
	port
	(
		clk : in std_logic;
		rst : in std_logic;
		en : in std_logic;
		d : in std_logic;
		q : out std_logic
	);
end D_FF;

architecture Behavioral of D_FF is
	signal q_reg : STD_LOGIC;
begin
    process(clk,rst)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                q_reg <= '0';
            elsif en = '1' then
                q_reg <= d;
            end if;
        end if;
    end process;

    q <= q_reg;
end Behavioral;