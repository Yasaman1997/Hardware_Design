


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity shiftl is
  port(
    b :  in std_logic_vector(15 downto 0);
    ol :out  std_logic_vector(15 downto 0)
  );
  
end entity;

architecture dataflow of shiftl is
begin
  

     
ol <= (b(14 downto 0) & b(0));

end architecture;

