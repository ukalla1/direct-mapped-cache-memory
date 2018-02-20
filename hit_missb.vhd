library ieee;
use ieee.std_logic_1164.all;
entity hit_missb is
	port(	valid: in std_logic;
		address: in std_logic_vector(2 downto 0);
		tag: in std_logic_vector(2 downto 0);
		rd_wrb: in std_logic;
		en: in std_logic;
		output: out std_logic_vector(3 downto 0));
end hit_missb;
architecture structural of hit_missb is
component xor2
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
component and3
	port(	input1, input2, input3: in std_logic;
		output: out std_logic);
end component;
component and1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
component dec2_4
	port(	input1, input2: in std_logic;
		en: in std_logic;
		output: out std_logic_vector(3 downto 0));
end component;
for all: xor2 use entity work.xor2(structural);
for all: inverter use entity work.inverter(structural);
for all: and1 use entity work.and1(structural);
for all: and3 use entity work.and3(structural);
for all: dec2_4 use entity work.dec2_4(structural);
signal inv, buf1: std_logic_vector(2 downto 0);
signal buf2, buf3: std_logic;
begin
	x1: xor2 port map(address(0), tag(0), buf1(0));
	x2: xor2 port map(address(1), tag(1), buf1(1));
	x3: xor2 port map(address(2), tag(2), buf1(2));
	i1: inverter port map(buf1(0), inv(0));
	i2: inverter port map(buf1(1), inv(1));
	i3: inverter port map(buf1(2), inv(2));
	a1: and3 port map(inv(0), inv(1), inv(2), buf2);
	a2: and1 port map(valid, buf2, buf3);
	d1: dec2_4 port map(rd_wrb, buf3, en, output);
end structural;
