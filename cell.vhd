library ieee;
use ieee.std_logic_1164.all;
entity cell is
	port(	write_data: in std_logic;
		write_enable: in std_logic;
		read_enable: in std_logic;
		read_enableb: in std_logic;
		read_data: out std_logic);
end cell;
architecture structural of cell is
component Dlatch
	port(	d: in std_logic;
		clk: in std_logic;
		q: out std_logic;
		qbar: out std_logic);
end component;
component tx
	port (	sel: in std_logic;
		selnot: in std_logic;
		input: in std_logic;
		output: out std_logic);
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
for all: Dlatch use entity work.Dlatch(structural);
for all: tx use entity work.tx(structural);
signal buff1, buff1_bar: std_logic;
begin
	d1: Dlatch port map(write_data, write_enable, buff1, buff1_bar);
	t1: tx port map(read_enable, read_enableb, buff1, read_data);
end structural;
