----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2017 08:53:35 PM
-- Design Name: 
-- Module Name: ASM - Behavioral
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

entity ASM is
    Port ( x1 : inout STD_LOGIC_VECTOR (31 downto 0);
           x2 : inout STD_LOGIC_VECTOR (31 downto 0);
           Enable : in STD_LOGIC;
           w : in STD_LOGIC);
end ASM;

architecture Behavioral of ASM is

signal R1:STD_LOGIC_VECTOR (31 downto 0):= x1;
signal R2:STD_LOGIC_VECTOR (31 downto 0):= x2;
signal R3:STD_LOGIC_VECTOR (31 downto 0):= x2;

TYPE State_type IS (S1, S2, S3, S4,X);  -- Define the states
SIGNAL State : State_Type;    -- Create a signal that uses 
							      -- the different states

begin

process(w,enable)

begin
    if(enable='1') then
    state <= s1;
    R3 <= '0';
    --injaa bayad hafeze piade saazi she
        if (w='1') then
   
           state <= s2;
           
           case state is 
           when s2 =>  R3<=R1;
           
           when s3 =>             
                          state <= s3;
                          R1<=R2;
                 
     when s4 =>            state <= s4;
                           R2<=R3;
                           end case;
        if(w='0') then
         --r1,r2 az biroon meghdar migiran
        end if;
        
end if;
    else --enable=0
    
    --system hichkaari nmikone
    state <=X;
end if;
end process;
end Behavioral;
