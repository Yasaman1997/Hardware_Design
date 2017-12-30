----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2017 08:31:29 PM
-- Design Name: 
-- Module Name: me - Behavioral
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

ENTITY SimpleFSM is
PORT (clock:    IN STD_LOGIC;
      detect_a:        IN STD_LOGIC;
      detect_b:        IN STD_LOGIC;
      reset:    IN STD_LOGIC;
      counter:out int;
      ack: out std_logic);
END SimpleFSM;

architecture Behavioral of SimpleFSM is

TYPE State_type IS (Start,waiting, closed, opened);  -- Define the states
	SIGNAL State : State_Type;    -- Create a signal that uses 
							      -- the different states
BEGIN 
  PROCESS (clock, reset,detect_a,detect_b) 
  BEGIN 
    If (reset = '1') THEN            -- Upon reset, set the state to A
	State <= start;
 
     if(detect_a='1') then
          if(detect_b='1)then
          counter<=counter+1;
           elsif(detect_b='1) then
           if(detect_a='1) then
          counter<=counter-1;
     
    ELSIF rising_edge(clock) THEN    -- if there is a rising edge of the
			 -- clock, then do the stuff below

     
	-- The CASE statement checks the value of the State variable,
	-- and based on the value and any other control signals, changes
	-- to a new state.
	CASE State IS
 
		-- If the current state is A and P is set to 1, then the
		-- next state is B
		WHEN start => 
			IF detect_a='0' or detect_b='0' THEN 
			wait for 30s;
				State <= waiting; 
			END IF; 
 
		-- If the current state is B and P is set to 1, then the
		-- next state is C
		WHEN waiting => 
		wait for 30s;
			IF detect_a='0' or detect_b='0' THEN 
				State <= closed; 
			END IF; 
 
		-- If the current state is C and P is set to 1, then the
		-- next state is D
		WHEN closed => 
			 
				State <=closed; 
		
 
		-- If the current state is D and P is set to 1, then the
		-- next state is B.
		-- If the current state is D and P is set to 0, then the
		-- next state is A.
		WHEN opened=> 
			state<=opened;
		WHEN others =>
			State <= A;
	END CASE; 
    END IF; 
    
    
  END PROCESS;

-- Decode the current state to create the output
-- if the current state is D, R is 1 otherwise R is 0
ack <= '1' WHEN State=opened ELSE '0';



end Behavioral;
