library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sign_Extend is
    Port ( Input : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end Sign_Extend;

architecture Behavioral of Sign_Extend is

begin
	
	Output <= std_logic_vector(resize(signed(Input), Output'length));

end Behavioral;




