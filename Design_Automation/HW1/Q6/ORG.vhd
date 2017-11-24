library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ORG is
    port(m,n,p :in STD_LOGIC;
         l:out STD_LOGIC
     );
end ORG;



architecture rtl of ORG is 

 begin
        process(m,n) is
        begin
            l <= (m OR n OR p);
        end process;
end rtl;


