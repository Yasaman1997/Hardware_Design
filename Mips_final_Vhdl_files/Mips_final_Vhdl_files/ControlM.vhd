
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ControlM is
  port(
    clk : in std_logic;
    Q0 : in std_logic;
    start : in std_logic;
    load : out std_logic;
    shift : out std_logic;
    AddA : out std_logic;
    Done : out std_logic
    
    
  );
  
end entity;

architecture dataflow of ControlM is
  
  type states is (halts,inits,qtmp,adds,shifts );
    
    signal state : states := halts;
    signal count : unsigned (2 downto 0);
  
begin

process(state)
  begin
  
if (state = halts) then
  Done <= '1';
else Done <= '0';
  
end if;

  if (state = inits) then
  load <= '1';
else load <= '0';
  
end if;
  
  if (state = adds) then
  AddA <= '1';
else AddA <= '0';
end if;

if (state = shifts) then
  shift <= '1';
else shift <= '0';
  
end if;
end process;


 Process  (clk)

begin 
  
if clk'event and clk ='1'  then
  
  case state is
    
      when halts =>  if start ='1' then
                          state <= inits;
                        end if;
      
    when inits => state <= qtmp;
      
    when  qtmp =>  if(Q0 ='1') then 
                        state <= adds;
                      else 
                        state <= shifts;
                      end if;
                        
     when  adds =>  state <= shifts;
       
    when    shifts =>  if(count = 7 ) then 
                        state <= halts;
                      else 
                        state <= qtmp;
                      end if;
    
      end case;
    end if;
  end process;
  
 process (clk) 

begin

   if (clk'event and clk ='1') then 
        if(state = inits) then
                count <= to_unsigned(0,3);
      else if (state = shifts)  then
            count <= count +1;
            
          end if;
        end if;
      end if;
      end process;  
 
 


end architecture;

