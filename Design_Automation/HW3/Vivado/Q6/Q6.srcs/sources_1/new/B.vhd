library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity B is
  Port ( rstn:in std_logic;
         clk:in std_logic;
         sout:out std_logic);
end B;

architecture bhv of B is
begin
process(rstn,clk)
variable ff8 : std_logic_vector(7 downto 0);
begin
if (rstn = '0') then
ff8 := "00000000";
elsif (clk'event and clk ='1') then
ff8(7) := SIN;
ff8(6) := ff8(7);
ff8(5) := ff8(6);
ff8(4) := ff8(5);
ff8(3) := ff8(4);
ff8(2) := ff8(3);
ff8(1) := ff8(2);
ff8(0) := ff8(1);
end if;
sout <= ff8(0);
end process;
 end bhv;
