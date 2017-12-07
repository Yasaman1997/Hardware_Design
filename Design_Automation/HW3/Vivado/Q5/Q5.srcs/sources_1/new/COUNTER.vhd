
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
generic(N: integer:=4);
Port (clk:	in std_logic;
	    rst:	in std_logic;
	    count:	in std_logic;
	    Q:	out std_logic_vector(5 downto 0) );
end Counter;

architecture Behavioral of Counter is
 signal Pre_Q: std_logic_vector(5 downto 0);
begin
  process(clk,rst,count)
  begin
  if(rst='1') then 
   Pre_Q <= Pre_Q - Pre_Q;
  elsif(clk'event and clk='1' ) then
    if count = '1' then
        Pre_Q <= Pre_Q + N;
  end if;
END IF;
end process;
   Q <= Pre_Q;
end Behavioral;
