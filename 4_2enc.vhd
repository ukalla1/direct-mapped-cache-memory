library ieee;
use ieee.std_logic_1164.all;
entity enc4_2 is
	port(	input1, input2, input3: in std_logic;
		output1, output2: out std_logic);
end enc4_2;
architecture structural of enc4_2 is
component inverter 
	port(	input: in std_logic;
		output: out std_logic);
end component;
component and1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
component or1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
for all: and1 use entity work.and1(structural);
for all: or1 use entity work.or1(structural);
for all: inverter use entity work.inverter(structural);
signal inv, buf: std_logic;
begin
	i1: inverter port map(input2, inv);
	a1: and1 port map(input1, inv, buf);
	o1: or1 port map(input2, input3, output1);
	o2: or1 port map(input3, buf, output2);
end structural;
