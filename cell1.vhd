library ieee;
use ieee.std_logic_1164.all;
entity cell1 is
	port(	row_select: in std_logic;
		column_select: in std_logic;
		write_enable: in std_logic;
		input: in std_logic_vector(7 downto 0);
		rs: in std_logic;
		output: out std_logic_vector(7 downto 0));
end cell1;
architecture structural of cell1 is
component cell
	port(	write_data: in std_logic;
                write_enable: in std_logic;
                read_enable: in std_logic;
                read_enableb: in std_logic;
                read_data: out std_logic);
end component;
component and3
	port(	input1, input2, input3: in std_logic;
		output: out std_logic);
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
for all: and3 use entity work.and3(structural);
for all: cell use entity work.cell(structural);
for all: inverter use entity work.inverter(structural);
signal buf1, buf2, buf2b: std_logic;
begin
	a1: and3 port map(row_select, column_select, write_enable, buf1);
	a2: and3 port map(row_select, column_select, rs, buf2);
	i1: inverter port map(buf2, buf2b);
	c1: cell port map(input(0), buf1, buf2, buf2b, output(0));
	c2: cell port map(input(1), buf1, buf2, buf2b, output(1));
	c3: cell port map(input(2), buf1, buf2, buf2b, output(2));
	c4: cell port map(input(3), buf1, buf2, buf2b, output(3));
	c5: cell port map(input(4), buf1, buf2, buf2b, output(4));
	c6: cell port map(input(5), buf1, buf2, buf2b, output(5));
	c7: cell port map(input(6), buf1, buf2, buf2b, output(6));
	c8: cell port map(input(7), buf1, buf2, buf2b, output(7));
end structural;
