
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Add is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    cin : in std_logic;
    sum :out  std_logic_vector(15 downto 0);
    cout : out std_logic
  );
  
end entity;

architecture dataflow of Add is
  
  signal s: std_logic_vector(16 downto 0);

begin

   s <=('0' & a) + ('0' & b) + cin;
   
sum <= s(15 downto 0);
cout<= s(16);
end architecture;