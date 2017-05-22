
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity Multiply is
  port(
    Multiplier : in std_logic_vector(7 downto 0);
    Multiplicand : in std_logic_vector(7 downto 0);
    Product : out std_logic_vector(15 downto 0);
    start : in std_logic;
    clk : in std_logic;
    Done : out std_logic
  );
  
end entity;

architecture dataflow of Multiply is
  
  
  component ShiftRegister is
  port(
    Di : in std_logic_vector(7 downto 0);
    Do : out std_logic_vector (7 downto 0);
    clk: in std_logic;
    Load: in std_logic;
    Shift :in  std_logic;
    clr : in std_logic;
    Si : in std_logic
    
  );
  
end component;

component Adder is
  port(
    A : in std_logic_vector(7 downto 0);
    B :  in std_logic_vector(7 downto 0);
    S :out  std_logic_vector(8 downto 0)
  );
  
end component;


component ControlM is
  port(
    clk : in std_logic;
    Q0 : in std_logic;
    start : in std_logic;
    load : out std_logic;
    shift : out std_logic;
    AddA : out std_logic;
    Done : out std_logic
    
    
  );
  
end component;

  component ShiftRegister9 is
  port(
    Di : in std_logic_vector(8 downto 0);
    Do : out std_logic_vector (8 downto 0);
    clk: in std_logic;
    Load: in std_logic;
    Shift :in  std_logic;
    clr : in std_logic;
    Si : in std_logic
    
  );
  
end component;

signal Mout,Qout : std_logic_vector(7 downto 0);
signal Dout,Aout : std_logic_vector (8 downto 0);
signal Load,Shift,AddA : std_logic;

begin



  
  
  C : ControlM port map (clk,Qout(0),start,Load,Shift,AddA,Done);
    
  A : Adder port map (Aout(7 downto 0),Mout,Dout);
    
  M : ShiftRegister port map  (Multiplicand,Mout,clk,Load,'0','0','0');
  
  Q : ShiftRegister port map  (Multiplier,Qout,clk,Load,Shift,'0',Aout(0));
    
  AC : ShiftRegister9 port map  (Dout,Aout,clk,AddA,Shift,Load,'0');
    
    Product <= Aout (7 downto 0)  &  Qout; 
    
   
    

end architecture;
