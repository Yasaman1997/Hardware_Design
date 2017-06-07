

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity slt is
  port(
    a :  in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    st : out std_logic
  );
  
end entity;

architecture dataflow of slt is

begin

  
  process(a,b)
    begin
      
      if(a<b) then
      st <= '1';
    else st <= '0';
      
    end if;
    
  end process;
      

end architecture;


