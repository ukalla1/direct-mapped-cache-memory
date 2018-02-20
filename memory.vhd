library ieee;
use ieee.std_logic_1164.all;
entity memory is
	port(	row_select: in std_logic_vector(7 downto 0);
		column_select: in std_logic_vector(3 downto 0);
		write_enable: in std_logic;
		input: in std_logic_vector(7 downto 0);
		rs: in std_logic;
		output: out std_logic_vector(7 downto 0));
end memory;
architecture structural of memory is
component horizontal
	port(	row_select: in std_logic;
                column_select: in std_logic_vector(3 downto 0);
                write_enable: in std_logic;
                input: in std_logic_vector(7 downto 0);
		rs: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
for all: horizontal use entity work.horizontal(structural);
begin
	h1: horizontal port map(row_select(0), column_select, write_enable, input, rs, output);
	h2: horizontal port map(row_select(1), column_select, write_enable, input, rs,output);
	h3: horizontal port map(row_select(2), column_select, write_enable, input, rs, output);
	h4: horizontal port map(row_select(3), column_select, write_enable, input, rs, output);
	h5: horizontal port map(row_select(4), column_select, write_enable, input, rs, output);
	h6: horizontal port map(row_select(5), column_select, write_enable, input, rs, output);
	h7: horizontal port map(row_select(6), column_select, write_enable, input, rs, output);
	h8: horizontal port map(row_select(7), column_select, write_enable, input, rs, output);
end structural;
