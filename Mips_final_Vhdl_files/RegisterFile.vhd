library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registerfile is
	
	port (readaddr1, readaddr2 : in std_logic_vector (2 downto 0);
		writeaddr : in std_logic_vector (2 downto 0);
		data : in std_logic_vector (15 downto 0);
		write, clk : in std_logic;
		O1, O2 : out std_logic_vector (15 downto 0));
end entity;

architecture rtl of registerfile is
	type mem is array (natural range <>) of std_logic_vector (15 downto 0);
	constant memsize : integer := 8;
	signal memory : mem (0 to memsize - 1) := (others => (others => '0'));
begin	
	process (clk)
			begin
		if clk'event and clk = '1' then
			if write = '1' then
				memory(to_integer(unsigned(writeaddr))) <= data;
			else
				O1 <= memory(to_integer(unsigned(readaddr1)));
				O2 <= memory(to_integer(unsigned(readaddr2)));
			end if;
		end if;
	end process;
end architecture rtl;