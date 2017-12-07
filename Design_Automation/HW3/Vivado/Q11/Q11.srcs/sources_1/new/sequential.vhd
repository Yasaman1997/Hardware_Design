

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity heater is

Port ( a:in std_logic; --desired temerature
	  b:in std_logic; --environment temperature
	  c:out boolean);
end heater;

architecture bhv of heater is
begin
  process(a,b)
  begin
  
if(b - a ='5') then
c<=false;
  elsif(a-b ='5') then
  c<=true;
  
   
  end if;
  
end process;
  
end bhv;
