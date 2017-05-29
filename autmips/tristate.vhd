




library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity tristate is
  port(
    a : in std_logic_vector(15 downto 0);
    y :  out std_logic_vector(15 downto 0);
    en : in std_logic
    
  );
  
end entity;

architecture dataflow of tristate is

begin
  
  with en select
  y <= a when '1',
"ZZZZZZZZZZZZZZZZ"  when others;
 
  
end architecture;

