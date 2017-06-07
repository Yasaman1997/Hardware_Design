



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bor is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    bo :out  std_logic_vector(15 downto 0)
  );
  
end entity;

architecture dataflow of bor is

begin

  bo <= a or b;

end architecture;


