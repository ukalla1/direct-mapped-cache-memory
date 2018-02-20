library ieee;
use ieee.std_logic_1164.all;
entity tag is
	port(	row_select: in std_logic_vector(7 downto 0);
		tag_in: in std_logic_vector(2 downto 0);
		valid_in: in std_logic;
		write_enable: in std_logic;
		read_enable: in std_logic;
		reset: in std_logic;
		output: out std_logic_vector(3 downto 0));
end tag;
architecture structural of tag is
component tagrow
	port(	row_select: in std_logic;
                tag_in: in std_logic_vector(2 downto 0);
                valid_in: in std_logic;
                write_enable: in std_logic;
                read_enable: in std_logic;
                reset: in std_logic;
                output: out std_logic_vector(3 downto 0));
end component;
for all: tagrow use entity work.tagrow(structural);
begin
	t1: tagrow port map(row_select(0), tag_in, valid_in, write_enable, read_enable, reset, output);
	t2: tagrow port map(row_select(1), tag_in, valid_in, write_enable, read_enable, reset, output);
	t3: tagrow port map(row_select(2), tag_in, valid_in, write_enable, read_enable, reset, output);
	t4: tagrow port map(row_select(3), tag_in, valid_in, write_enable, read_enable, reset, output);
	t5: tagrow port map(row_select(4), tag_in, valid_in, write_enable, read_enable, reset, output);
	t6: tagrow port map(row_select(5), tag_in, valid_in, write_enable, read_enable, reset, output);
	t7: tagrow port map(row_select(6), tag_in, valid_in, write_enable, read_enable, reset, output);
	t8: tagrow port map(row_select(7), tag_in, valid_in, write_enable, read_enable, reset, output);
end structural;
