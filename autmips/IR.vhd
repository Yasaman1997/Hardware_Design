library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InstructionRegister is
  port(
    IR_in : in std_logic_vector(15 downto 0);
    IRload : in std_logic;
    clk: in std_logic;
    IR_out :out  std_logic_vector(15 downto 0)
  );
  
end entity;

architecture dataflow of InstructionRegister is

begin
  process(clk)
    begin
      if(clk'event and clk ='1') then
      if (IRload = '1') then
        IR_out <= IR_in;
      end if;
    end if;
    end process;
    
  
end dataflow; 
