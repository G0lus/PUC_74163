----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 12:17:44
-- Design Name: 
-- Module Name: flip_flop_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flip_flop_tb is
end flip_flop_tb;

architecture Behavioral of flip_flop_tb is

component flip_flop is
    port(
           J        : in STD_LOGIC;
           K        : in STD_LOGIC;
           Q        : out STD_LOGIC;
           CLK      : in STD_LOGIC);
           
end component;
signal s_j      : std_logic := '1';
signal s_k      : std_logic := '0';
signal s_clk    : std_logic := '0';
signal s_q      : std_logic := '0';

begin
uut: flip_flop port map(
    J       => s_j,
    K       => s_k,
    Q       => s_q,
    CLK     => s_clk
);

clock: process
begin
    s_clk <= '0';
    wait for 5 ns;
    s_clk <= '1';
    wait for 5 ns;
end process;

-- simulation 
simulation: process
begin
    s_j <= '0';
    s_k <= '0';
    wait for 15 ns;
    s_j <= '0';
    s_k <= '1';
    wait for 15 ns;
    s_j <= '1';
    s_k <= '0';
    wait for 15 ns;
    s_j <= '1';
    s_k <= '1';
    wait for 15 ns;
end process;

end Behavioral;
