
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity heater is

Port ( a:in std_logic; --desired temerature
	     b:in std_logic; --environment temperature
	     c:out boolean);
end heater;

architecture bhv of heater is

 
  begin
  
if(b - a ='5')
c<=false;
  elsif(a - b ='5')
  c<=true;
 
   
  end if;
  

  
end bhv;
