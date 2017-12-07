----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2017 12:51:10 PM
-- Design Name: 
-- Module Name: test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
    Port (a: in std_logic;
          b: in std_logic;
          c: in std_logic;
          x: in std_logic;
          y: in std_logic;
          z: out std_logic);
end test;

architecture Behavioral of test is

begin
process (a,b,c,x,y)
begin
if (a='1') then
z <= x;
elsif (b='1') then
z <= x or y;
elsif (c='1') then
z <= x and y;
else
z <= not y;
end if;
end process;


end Behavioral;
