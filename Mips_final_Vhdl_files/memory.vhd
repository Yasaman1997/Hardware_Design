library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity  DataMemory is


port (
			clk : in std_logic;
			MemWrite: in std_logic;
			MemRead: in std_logic;
			addr : in std_logic_vector (15 downto 0) ;
			dout : out std_logic_vector (15 downto 0);
			din: in std_logic_vector (15 downto 0 ) 
     );
end  entity;

architecture beh_arch of  DataMemory is

type ram_type is array (512 downto 0 ) of std_logic_vector (15 downto 0 );
signal ram: ram_type := (0 => x"0100",2 => x"0102", others => x"0000");


begin

process (clk,MemRead)
  begin
   if  clk'event and clk = '1' then
			if MemRead = '1' then -- Reading 
				dout <= ram(to_integer(unsigned(addr)));
			elsif MemWrite = '1' then -- Writing
				ram(to_integer(unsigned(addr))) <= din;
			end if;
end if;
         
         
end process ;

 

end beh_arch ;


