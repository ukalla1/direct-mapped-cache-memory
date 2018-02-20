library ieee;
use ieee.std_logic_1164.all;
entity mux8_1 is
	port(	input1: in std_logic_vector(7 downto 0);
		input2: in std_logic_vector(7 downto 0);
		sel: in std_logic;
		output: out std_logic_vector(7 downto 0));
end mux8_1;
architecture structural of mux8_1 is
component mux2_1
	port(	input1, input2, sel: in std_logic;
                output: out std_logic);
end component;
for all: mux2_1 use entity work.mux2_1(structural);
begin
	m1: mux2_1 port map(input1(0), input2(0), sel, output(0));
	m2: mux2_1 port map(input1(1), input2(1), sel, output(1));
	m3: mux2_1 port map(input1(2), input2(2), sel, output(2));
	m4: mux2_1 port map(input1(3), input2(3), sel, output(3));
	m5: mux2_1 port map(input1(4), input2(4), sel, output(4));
	m6: mux2_1 port map(input1(5), input2(5), sel, output(5));
	m7: mux2_1 port map(input1(6), input2(6), sel, output(6));
	m8: mux2_1 port map(input1(7), input2(7), sel, output(7));
end structural;
