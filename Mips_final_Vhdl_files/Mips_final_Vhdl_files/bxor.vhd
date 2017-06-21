

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bxor is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    bx :out  std_logic_vector(15 downto 0)
  );
  
end entity;

architecture dataflow of bxor is


begin

  bx <= a xor b;

end architecture;
