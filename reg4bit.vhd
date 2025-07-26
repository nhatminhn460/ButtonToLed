----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:11 07/22/2025 
-- Design Name: 
-- Module Name:    reg4bit - Behavioral 
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

entity reg4bit is
    Port (
        clk  : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        en   : in  STD_LOGIC;
        d    : in  STD_LOGIC_VECTOR(3 downto 0);
        q    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end reg4bit;

architecture Structural of reg4bit is
    component D_FF
        Port (
            clk  : in  STD_LOGIC;
            rst  : in  STD_LOGIC;
            en   : in  STD_LOGIC;
            d    : in  STD_LOGIC;
            q    : out STD_LOGIC
        );
    end component;
begin
    D0: D_FF port map(clk, rst, en, d(0), q(0));
    D1: D_FF port map(clk, rst, en, d(1), q(1));
    D2: D_FF port map(clk, rst, en, d(2), q(2));
    D3: D_FF port map(clk, rst, en, d(3), q(3));
end Structural;
