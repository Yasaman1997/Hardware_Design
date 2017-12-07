----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2017 01:06:10 PM
-- Design Name: 
-- Module Name: Grades - Behavioral
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


entity grades is

Port (grade:in std_logic; --between 0-100
	    a:out std_logic; 
	    b:out std_logic;
	    c:out std_logic;
	    d:out std_logic);
end grades;



architecture bhv of grades is
begin
 

d<='1' when ((grade>'51') and (grade<'60')) else


c<='1' when ((grade>'51') and (grade<'60')) else


b<='1' when ((grade>'76') and (grade<'85')) else   


a<='1' when ((grade>'86')  and (grade<'100')) else   

others <='0';

   
  

  
end bhv;


