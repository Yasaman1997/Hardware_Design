library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity InstructionMemory is
	port (address : in std_logic_vector (15 downto 0);
	  IMload : in std_logic;
	  clk : in std_logic;
		instruction : out std_logic_vector (15 downto 0)
		);
end entity;



architecture behavioral of InstructionMemory is
	type mem is array (0 to 512) of std_logic_vector (15 downto 0);
	signal memory : mem;

	begin
	
	    
	
  
memory(0) <= "0111000001000011";  -- lw r1, 0x100
memory(1) <= "0111000010000010";  -- lw r3, 0x102
--memory(3) <= "0000001011010000";  -- add r1, r2, r3
--memory(4) <= "1000000010000100";  -- sw r1, 0x104
memory(2) <= "0000010011100001";  -- sub r4, r2, r3
memory(3) <= "1011001100000001";  -- beq r1, r4, 8


	
  process (clk,IMload)
	  
	  begin
	    

  if ( clk'event and clk = '1') then
    if (IMload = '1') then
	  instruction <= memory(to_integer(unsigned(address(15 downto 0))));
end if;
end if;

end process;
end architecture behavioral;


