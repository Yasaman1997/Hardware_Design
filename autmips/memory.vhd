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
signal ram: ram_type;


begin

process (clk,MemRead)
  begin
      if (rising_edge(clk)) then
			
         if (MemWrite='1') then
			   ram(to_integer (unsigned(addr(15 downto 0)))) <= din;
          end if ;    			
       end if ;
       
       if (MemRead = '1') then
         
         dout <= ram(to_integer(unsigned(addr(15 downto 0))));
         
       end if;
         
         
end process ;

 

end beh_arch ;


