library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (2 downto 0);
           B   : in  STD_LOGIC_VECTOR (2 downto 0);
           X   : out STD_LOGIC_VECTOR (2 downto 0));
end entity;

architecture Behavioral of mux_2 is
begin
    X <= A when (SEL = '1') else B;
end Behavioral;
