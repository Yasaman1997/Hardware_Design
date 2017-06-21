
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Datapath is
 PORT (
   
 clk : in std_logic;
 rst : in std_logic
 
 
 );
END Datapath;

 ARCHITECTURE dataflow OF Datapath IS
 
 --instruction memory
component InstructionMemory is
	port (address : in std_logic_vector (15 downto 0);
	  IMload : in std_logic;
	  clk : in std_logic;
		instruction : out std_logic_vector (15 downto 0)
		);
end component;

--pc
component PC IS
 PORT (
 EnablePC : IN std_logic;
 input: IN std_logic_vector (15 DOWNTO 0);
 rst : in std_logic;
 clk : IN std_logic;
 output: OUT std_logic_vector (15 DOWNTO 0)
 );
END component;

--adder1
component Adder1 is
    Port ( num1 : in  STD_LOGIC_VECTOR (15 downto 0);
           num2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  result : OUT STD_LOGIC_VECTOR (15 downto 0));
			  			  
end component;
  
--mux2
component mux_2 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (2 downto 0);
           B   : in  STD_LOGIC_VECTOR (2 downto 0);
           X   : out STD_LOGIC_VECTOR (2 downto 0));
end component;


--register file
component registerfile is
	
	port (readaddr1, readaddr2 : in std_logic_vector (2 downto 0);
		writeaddr : in std_logic_vector (2 downto 0);
		data : in std_logic_vector (15 downto 0);
		write, clk : in std_logic;
		O1, O2 : out std_logic_vector (15 downto 0));
end component;

--sign extend
component Sign_Extend is
    Port ( Input : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

--alu
component ArithmeticUnit is
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
end component;


--data memory
component  DataMemory is
  
port (
			clk : in std_logic;
			MemWrite: in std_logic;
			MemRead: in std_logic;
			addr : in std_logic_vector (15 downto 0) ;
			dout : out std_logic_vector (15 downto 0);
			din: in std_logic_vector (15 downto 0 ) 
     );
end  component;


--shift
component shiftl is
  port(
    b :  in std_logic_vector(15 downto 0);
    ol :out  std_logic_vector(15 downto 0)
  );
  
end component;


--mux16
component mux16 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (15 downto 0);
           B   : in  STD_LOGIC_VECTOR (15 downto 0);
           X   : out STD_LOGIC_VECTOR (15 downto 0));
end component;



--comparator
component Compare is
  
  
  port(
    a : in std_logic_vector(15 downto 0);
    b :  in std_logic_vector(15 downto 0);
    lt : out std_logic;
    gt : out std_logic;
    lteq : out std_logic;
    gteq : out std_logic
   
  );
  
end component;



--mux_16_4
component mux16_4 is
    Port ( SEL : in  STD_LOGIC_vector (1 downto 0);
           A   : in  STD_LOGIC_VECTOR (15 downto 0);
           B   : in  STD_LOGIC_VECTOR (15 downto 0);
           C   : in  STD_LOGIC_VECTOR (15 downto 0);
           D   : in std_logic_vector(15 downto 0);
           X   : out STD_LOGIC_VECTOR (15 downto 0));
end component;


--controller
component Controller is
port (
instruction : in std_logic_vector(15 downto 0);
clk : in std_logic;
rst : in std_logic;
Zero,lt,gt,lteq,gteq : in std_logic;
ALUOp : out std_logic_vector(0 to 2);
OP : out std_logic_vector (3 downto 0);
PCSrc : out std_logic_vector (1 downto 0);
EnablePC,reset_pc,RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,IMload: out std_logic

);
end component;

signal EnablePC,reset_pc,RegDst,RegWrite,ALUSrc,setl,Zero,Cout,MemWrite,MemRead,MemToReg,jr,lt,gt,lteq,gteq,jmpEn,IMload : std_logic;
signal pcout,sum,writedata,A,B,se_out,Alu_in2,result,Memout,sho,add_s,tmp : std_logic_vector(15 downto 0);
signal WR : std_logic_vector(2 downto 0);
signal pc_in : std_logic_vector (15 downto 0);
signal ALUOp : std_logic_vector(0 to 2);
signal OP : std_logic_vector(3 downto 0);
signal PCSrc : std_logic_vector(1 downto 0);
signal instruction : std_logic_vector (15 downto 0):= "0111000001000011";

 
  BEGIN
    
            
con : Controller port map (instruction,clk,rst,Zero,lt,gt,lteq,gteq,AluOp,OP,PCSrc,
EnablePC,reset_pc,RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,IMload);        
        
PCO : PC port map (EnablePC,pc_in,reset_pc,clk,pcout);
  
AD : Adder1 port map (pcout,"0000000000000001",sum);
  
mu2 : mux_2 port map (RegDst,instruction(8 downto 6),instruction(5 downto 3),WR);
  
RG : registerfile port map(instruction(11 downto 9),instruction(8 downto 6),WR,writedata,RegWrite,clk,A,B);
  
SE : Sign_Extend port map (instruction(5 downto 0),se_out); 
  
mux2 : mux16 port map (ALUSrc,B,se_out,ALU_in2); 
  
AL :  ArithmeticUnit port map (A,ALU_in2,clk,'0',ALUOp,OP ,result,setl,Zero,Cout);
  
DataMem : DataMemory port map (clk,MemWrite,MemRead,result, Memout ,B); 
  
mux3 : mux16 port map (MemToReg,Memout,result,writedata); 
  
shl : shiftl port map (se_out,sho);
  
AD2 : Adder1 port map (sum,sho,add_s);
  
mux4 : mux16_4 port map (PCSrc,sum,add_s,result,tmp,pc_in); 
  
IM : InstructionMemory port map(pcout,IMload,clk,instruction);
  
cmp : Compare port map (A,ALU_in2,lt,gt,lteq,gteq);

tmp <= pcout (15 downto 13) & instruction (11 downto 0) &  '0';




END dataflow;
