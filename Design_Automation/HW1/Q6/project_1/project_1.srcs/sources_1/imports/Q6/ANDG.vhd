library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ANDG is
    port(x,y :in STD_LOGIC;
         z:out STD_LOGIC
     );
end ANDG;



architecture rtl of ANDG is 

 begin
        process(x,y) is
        begin
            z <= x AND y;
        end process;
end rtl;

