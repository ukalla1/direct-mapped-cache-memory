library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
entity memory_test is

end memory_test;
architecture test of memory_test is 
component memory
	port(	row_select: in std_logic_vector(7 downto 0);
                column_select: in std_logic_vector(3 downto 0);
                write_enable: in std_logic;
                input: in std_logic_vector(7 downto 0);
                rs: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
for all: memory use entity work.memory(structural);
signal r_sel, in1, out1: std_logic_vector(7 downto 0);
signal rs1, clock, wen: std_logic;
signal c_sel: std_logic_vector(3 downto 0);
begin
m1: memory port map(r_sel, c_sel, wen, in1, rs1, out1);
	clk: process 
	begin
		clock<= '0','1' after 5 ns;
		wait for 10 ns;
	end process clk;
	io_process: process
	file infile: text is in "memory_in.txt";
	file outfile: text is out "memory_out.txt";
	variable r_sel1, in2, out2: std_logic_vector(7 downto 0);
	variable rs2, wen1: std_logic;
	variable c_sel1: std_logic_vector(3 downto 0);
	variable buf: line;
	begin
		while not(endfile(infile)) loop
			readline (infile, buf);
			read(buf, r_sel1);
			r_sel<= r_sel1;
			readline(infile, buf);
			read(buf, c_sel1);
			c_sel<= c_sel1;
			readline(infile, buf);
			read(buf, in2);
			in1<= in2;
			readline(infile, buf);
			read(buf, rs2);
			rs1<= rs2;
			readline(infile, buf);
			read(buf, wen1);
			wen<= wen1;
		wait until falling_edge(clock);
		out2:= out1;
		write( buf, out2);
		writeline(outfile, buf);
		end loop;
	end process io_process;
end test;
