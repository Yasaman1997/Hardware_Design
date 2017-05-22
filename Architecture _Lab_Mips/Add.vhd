library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Adder1 is
    Port ( num1 : in  STD_LOGIC_VECTOR (15 downto 0);
           num2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  result : OUT STD_LOGIC_VECTOR (15 downto 0));
			  			  
end Adder1;



architecture Behavioral of Adder1 is	
	
begin

	result <= STD_LOGIC_VECTOR( unsigned(num1) + unsigned(num2) );

end Behavioral;


