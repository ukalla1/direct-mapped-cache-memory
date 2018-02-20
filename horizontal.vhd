library ieee;
use ieee.std_logic_1164.all;
entity horizontal is
	port(	row_select: in std_logic;
		column_select: in std_logic_vector(3 downto 0);
		write_enable: in std_logic;
		input: in std_logic_vector(7 downto 0);
		rs: in std_logic;
		output: out std_logic_vector(7 downto 0));
end horizontal;
architecture structural of horizontal is
component cell1
	port(	row_select: in std_logic;
                column_select: in std_logic;
                write_enable: in std_logic;
                input: in std_logic_vector(7 downto 0);
		rs: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
for all: cell1 use entity work.cell1(structural);
begin
	c1: cell1 port map(row_select, column_select(0), write_enable, input, rs, output);
	c2: cell1 port map(row_select, column_select(1), write_enable, input, rs, output);
	c3: cell1 port map(row_select, column_select(2), write_enable, input, rs, output);
	c4: cell1 port map(row_select, column_select(3), write_enable, input, rs, output);
end structural;
