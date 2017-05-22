library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY PC IS
 PORT (
 EnablePC : IN std_logic;
 input: IN std_logic_vector (15 DOWNTO 0);
 rst : in std_logic;
 clk : IN std_logic;
 output: OUT std_logic_vector (15 DOWNTO 0)
 );
END PC;

 ARCHITECTURE dataflow OF PC IS BEGIN
PROCESS (clk) BEGIN
IF (clk = '1' and clk'event) THEN
IF (EnablePC = '1') THEN
output <= input;
END IF;
END IF;
END PROCESS;
END dataflow;