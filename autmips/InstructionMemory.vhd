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
	  
	
	  
memory(0) <= "0111111010000000";  -- lw r2, 0x100
memory(1) <= "0111111011000010";  -- lw r3, 0x102
memory(2) <= "0001010011001010";  -- add r1, r2, r3
memory(3) <= "1111111001000100";  -- sw r1, 0x104
memory(4) <= "0000010011100110";  -- sub r4, r2, r3
memory(5) <= "0100001100000001";  -- beq r1, r4, 8
memory(6) <= "0000001100001110";  -- sub r1, r1, r4

	  
	  instruction <= memory(to_integer(unsigned(address(15 downto 0))));




end architecture behavioral;


