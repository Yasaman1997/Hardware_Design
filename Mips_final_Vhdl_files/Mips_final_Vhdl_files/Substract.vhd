

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Substract is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    cin : in std_logic;
    sub :out  std_logic_vector(15 downto 0);
    bo : out std_logic
  );
  
end entity;

architecture dataflow of Substract is

signal s: std_logic_vector(16 downto 0);

begin

   s <=('0' & a) - ('0' & b) - cin;
   
sub <= s(15 downto 0);
bo<= s(16);
  
end architecture;