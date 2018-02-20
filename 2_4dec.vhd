library ieee;
use ieee.std_logic_1164.all;
entity dec2_4 is
	port(	input1, input2: in std_logic;
		en: in std_logic;
		output: out std_logic_vector(3 downto 0));
end dec2_4;
architecture structural of dec2_4 is
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
component and3
	port(	input1, input2, input3: in std_logic;
		output: out std_logic);
end component;
signal i1,i2: std_logic;
for all: inverter use entity work.inverter(structural);
for all: and3 use entity work.and3(structural);
begin
	inv0: inverter port map(input1, i1);
	inv1: inverter port map(input2, i2);
	a1: and3 port map(input1, input2, en, output(0));
	a2: and3 port map(input1, i2, en, output(1));
	a3: and3 port map(i1, input2, en, output(2));
	a4: and3 port map(i1, i2, en, output(3));
end structural;
