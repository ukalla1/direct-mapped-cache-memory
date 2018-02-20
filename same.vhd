library ieee;
use ieee.std_logic_1164.all;
entity same is
	port(	input: in std_logic;
		output: out std_logic);
end same;
architecture structural of same is
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
for all: inverter use entity work.inverter(structural);
signal buf: std_logic;
begin
	s1: inverter port map(input, buf);
	s2: inverter port map(buf, output);
end structural;
