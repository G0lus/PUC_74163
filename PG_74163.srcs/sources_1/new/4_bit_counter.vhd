----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 12:47:33
-- Design Name: 
-- Module Name: 4_bit_counter - Behavioral
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

entity counter_4_bit is
    Port ( CLK : in STD_LOGIC;
           N_LOAD   : in STD_LOGIC;
           N_CLR    : in STD_LOGIC;
           DATA     : in STD_LOGIC_VECTOR (3 downto 0);
           EN_P     : in STD_LOGIC;
           EN_T     : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR (3 downto 0);
           RCO      : out STD_LOGIC
           );
end counter_4_bit;

architecture Behavioral of counter_4_bit is
component flip_flop is
    Port ( J        : in STD_LOGIC;
           K        : in STD_LOGIC;
           Q        : out STD_LOGIC;
           CLK      : in STD_LOGIC);
end component;

signal s_q      : std_logic_vector(3 downto 0);
signal s_j      : std_logic_vector(3 downto 0);
signal s_k      : std_logic_vector(3 downto 0);

signal s_clk    : std_logic;
signal s_load   : std_logic;
signal s_clr    : std_logic;
signal s_ent    : std_logic;

begin

ffA: flip_flop port map (J => s_j(0), K => s_k(0), Q => s_q(0), CLK => s_clk);
ffB: flip_flop port map (J => s_j(1), K => s_k(1), Q => s_q(1), CLK => s_clk);
ffC: flip_flop port map (J => s_j(2), K => s_k(2), Q => s_q(2), CLK => s_clk);
ffD: flip_flop port map (J => s_j(3), K => s_k(3), Q => s_q(3), CLK => s_clk);

--preflipflop map

-- load and clear signals
s_load <= not(N_LOAD) or not(N_CLR);
RCO <= s_q(0) and s_q(1) and s_q(2) and s_q(3) and EN_T;




end Behavioral;
