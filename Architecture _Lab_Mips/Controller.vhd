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
reset : in std_logic;
ALUOp : out std_logic_vector(0 to 2);
EnablePC,reset_pc,RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,PCSrc,jr : out std_logic;





);
end Controller;

architecture Behavioral of Controller is

 type state is (reset,fetch,fetch1,decode,execute,executeload1);
    signal current_state : state:= reset;
    signal next_state : state;

begin

 process(clk,reset)
    begin
          
        if (reset = '1') then
          current_state <= reset;
          
        elsif(clk'event and clk = '1') then
        
        current_state <= next_state;
        
      end if;
    end process;
	 
	 
	  process (current_state,instruction)      
          
          begin 
            
    
      case current_state is
		
		when reset => 
		EnablePc <= '1' ; 
		reset_pc < = '1' ; 
		RegDst < = ' 0 ' ; 
		RegWrite <= ' 0 ' ;
		ALUSrc <= '0 ' ; 
		MemWrite <='0';
		MemRead <='0';
		MemToReg <='0';
		PCSrc <='0';
		
		next_state <= fetch;
	when fetch => 

		reset_pc < = '0' ; 
		RegDst < = ' 0 ' ; 
		RegWrite <= ' 0 ' ;
		ALUSrc <= '0 ' ; 
		MemWrite <='0';
		MemRead <='1';
		MemToReg <='0';
		
		next_state <= fetch1;

			

	
	when fetch1 => 
 
		PCSrc <='0';
		
		reset_pc < = '0' ; 
		RegDst < = ' 0 ' ; 
		RegWrite <= ' 0 ' ;
		ALUSrc <= '0 ' ; 
		MemWrite <='0';
		MemRead <='0';
		MemToReg <='0';
		
		next_state <= decode;
		


	
	when decode => 
	
	
opcode <= instruction(15 downto 12) ; 
src1 <= instruction(11 downto 9) ; 
src2 <= instruction(8 downto 6) ; 
dst <= instruction(5 downto 3) ; 
func <= instruction(2 downto 0) ; 


	
	
	
	
		EnablePc <= '1' ; 
		reset_pc < = '0' ; 
		RegDst < = ' 0 ' ; 
		RegWrite <= ' 0 ' ;
		ALUSrc <= '0 ' ; 
		setl <= '0';
		Zero <='0';
		Cout <='0';
		MemWrite <='0';
		MemRead <='0';
		MemToReg <='0';
		PCSrc <='0;
		
		next_state <= execute;



	
when execute => 
	
	--R type instructions
	if (opcode ="0000") then
	
	case func is
	
	--add
when "000" => 
	AluSrc <='0' ; 
	aluop <= "000";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	
		--sub
when "001" => 
	AluSrc <='0' ; 
	aluop <= "001";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	
	--and
	
when "010" => 
	AluSrc <='0' ; 
	aluop <= "010";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	
	
	--or
		
when "011" => 
	AluSrc <='0' ; 
	aluop <= "011";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	
	--xor
		
when "100" => 
	AluSrc <='0' ; 
	aluop <= "100";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	--Mult
		
when "101" => 
	AluSrc <='0' ; 
	aluop <= "101";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	--slt
		
	
when "110" => 
	AluSrc <='0' ; 
	aluop <= "110";
	MemToReg <='1';
	RegWrite <= '1' ;
	
	
	--jr
		
when "111" => 
	AluSrc <='0' ; 
	aluop <= "111";
	MemToReg <='1';
	RegWrite <= '1' ;
	jr <= '1';
	
	
	
	
	
	end case;
	
	end if;
	
	
	--Itype Instructions
	
	case  opcode is 
	when "0001" => 
	--add i 
	AluSrc < ='1 ' ; 
	AluOp<= '"000";
	MemToReg  <='1';
	RegWrite <='1';
	
		when "0010" => 
		--and
			AluSrc < ='1 ' ; 
	AluOp<= '"010";
	MemToReg  <='1';
	RegWrite <='1';
		when "0011" => 
		--or
			AluSrc < ='1 ' ; 
	AluOp<= "011";
	MemToReg  <='1';
	RegWrite <='1';
		when "0100" => 
		--shift l logical 
		
		when "0101" => 
		--shift right logical
		when "0110" => 
		--shift right arithmetic
		when "0111" => 
		--load
	AluSrc <= '1';
		MemToReg <= '0';
		RegWrite <= '1';
		ALUOp <= "000";
	
	next_state <= executeload1;
		
		when "1000" => 
		--store
		when "1001" => 
		--BEQ
		when "1010" => 
		--B not EQ
		when "1011" => 
		--B less than 
		when "1100" => 
		--B greater than 
		when "1101" => 
		--B less or eq
		when "1110" => 
	--B greater or eq
	
	
	
	
	--Jtype 
	when "1111" =>
	--jump address
	
	
	
	
	
	
	
	
	



	
	when executeload1=> 
		
Memread <= '1'; 

	next_state <= fetch;
		end case;


end Behavioral;

