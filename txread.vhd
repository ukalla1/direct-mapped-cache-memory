library ieee;
use ieee.std_logic_1164.all;
entity txread is
	port(	input: in std_logic_vector(7 downto 0);
		sel: in std_logic;
		output: out std_logic_vector(7 downto 0));
end txread;
architecture structural of txread is
component tx
	port(	sel   : in std_logic;
         	selnot: in std_logic;
         	input : in std_logic;
        	output:out std_logic);
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
for all: inverter use entity work.inverter(structural);
for all: tx use entity work.tx(structural);
signal inv: std_logic;
begin
	i1: inverter port map(sel, inv);
	t1: tx port map(sel, inv, input(0), output(0));
	t2: tx port map(sel, inv, input(1), output(1));
	t3: tx port map(sel, inv, input(2), output(2));
	t4: tx port map(sel, inv, input(3), output(3));
	t5: tx port map(sel, inv, input(4), output(4));
	t6: tx port map(sel, inv, input(5), output(5));
	t7: tx port map(sel, inv, input(6), output(6));
	t8: tx port map(sel, inv, input(7), output(7));
end structural;
