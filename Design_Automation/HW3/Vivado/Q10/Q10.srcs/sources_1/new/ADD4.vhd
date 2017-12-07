library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity ADD4 is
port ( a : in std_logic_vector(3 downto 0);
       b : in std_logic_vector(3 downto 0);
       sum : out std_logic_vector(4 downto 0)
);


end  ADD4;


architecture test of ADD4 is
begin
sum <= ('0'& a) + ('0' & b);
end test;
