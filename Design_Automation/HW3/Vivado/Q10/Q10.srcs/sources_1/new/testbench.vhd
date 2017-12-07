library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity test is
(x:in std_logic;
);
end test;





architecture bhv of test is
  
  component ADD4 is
      port ( a : in std_logic_vector(3 downto 0);
             b : in std_logic_vector(3 downto 0);
             sum : out std_logic_vector(4 downto 0)
);


end component;
begin
process(a,b)
begin
assert(not(sum='0'&a + '0'&b))
report "wrong sum answer"
severity warning;
end process;
end bhv;
