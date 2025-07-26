----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:48 07/22/2025 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port (
        clk       : in  STD_LOGIC;
        rst       : in  STD_LOGIC;
        btn_inc   : in  STD_LOGIC;
        btn_show  : in  STD_LOGIC;
        seg       : out STD_LOGIC_VECTOR(6 downto 0)
    );
end main;

architecture Behavioral of main is
    component reg4bit
        Port (
            clk  : in  STD_LOGIC;
            rst  : in  STD_LOGIC;
            en   : in  STD_LOGIC;
            d    : in  STD_LOGIC_VECTOR(3 downto 0);
            q    : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal reg_q       : STD_LOGIC_VECTOR(3 downto 0);
    signal reg_next    : STD_LOGIC_VECTOR(3 downto 0);
    signal disp_val    : STD_LOGIC_VECTOR(3 downto 0) := "0000";

    signal btn_inc_prev  : STD_LOGIC := '0';
    signal btn_show_prev : STD_LOGIC := '0';
    signal en_write      : STD_LOGIC := '0';

begin

    -- Tim xung len khi nhan nut tang
    process(clk)
    begin
        if rising_edge(clk) then
            btn_inc_prev  <= btn_inc;
            btn_show_prev <= btn_show;

            -- tang neu nhan nut btn_inc
            if btn_inc = '1' and btn_inc_prev = '0' then
					if reg_q = "1001" then
						reg_next <= "0000";  -- quay ve 0
					else
						reg_next <= reg_q + 1;
					end if;
               en_write <= '1';
            else
                reg_next <= reg_q;
                en_write <= '0';
            end if;

            -- Ghi gia tri ra Led
            if btn_show = '1' and btn_show_prev = '0' then
                disp_val <= reg_q;
            end if;
        end if;
    end process;

    U_reg: reg4bit port map (
        clk => clk,
        rst => rst,
        en  => en_write,
        d   => reg_next,
        q   => reg_q
    );

    -- Giai ma led
    process(disp_val)
    begin
        case disp_val is
            when "0000" => seg <= "0111111"; -- 0
            when "0001" => seg <= "0000110"; -- 1
            when "0010" => seg <= "1011011"; -- 2
            when "0011" => seg <= "1001111"; -- 3
            when "0100" => seg <= "1100110"; -- 4
            when "0101" => seg <= "1101101"; -- 5
            when "0110" => seg <= "1111101"; -- 6
            when "0111" => seg <= "0000111"; -- 7
            when "1000" => seg <= "1111111"; -- 8
            when "1001" => seg <= "1101111"; -- 9
            when others => seg <= "0000000"; -- tat led
        end case;
    end process;
end Behavioral;

