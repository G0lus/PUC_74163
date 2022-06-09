----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 13:10:16
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is
    component counter_4_bit is
        Port ( CLK : in STD_LOGIC;
               N_LOAD : in STD_LOGIC;
               N_CLR : in STD_LOGIC;
               DATA : in STD_LOGIC_VECTOR (3 downto 0);
               EN_P : in STD_LOGIC;
               EN_T : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   
    signal s_clk     : std_logic                     := '1';
    signal s_data    : std_logic_vector(3 downto 0)  := (others => '0');
    signal s_q       : std_logic_vector(3 downto 0)  := (others => '0');
    signal s_nload   : std_logic                     := '0';
    signal s_nclr    : std_logic                     := '0';
    signal s_enp     : std_logic                     := '0';
    signal s_ent     : std_logic                     := '0';
    
begin
uut: counter_4_bit port map(
    CLK     => s_clk,
    N_LOAD  => s_nload,
    N_CLR   => s_nclr,
    DATA    => s_data,
    EN_P    => s_enp,
    EN_T    => s_ent,
    Q       => s_q
);


clock: process
begin
    wait for 5 ns;
    s_clk <= '0';
    wait for 5 ns;
    s_clk <= '1';
end process;



s_data <= "0000", "0001" after 20ns, "0010" after 40ns, "0100" after 60ns, "1000" after 80ns;

s_nclr <= '0', '1' after 40ns, '0' after 160ns;
s_nload <= '1', '0' after 80 ns;
end Behavioral;
