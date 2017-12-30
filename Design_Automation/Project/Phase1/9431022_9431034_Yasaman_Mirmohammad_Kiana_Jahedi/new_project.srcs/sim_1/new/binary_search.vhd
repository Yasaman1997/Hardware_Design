----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2017 03:32:29 PM
-- Design Name: 
-- Module Name: binary_search - Behavioral
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

entity binary_search is
Port (plate: in integer range 11111 to 99999;
      ready: in std_logic
      ack:out boolean;
end binary_search;

architecture Behavioral of binary_search is
type plate_array is array(99 downto 0) of integer;
signal p_array : plate_array;

process(ready)
begin
end po
begin


 function binary_search(plate_array,target) return boolean is
 
    variable low:integer:=0;
    variable high:integer:=plate_array'range;
    variable mid:integer;
     begin
     while( low<=high ) loop
          mid=(low+(high-low))/2;
          if(plate_array(mid)=target)
            return true;
          elsif(plate_array(mid)<target)
            low<=mid+1;
          else:
            high<=mid-1; 
            
            
            --not found
            return false;
            
 end binary_search;   
       
 process
 begin
 --read from file and make array
 --call the function
 
          
            
       
end process;
end Behavioral;
