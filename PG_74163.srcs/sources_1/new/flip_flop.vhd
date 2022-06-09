----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 12:02:08
-- Design Name: 
-- Module Name: flip_flop - Behavioral
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

entity flip_flop is
    Port ( J        : in STD_LOGIC;
           K        : in STD_LOGIC;
           Q        : out STD_LOGIC;
--           N_Q      : out STD_LOGIC;  -- not used
           CLK      : in STD_LOGIC);
end flip_flop;

architecture Behavioral of flip_flop is
signal s_q  : std_logic;
--signal s_nq : std_logic;
begin

process(CLK)
begin
    if rising_edge(CLK) then
        if J = '0' and K = '0' then
            s_q     <= s_q;  -- Change nothing
        elsif J = '0' and K = '1' then
            s_q     <= '0';
--            s_nq    <= '1';
        elsif J = '1' and K = '0' then
            s_q     <= '1';
--            s_nq    <= '0';
        elsif J = '1' and K = '1' then
            s_q     <= not s_q;
--            s_nq    <= not s_nq;
        end if;
    end if;  
end process;

Q       <= s_q;
--N_Q     <= s_nq;

end Behavioral;
