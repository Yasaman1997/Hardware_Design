----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:10 05/22/2017 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller is
port (


instruction : in std_logic_vector(15 downto 0);
clk : in std_logic;
rst : in std_logic;
Zero,lt,gt,lteq,gteq : in std_logic;
ALUOp : out std_logic_vector(0 to 2);
OP : out std_logic_vector (3 downto 0);
EnablePC,reset_pc,RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,PCSrc,jr,jmpEn,setl: out std_logic





);
end Controller;

architecture Behavioral of Controller is

 type state is (reset,fetch,fetch1,decode,execute,executeload1);
    signal current_state : state:= reset;
    signal next_state : state;
    signal opcode : std_logic_vector (3 downto 0);
    signal func : std_logic_vector (2 downto 0);

begin

 process(clk,rst)
    begin
          
        if (rst = '1') then
          current_state <= reset;
          
        elsif(clk'event and clk = '1') then
        
        current_state <= next_state;
        
      end if;
    end process;

	  process (current_state,instruction,Zero,opcode,func,lt,lteq,gt,gteq)      
          
          begin 
            
    
      case current_state is
		
		when reset => 
		
		reset_pc <= '1' ; 
		RegDst <= '0' ; 
		RegWrite <= '0' ;
		ALUSrc <= '0' ; 
		MemWrite <='0';
		MemRead <='0';
		MemToReg <='0';
		EnablePc <= '1' ; 
		
		next_state <= fetch;
		
	when fetch => 

		reset_pc <= '0' ; 
		RegDst <= '0' ; 
		PCSrc <= '0';
		RegWrite <= '0' ;
		ALUSrc <= '0' ;
		ALUop <= "000";
		OP <= "0000"; 
		MemWrite <= '0';
		MemRead <='0';
		MemToReg <='0';
		
		next_state <= fetch1;

			

	
	when fetch1 => 
 

		reset_pc <= '0' ; 
		RegDst <= '0' ; 
		RegWrite <= '0' ;
		ALUSrc <= '0' ; 
		MemWrite <='0';
		MemRead <='0';
		MemToReg <='0';
		EnablePC <= '0';
		
		next_state <= decode;
		


	
	when decode => 
	
	
opcode <= instruction(15 downto 12) ; 
func <= instruction(2 downto 0) ; 


	
	
	
	
		EnablePc <= '0' ; 
		reset_pc <= '0' ; 
		RegDst <= '0' ; 
		RegWrite <= '0' ;
		ALUSrc <= '0' ; 
		setl <= '0';
		MemWrite <='0';
		MemRead <='0';
		MemToReg <='0';

		
		next_state <= execute;



	
when execute => 
	
	--R type instructions
	if (instruction(15 downto 12)="0000") then
	
	case instruction(2 downto 0) is
	
	--add
when "000" => 
	AluSrc <='0' ;
	OP <= "0000";
	aluop <= "000";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	
		--sub
when "001" => 
	AluSrc <='0' ; 
	OP <= "0001";
	aluop <= "001";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	
	--and
	
when "010" => 
	AluSrc <='0' ;
	OP <= "0010"; 
	aluop <= "010";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	
	
	--or
		
when "011" => 
	AluSrc <='0' ; 
	OP <= "0011";
	aluop <= "011";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	
	--xor
		
when "100" => 
	AluSrc <='0' ; 
	OP <= "0100";
	aluop <= "100";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	--Mult
		
when "101" => 
	AluSrc <='0' ; 
	OP <= "0101";
	aluop <= "101";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	--slt
		
	
when "110" => 
	AluSrc <='0' ; 
	OP <= "0110";
	aluop <= "110";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
	
	--jr
		
when "111" => 
	AluSrc <='0' ; 
	OP <= "0111";
	aluop <= "111";
	MemToReg <='1';
	RegWrite <= '1' ;
	jr <= '1';
	EnablePc <= '1';
	
	
	next_state <= fetch;
	
	when others => null;
	
	
	
	
	
	end case;
	
	end if;
	
	
	--Itype Instructions
	
	case  instruction(15 downto 12) is 
	when "0001" => 
	--add i 
	AluSrc <= '1' ; 
	AluOp<= "000";
	MemToReg  <='1';
	RegWrite <='1';
	
	EnablePC <= '1'; 
	next_state <= fetch;
	
		when "0010" => 
		--and
			AluSrc <='1' ; 
	AluOp<= "010";
	MemToReg  <='1';
	RegWrite <='1';
	
	EnablePC <= '1'; 
	next_state <= fetch;
		when "0011" => 
		--or
			AluSrc <= '1' ; 
	AluOp<= "011";
	MemToReg  <='1';
	RegWrite <='1';
	
	EnablePC <= '1'; 
	next_state <= fetch;
		when "0100" => 
		--shift left logical 
		RegDst <= '0';
		ALUSrc <= '1';
		OP<= "1000";
		MemtoReg <= '1';
		RegWrite <= '1';
		
		
		
		EnablePC <= '1'; 
	next_state <= fetch;
		
		when "0101" => 
		--shift right logical
		RegDst <= '0';
		ALUSrc <= '1';
		OP<= "1001";
		MemtoReg <= '1';
		RegWrite <= '1';
		
		
		
		
		EnablePC <= '1'; 
	next_state <= fetch;
	
		when "0110" => 
		--shift right arithmetic
		RegDst <= '0';
		ALUSrc <= '1';
		OP<= "1010";
		MemtoReg <= '1';
		RegWrite <= '1';
		
		
		EnablePC <= '1'; 
	next_state <= fetch;
	
		when "0111" => 
		--load
	
	AluSrc <= '1';
	MemRead <= '1';
		OP <= "0000";
		ALUOp <= "000";
		MemtoReg <= '0';
		RegWrite <= '1';
		
		
		
		EnablePc <= '0' ; 
		reset_pc <= '0' ; 
		RegDst <= '0' ; 
		setl <= '0';
		MemWrite <='0';


	
	next_state <= fetch;
		
		when "1000" => 
		--store
		RegWrite <= '0';
		AluSrc <= '1';
		AluOp <= "000";
		MemWrite <= '1';
		
		EnablePC <= '1'; 
	next_state <= fetch;
		
		when "1001" => 
		--Branch if equal
		AluSrc <= '0';
		AluOp <= "001";
		if(Zero = '1') then
		PCSrc <= '1';
		else
		  PCSrc<= '0';
		  
		  end if;
		  EnablePC <= '1'; 
	next_state <= fetch;
		
		when "1010" => 
		  
		--Branch if not EQ
		AluSrc <= '0';
		AluOp <= "001";
		if(Zero = '0') then
		PCSrc <= '1';
		else
		  PCSrc<= '0';
		  
		  end if;
		  EnablePC <= '1'; 
	next_state <= fetch;
		
		when "1011" => 
		--Branch if less than 
		 AluSrc <= '0';
		 if(lt  = '1') then
		 PCSrc <= '1';
		 else
		   PCSrc<= '0';
		end if;
		EnablePC <= '1'; 
	next_state <= fetch;
		
		when "1100" => 
		--Branch if greater than 
		
		 AluSrc <= '0';
		 if(gt  = '1') then
		 PCSrc <= '1';
		 else
		   PCSrc<= '0';
		end if;
		EnablePC <= '1'; 
	next_state <= fetch;
		
		when "1101" => 
		--Branch if  less or equal
		 AluSrc <= '0';
		 if(lteq  = '1') then
		 PCSrc <= '1';
		 else
		   PCSrc<= '0';
		end if;
		EnablePC <= '1'; 
	next_state <= fetch;
		
		when "1110" => 
	--Branch if greater or eq
	 AluSrc <= '0';
		 if(gteq  = '1') then
		 PCSrc <= '1';
		 else
		   PCSrc<= '0';
		end if;
		EnablePC <= '1'; 
	next_state <= fetch;
	
	
	
	--Jtype 
	when "1111" =>
	--jump address
	jmpEn <= '1';
	EnablePC <= '1'; 
	next_state <= fetch;
	
		when others => null;
	
	end case;
	
	
	when executeload1=> 
		
Memread <= '1'; 
	PCSrc<='0';




		reset_pc <= '0' ; 
		RegDst <= '0' ; 
		RegWrite <= '1' ;
		ALUSrc <= '0' ; 
		setl <= '0';
		MemWrite <='0';
EnablePC <= '1'; 
	next_state <= fetch;
	
		
end case;
end process;

end Behavioral;


