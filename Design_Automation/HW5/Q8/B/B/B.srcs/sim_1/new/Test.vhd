----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2017 05:03:29 PM
-- Design Name: 
-- Module Name: Test - Behavioral
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

entity Test is
Port (A, B, C : in std_logic;
Q1, Q2 : out std_logic );
end Test;

architecture Behavioral of Test is

signal V, R : std_logic;
begin
process (V, C)
begin
if (V = '1') then
Q2 <= C;
end if;
end process;
R <= B xor C;
process (A)
begin
if( rising_edge(A)) then
Q1 <= C;
V <= R;

end if;
end process;


end Behavioral;
