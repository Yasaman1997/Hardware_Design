library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity frequency is
 Port (a:in std_logic;
      enable: in std_logic;
      reset:in std_logic;
      x:out std_logic);
end frequency;

architecture Behavioral of frequency is
 begin
process
  begin
  if(reset='1') then
   x<='0';
end if;
if(enable='0') then
x<='0';
wait for 40 ns;
x<='1';

wait for 60 ns;

end if;

if(enable='1') then
x<='0';
wait for 70 ns;
x<='1';
wait for 30 ns;

end if;

end process;
end Behavioral;
