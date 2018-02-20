library ieee;
use ieee.std_logic_1164.all;
entity dec8_3 is
	port(	input1, input2, input3: in std_logic;
		output: out std_logic_vector(7 downto 0));
end dec8_3;
architecture structural of dec8_3 is
component dec2_4
	port(	input1: in std_logic;
                input2: in std_logic;
		en: in std_logic;
                output: out std_logic_vector(3 downto 0));
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
for all: inverter use entity work.inverter(structural);
for all: dec2_4 use entity work.dec2_4(structural);
signal buf: std_logic;
begin
	i1: inverter port map(input1, buf);
	d1: dec2_4 port map(input1, input2, buf, output(3 downto 0));
	d2: dec2_4 port map(input1, input2, input3, output(7 downto 4));
end structural;
