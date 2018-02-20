library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use STD.textio.all;
use ieee.std_logic_arith.all;
entity counter1_test is

end counter1_test;
architecture test of counter1_test is
component counter1
	port(	d: in std_logic;
                clk: in std_logic;
                reset: in std_logic;
                busy: out std_logic;
                q: out std_logic_vector(18 downto 0));
end component;
for all: counter1 use entity work.counter1(structural);
signal d1, clk1, rst, busy1: std_logic;
signal q1: std_logic_vector(18 downto 0);
signal input: std_logic_vector(1 downto 0):= "11";
signal temp: std_logic_vector(1 downto 0):= "01";
procedure output is
	variable buf: line;
	begin
	write(buf, string'("input="));
	write(buf, d1);
	write(buf, string'("clk="));
	write(buf, clk1);
	write(buf, string'("reset="));
	write(buf, rst);
	write(buf, string'("busy="));
	write(buf, busy1);
	write(buf, string'("output="));
	write(buf, q1);
end output;
begin
	c1: counter1 port map(d1, clk1, rst, busy1, q1);
	input<= unsigned(input)+ unsigned'("01") after 4 ns;
	io_process: process
	begin
		for i in 0 to 31 loop
			wait for 2 ns;
			d1<= temp(0);
			rst<=temp(1);
			clk1<= input(0);
			wait for 2 ns;
			output;
		end loop;
	end process io_process;
end test;
