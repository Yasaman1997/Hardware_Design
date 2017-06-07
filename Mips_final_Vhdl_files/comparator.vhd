library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;




entity Compare is
  
  
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    lt : out std_logic;
    gt : out std_logic;
    lteq : out std_logic;
    gteq : out std_logic
   
  );
  
end entity;



architecture dataflow of Compare is

begin
  
process(a,b) 
  begin
    
    if(a<b) then   
    lt <= '1';
    
 elsif(a<=b) then   
    lteq <= '1';
    
 elsif(a>b) then   
    gt <= '1';
    
    elsif(a<=b) then   
    gteq <= '1';
    
  end if;
    
    
  end process;
 
  
end architecture;
