----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2017 12:53:25 PM
-- Design Name: 
-- Module Name: light - Behavioral
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

entity concurrent is
 Port (a:in std_logic;
       b:in std_logic;
       c:in std_logic; 
       d:in std_logic; 
       x:out std_logic );
end concurrent;

architecture Behavioral of concurrent is

begin
signal av0,av1,sum;

sum<=(a+b+c+d);
av0 <='0' & sum;
av1<='0' & av0;


if(av1>100) then
x<='0'  --off
else
x<='1'; --on
end Behavioral;
