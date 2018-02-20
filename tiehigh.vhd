library ieee;
use ieee.std_logic_1164.all;
entity tiehigh is
	port(	output: out std_logic);
end tiehigh;
architecture structural of tiehigh is 
begin
	output<= '1';
end structural;
