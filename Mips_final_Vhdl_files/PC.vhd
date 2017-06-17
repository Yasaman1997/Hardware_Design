library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY PC IS
 PORT (
 EnablePC : IN std_logic;
 input: IN std_logic_vector (15 DOWNTO 0);
 rst : in std_logic;
 clk : IN std_logic;
 output: OUT std_logic_vector (15 DOWNTO 0)
 );
END PC;

 ARCHITECTURE dataflow OF PC IS 
 BEGIN
PROCESS (clk,EnablePC,rst)
 BEGIN



if (CLK'event and CLK = '1') and  EnablePC = '1'  then
			OUTPUT <= INPUT;
		end if;
		
		-- Reset PC on RST=1
		if (CLK'event and CLK = '1') and rst = '1' then
			 OUTPUT <= "0000000000000000";	
end if;









END PROCESS;
END dataflow;