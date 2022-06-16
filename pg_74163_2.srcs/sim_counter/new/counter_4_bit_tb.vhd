library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_4_bit_tb is
end counter_4_bit_tb;

architecture Behavioral of counter_4_bit_tb is
component counter_4_bit is

    Port ( N_LOAD : in STD_LOGIC;
           N_CLR : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (3 downto 0);
           EN_P : in STD_LOGIC;
           EN_T : in STD_LOGIC;
           Q : out std_logic_vector(3 downto 0);
           CLK : in std_logic;
           RCO : out STD_LOGIC);
end component;

signal s_nload, s_nclr, s_enp, s_ent, s_clk, s_rco : std_logic;
signal s_data, s_q : std_logic_vector(3 downto 0);

begin

uut : counter_4_bit port map(N_LOAD => s_nload, N_CLR => s_nclr, DATA => s_data, EN_P => s_enp, EN_T => s_ent, Q => s_q, CLK => s_clk, RCO => s_rco);

clock_proc: process
begin
    s_clk <= '0';
    wait for 5 ns;
    s_clk <= '1';
    wait for 5 ns;
end process;
s_data <= "1100";

s_nload <= '1', '0' after 10ns, '1' after 40ns;
s_nclr <= '1', '0' after 160 ns, '1' after 190 ns;
s_enp <= '0', '1' after 50ns, '0' after 220ns;
s_ent <= '0', '1' after 70ns, '0' after 260ns;


end Behavioral;
