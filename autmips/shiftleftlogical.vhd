----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:18 05/22/2017 
-- Design Name: 
-- Module Name:    shiftleftlogical - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;




entity shiftleftlogical is
  port(
    b :  in std_logic_vector(15 downto 0);
    ol :out  std_logic_vector(15 downto 0)
  );
  
end entity;

architecture dataflow of shiftleftlogical is
begin
  

     
ol <= (b(14 downto 0) & '0');

end architecture;

