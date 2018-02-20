library ieee;
use ieee.std_logic_1164.all;
entity tielow is
	port(output: out std_logic);
end tielow;
architecture structural of tielow is
begin
	output<= '0';
end structural;
