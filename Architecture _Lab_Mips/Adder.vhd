
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Adder is
  port(
    A : in std_logic_vector(7 downto 0);
    B :  in std_logic_vector(7 downto 0);
    S :out  std_logic_vector(8 downto 0)
  );
  
end entity;

architecture dataflow of Adder is

begin
 
 S <= ('0' & A ) + (B); 





end architecture;
