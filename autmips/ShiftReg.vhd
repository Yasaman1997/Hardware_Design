
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

  entity ShiftRegister is
  port(
    Di : in std_logic_vector(7 downto 0);
    Do : out std_logic_vector (7 downto 0);
    clk: in std_logic;
    Load: in std_logic;
    Shift :in  std_logic;
    clr : in std_logic;
    Si : in std_logic
    
  );
  
end entity;

architecture dataflow of ShiftRegister is
  
  signal Din : std_logic_vector (7 downto 0);

begin
  process(clk)
    begin
  if(clk'event and clk = '1') then
      if(clr ='1') then
        Din <= (others => '0');
      else if (Load ='1') then
          Din <= Di;
    else if (Shift ='1') then
      Din <= Si & Din(7 downto 1);
      
    end if;
  end if;
  end if;
  end if;
  
end process;
Do <= din;
end architecture;

