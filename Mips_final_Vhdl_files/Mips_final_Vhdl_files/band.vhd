


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity band is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    ba :out  std_logic_vector(15 downto 0)
  );
  
end entity;

architecture dataflow of band is

begin

  ba <= a and b;

end architecture;

