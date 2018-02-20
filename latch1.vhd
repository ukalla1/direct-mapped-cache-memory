library ieee;
use ieee.std_logic_1164.all;
entity latch1 is
	port(	data: in std_logic_vector(7 downto 0);
		clk: in std_logic;
		output: out std_logic_vector(7 downto 0));
end latch1;
architecture structural of latch1 is
component Dlatch
	port(	d   : in  std_logic;
         	clk : in  std_logic;
         	q   : out std_logic;
         	qbar: out std_logic);
end component;
for all: Dlatch use entity work.Dlatch(structural);
begin
	l1: Dlatch port map(data(0), clk, output(0));
	l2: Dlatch port map(data(1), clk, output(1));
	l3: Dlatch port map(data(2), clk, output(2));
	l4: Dlatch port map(data(3), clk, output(3));
	l5: Dlatch port map(data(4), clk, output(4));
	l6: Dlatch port map(data(5), clk, output(5));
	l7: Dlatch port map(data(6), clk, output(6));
	l8: Dlatch port map(data(7), clk, output(7));
end structural;
