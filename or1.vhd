library ieee;
library STD;
use ieee.std_logic_1164.all;
entity or1 is
	port(	input1, input2: in std_logic;
		output: out std_logic);
end or1;
architecture structural of or1 is
begin
	output<= input1 or input2;
end structural;
