library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity A is
  Port ( a:in std_logic;
         b: in std_logic;
         c: in std_logic;
         d: in std_logic);
end A;



architecture bhv of A is
 
signal x,w : std_logic;
signal y,z : std_ulogic;

 begin

process (x, y)
begin
z<='0';
y<='0';
if (x>w) then
y<=x;
else
x<='1';
z<=y or x;
end if;
x<='0';
y<='1';
end process;

end bhv;
