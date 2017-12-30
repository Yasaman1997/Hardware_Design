----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2017 03:20:53 PM
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
Port (lamps:out std_logic_vector(5 Downto 0);
      ready:in  std_logic;
      clk:in  std_logic;
      plate:in integer range 11111 to 99999 ;
     -- location : in integer range 0 to 99;
      new_input:in std_logic_vector(31 Downto 0);
      
      );
end test;

architecture Behavioral of test is

constant clock_T : time := 50 ns;
 

begin
process
begin
  -- if(clk'event and clk = '1') then
      --  if(ready = '1') then
          --  case location :
              --  when 0 to 24=>
                --    lamps<="000011";
               -- when 25 to 49=>
             --       lamps<="000110";
             --    when 50 to 74=>
            --        lamps<="011010";
            --     when 75 to 99=>
           --         lamps<="110010";       
     --   end if;
   -- end if;
   ready<='1';
   wait for clock_T;
   ready<='0';
   
end process;


process 
begin
new_input<="00000000000000000000000000000111"  ;
new_input<="00000000000000000000000000000110"  ;
new_input<="00000000000000000000000000000011"  ;

end process;
end Behavioral;
