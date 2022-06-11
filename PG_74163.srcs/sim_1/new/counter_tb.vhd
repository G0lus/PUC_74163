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
        Port (  CLK     : in STD_LOGIC;
                N_LOAD  : in STD_LOGIC;
                N_CLR   : in STD_LOGIC;
                DATA    : in STD_LOGIC_VECTOR (3 downto 0);
                EN_P    : in STD_LOGIC;
                EN_T    : in STD_LOGIC;
                Q       : out STD_LOGIC_VECTOR (3 downto 0);
                RCO     : out STD_LOGIC         
         );
   end component;
   
    signal s_clk    : std_logic                     := '0';
    signal s_data   : std_logic_vector(3 downto 0)  := "1100";
    signal s_q      : std_logic_vector(3 downto 0);
    signal s_nload  : std_logic                     := '1';
    signal s_nclr   : std_logic                     := '1';
    signal s_enp    : std_logic                     := '0';
    signal s_ent    : std_logic                     := '0';
    signal s_rco    : std_logic                     := '0';
    
begin
uut: counter_4_bit port map(
    CLK => s_clk, N_LOAD => s_nload, N_CLR => s_nclr, DATA => s_data,
    EN_P => s_enp, EN_T => s_ent, Q => s_q, RCO => s_rco
);


clock: process
begin
    wait for 5 ns;
    s_clk <= '1';
    wait for 5 ns;
    s_clk <= '0';
end process;

s_nclr <= '0' after 20ns, '1' after 40ns, '0' after 300ns, '1' after 320ns;
s_nload <= '0' after 40ns, '1' after 60ns, '0' after 200ns, '1' after 220ns;
s_enp <= '1' after 60ns, '0' after 120ns, '1' after 160ns, '0' after 250ns, '1' after 270 ns;
s_ent <= '1' after 60ns, '0' after 160ns, '1' after 220ns, '0' after 270ns, '1' after 290 ns;

s_data <= "0000" after 200ns;

end Behavioral;
