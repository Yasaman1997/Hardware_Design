library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16_4 is
    Port ( SEL : in  STD_LOGIC_vector (1 downto 0);
           A   : in  STD_LOGIC_VECTOR (15 downto 0);
           B   : in  STD_LOGIC_VECTOR (15 downto 0);
           C   : in  STD_LOGIC_VECTOR (15 downto 0);
           X   : out STD_LOGIC_VECTOR (15 downto 0));
end entity;

architecture Behavioral of mux16_4 is
begin
    with SEL select X <=
		A when "00",
		B when "01",
		C when "10",
(others => '0')  when others;
end Behavioral;


