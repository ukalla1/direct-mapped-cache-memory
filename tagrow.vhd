library ieee;
use ieee.std_logic_1164.all;
entity tagrow is
	port(	row_select: in std_logic;
		tag_in: in std_logic_vector(2 downto 0);
		valid_in: in std_logic;
		write_enable: in std_logic;
		read_enable: in std_logic;
		reset: in std_logic;
		output: out std_logic_vector(3 downto 0));
end tagrow;
architecture structural of tagrow is
component cell
	port(	write_data: in std_logic;
                write_enable: in std_logic;
                read_enable: in std_logic;
                read_enableb: in std_logic;
                read_data: out std_logic);
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
component or1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
component and1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
for all: or1 use entity work.or1(structural);
for all: and1 use entity work.and1(structural);
for all: inverter use entity work.inverter(structural);
for all: cell use entity work.cell(structural);
signal buf1, buf2, inv1, inv2, buf3, buf4: std_logic;
begin
	a1: and1 port map(row_select, read_enable, buf1);
	a2: and1 port map(row_select, write_enable, buf2);
	i1: inverter port map(buf1, inv1);
	i2: inverter port map(reset, inv2);
	a3: and1 port map(valid_in, inv2, buf3);
	o1: or1 port map(reset, buf2, buf4);
	c1: cell port map(tag_in(0), write_enable, buf1, inv1, output(0));
	c2: cell port map(tag_in(1), write_enable, buf1, inv1, output(1));
	c3: cell port map(tag_in(2), write_enable, buf1, inv1, output(2));
	c4: cell port map(buf3, buf4, buf1, inv1, output(3));
end structural;
