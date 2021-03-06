library ieee;
use ieee.std_logic_1164.all;
entity counter1 is
	port(	d: in std_logic;
		clk: in std_logic;
		reset: in std_logic;
		busy: out std_logic;
		q: out std_logic_vector(18 downto 0));
end counter1;
architecture structural of counter1 is
component dff
	port(	d   : in  std_logic;
         	clk : in  std_logic;
         	clr : in  std_logic;
         	q   : out std_logic;
         	qbar: out std_logic);
end component;
component same
	port(	input: in std_logic;
		output: out std_logic);
end component;
component or1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
for all: or1 use entity work.or1(structural);
for all: same use entity work.same(structural);
for all: dff use entity work.dff(structural);
signal buf, bufb: std_logic_vector(18 downto 0);
signal sig: std_logic_vector(16 downto 0);
begin
	d1: dff port map(d, clk, reset, buf(0), bufb(0));
	d2: dff port map(buf(0), clk, reset, buf(1), bufb(1));
	d3: dff port map(buf(1), clk, reset, buf(2), bufb(2));
	d4: dff port map(buf(2), clk, reset, buf(3), bufb(3));
	d5: dff port map(buf(3), clk, reset, buf(4), bufb(4));
	d6: dff port map(buf(4), clk, reset, buf(5), bufb(5));
 	d7: dff port map(buf(5), clk, reset, buf(6), bufb(6));
 	d8: dff port map(buf(6), clk, reset, buf(7), bufb(7));
 	d9: dff port map(buf(7), clk, reset, buf(8), bufb(8));
 	d10: dff port map(buf(8), clk, reset, buf(9), bufb(9));
 	d11: dff port map(buf(9), clk, reset, buf(10), bufb(10));
 	d12: dff port map(buf(10), clk, reset, buf(11), bufb(11));
 	d13: dff port map(buf(11), clk, reset, buf(12), bufb(12));
 	d14: dff port map(buf(12), clk, reset, buf(13), bufb(13));
 	d15: dff port map(buf(13), clk, reset, buf(14), bufb(14));
 	d16: dff port map(buf(14), clk, reset, buf(15), bufb(15));
 	d17: dff port map(buf(15), clk, reset, buf(16), bufb(16));
 	d18: dff port map(buf(16), clk, reset, buf(17), bufb(17));
 	d19: dff port map(buf(17), clk, reset, buf(18), bufb(18));
	s1: same port map(buf(0), q(0));
	s2: same port map(buf(1), q(1));
	s3: same port map(buf(2), q(2));
	s4: same port map(buf(3), q(3));
	s5: same port map(buf(4), q(4));
	s6: same port map(buf(5), q(5));
	s7: same port map(buf(6), q(6));
	s8: same port map(buf(7), q(7));
	s9: same port map(buf(8), q(8));
	s10: same port map(buf(9), q(9));
	s11: same port map(buf(10), q(10));
	s12: same port map(buf(11), q(11));
	s13: same port map(buf(12), q(12));
	s14: same port map(buf(13), q(13));
	s15: same port map(buf(14), q(14));
	s16: same port map(buf(15), q(15));
	s17: same port map(buf(16), q(16));
	s18: same port map(buf(17), q(17));
	s19: same port map(buf(18), q(18));
	o1: or1 port map(buf(0), buf(1), sig(0));
	o2: or1 port map(sig(0), buf(2), sig(1));
	o3: or1 port map(sig(1), buf(3), sig(2));
	o4: or1 port map(sig(2), buf(4), sig(3));
	o5: or1 port map(sig(3), buf(5), sig(4));
 	o6: or1 port map(sig(4), buf(6), sig(5));
 	o7: or1 port map(sig(5), buf(7), sig(6));
 	o8: or1 port map(sig(6), buf(8), sig(7));
 	o9: or1 port map(sig(7), buf(9), sig(8));
 	o10: or1 port map(sig(8), buf(10), sig(9));
 	o11: or1 port map(sig(9), buf(11), sig(10));
 	o12: or1 port map(sig(10), buf(12), sig(11));
 	o13: or1 port map(sig(11), buf(13), sig(12));
 	o14: or1 port map(sig(12), buf(14), sig(13));
 	o15: or1 port map(sig(13), buf(15), sig(14));
 	o16: or1 port map(sig(14), buf(16), sig(15));
 	o17: or1 port map(sig(15), buf(17), sig(16));
 	o18: or1 port map(sig(16), buf(18), busy);
end structural;
