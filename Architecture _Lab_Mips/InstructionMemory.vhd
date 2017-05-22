library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity InstructionMemory is
	port (address : in std_logic_vector (15 downto 0);
		instruction : out std_logic_vector (15 downto 0)
		);
end entity;



architecture behavioral of InstructionMemory is
	type mem is array (255 downto 0) of std_logic_vector (15 downto 0);
	signal memory : mem;
	
	begin
	  
	  instruction <= memory(to_integer(unsigned(address(15 downto 0))));



end architecture behavioral;


