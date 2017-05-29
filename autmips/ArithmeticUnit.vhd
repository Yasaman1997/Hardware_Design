

library ieee;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity ArithmeticUnit is
  port (
    A:in std_logic_vector(15 downto 0);
    B:in std_logic_vector(15 downto 0);
    clk :  in std_logic;
    cin:in std_logic;
    func : in std_logic_vector(0 to 2);
    OP : in std_logic_vector (3 downto 0);
    AluO : out std_logic_vector(15 downto 0);
    st : out std_logic;
    zout : out std_logic;
    cout : out std_logic
   
  );
end entity;


  
architecture dataflow of ArithmeticUnit is
  
 

  
  component B15 is
  port(
    b :  in std_logic_vector(15 downto 0);
    outB : out std_logic_vector(15 downto 0)
  );
  
end component;


component bxor is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    bx :out  std_logic_vector(15 downto 0)
  );
  
end component;

component band is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    ba :out  std_logic_vector(15 downto 0)
  );
  
end component;

component bor is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    bo :out  std_logic_vector(15 downto 0)
  );
  
end component;

component bnot is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    bn :out  std_logic_vector(15 downto 0)
  );
  
end component;
  
  
  
  
component Add is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    cin : in std_logic;
    sum :out  std_logic_vector(15 downto 0);
    cout : out std_logic
  );
  
end component;

component Substract is
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    cin : in std_logic;
    sub :out  std_logic_vector(15 downto 0);
    bo : out std_logic
  );
  
end component;





component Multiply is
  port(
    Multiplier : in std_logic_vector(7 downto 0);
    Multiplicand : in std_logic_vector(7 downto 0);
    Product : out std_logic_vector(15 downto 0);
    start : in std_logic;
    clk : in std_logic;
    Done : out std_logic
  );
  
end component;

component slt is
  port(
    a :  in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    st : out std_logic
  );
  
end  component;


component shiftleftlogical is
  port(
    b :  in std_logic_vector(15 downto 0);
    ol :out  std_logic_vector(15 downto 0)
  );
  
end component;

component shiftrightlogical is
  port(
    b :  in std_logic_vector(15 downto 0);
    ol :out  std_logic_vector(15 downto 0)
  );
  
end component;

component shiftr is
  port(
    b :  in std_logic_vector(15 downto 0);
    os :out  std_logic_vector(15 downto 0)
  );
  
end component;

    

signal al1,al2,al3,al4,al5,al6,al7,al8,al9,al10 : std_logic_vector (15 downto 0);
signal co1,zst : std_logic;
signal bo : std_logic;
signal co2 : std_logic;
signal done : std_logic;
signal start : std_logic;
   
    
    begin
      
    
    
     m2: bxor port map (A,B,al2);
    m3: band port map (A,B,al3);
    m4: bor port map (A,B,al4);
     m6: Add port map(A,B,cin,al6,co1); 
      m7: Substract port map(A,B,cin,al7,bo);
      m8: Multiply port map(A(7 downto 0),B(7 downto 0),al8,'1',clk,done);
      m9 : shiftleftlogical port map (B,al9);
      m10:slt port map (A,B,zst);
        m1 : shiftrightlogical port map (B,al1);
      m5 : shiftr port map (B,al5);
          
        
 
       
        
   
        
  
  ------------------------------------------------------------
  process(func,op,al1,al2,al3,al4,al5
  ,al6,al7,al8,al9,al10)
    
    begin
      
      case op is
    when "0000"  => if (func = "000") then 
       AluO <= al6; cout <= co1;
     end if;
     when "0001"  =>  if (func = "001") then 
     AluO <= al7; cout <= bo;
   end if;
     when "0010"  =>  if (func = "010") then 
       AluO <= al3;
       end if;
     when "0011"  =>   if (func = "011") then 
     AluO <= al4;
     end if;
     when "0100"  =>   if (func = "100") then 
      AluO <= al2;
      end if;
     when "0101"  =>   if (func = "101") then 
      AluO <= al8;
      end if;
     when "0110"  =>    if (func = "110") then 
      st <= zst;
      end if;
     when "0111"  =>   if (func = "111") then 
      AluO <= B;
    end if;
     when "1000"  =>   
      AluO <= al9; -- shiftleftlogical
      
    when "1001"  =>  AluO <= al1; -- shiftright logical
    when "1010"  =>  AluO <= al5; -- shiftright arithmetic
     when others => null;
            
        
end case;
  
  if (al1 ="0" or al2 ="0"  or  al3 ="0"  or  al4 ="0" or al5="0" or al6 ="0" or  al7 ="0"
        or al8 ="0" or al9 ="0" or al10 ="0") then
        zout <='1';
      end if;
end process;
    
    
        
    end architecture;
  
       
       
