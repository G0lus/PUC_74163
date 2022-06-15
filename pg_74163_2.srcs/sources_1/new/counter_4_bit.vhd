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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.ALL;

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


signal s_q      : std_logic_vector(3 downto 0);  
begin

--RCO <= '1' when (s_q = "1111" and EN_T = '1') else '0';
RCO <= '1' when s_q = "0000" else '0';

process(CLK)
begin
    if rising_edge(CLK) then
            if N_CLR = '0' then
                s_q <= "0000";
            
            elsif N_LOAD = '0' then
                s_q <= DATA;
                
            elsif (EN_P = '1') and (EN_T = '1') then            
                s_q <= s_q + 1;
            end if;
            
            Q <= s_q;

    end if;         
end process;


end Behavioral;
