----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2022 17:00:35
-- Design Name: 
-- Module Name: pre_flip_flop - Behavioral
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

entity pre_flip_flop is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           J : out STD_LOGIC;
           K : out STD_LOGIC);
end pre_flip_flop;

architecture Behavioral of pre_flip_flop is

begin
J <= not( A and( not( A and C and D))) and (A or B);
K <= not( A and C and D) and (A or B);

--s_j(0) <= (s_load or (EN_P and EN_T)) and not(s_load and not(DATA(0) and N_CLR and s_load))
--s_k(0) <= (s_load or (EN_P and EN_T)) and not(DATA(0) and N_CLR and s_load);
end Behavioral;
