library ieee;
library STD;
use ieee.std_logic_1164.all;
entity mux2_1 is
	port(	input1, input2, sel: in std_logic;
		output: out std_logic);
end mux2_1;
architecture structural of mux2_1 is
	component inverter
		port(	input: in std_logic;
			output: out std_logic);
	end component;
	component and1
		port(	input1: in std_logic;
			input2: in std_logic;
			output: out std_logic);
	end component;
	component or1
		port(	input1, input2: in std_logic;
			output: out std_logic);
	end component;
	for i1: inverter use entity work.inverter(structural);
	for a1, a2: and1 use entity work.and1(structural);
	for o1: or1 use entity work.or1(structural);
	signal temp1, temp2, temp3: std_logic;
	begin
		i1: inverter port map (sel, temp1);
		a1: and1 port map (temp1, input1, temp2);
		a2: and1 port map (sel, input2, temp3);
		o1: or1 port map (temp2, temp3, output);
end structural;
