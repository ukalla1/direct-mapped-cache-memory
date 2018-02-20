library ieee;
library STD;
use ieee.std_logic_1164.all;
entity chip is
        port (  cpu_add    : in  std_logic_vector(7 downto 0);
                cpu_data   : inout  std_logic_vector(7 downto 0);
                cpu_rd_wrn : in  std_logic;
                start      : in  std_logic;
                clk        : in  std_logic;
                reset      : in  std_logic;
                mem_data   : in  std_logic_vector(7 downto 0);
                Vdd	   : in  std_logic;
		Gnd	   : in  std_logic;
		busy       : out std_logic;
                mem_en     : out std_logic;
                mem_add    : out std_logic_vector(7 downto 0));
end chip;
architecture structural of chip is
component latch1
	port(	data: in std_logic_vector(7 downto 0);
                clk: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
component same
	port(	 input: in std_logic;
                output: out std_logic);
end component;
component memory
	port(	row_select: in std_logic_vector(7 downto 0);
                column_select: in std_logic_vector(3 downto 0);
                write_enable: in std_logic;
                input: in std_logic_vector(7 downto 0);
                rs: in std_logic;
		output: out std_logic_vector(7 downto 0));
end component;
component dec2_4
	port(	input1, input2: in std_logic;
		en: in std_logic;
                output: out std_logic_vector(3 downto 0));
end component;
component dec8_3
	port(	input1, input2, input3: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
component enc4_2
	port(	input1, input2, input3: in std_logic;
                output1, output2: out std_logic);
end component;
component hit_missb
	port(	valid: in std_logic;
                address: in std_logic_vector(2 downto 0);
                tag: in std_logic_vector(2 downto 0);
                rd_wrb: in std_logic;
                en: in std_logic;
                output: out std_logic_vector(3 downto 0));
end component;
component mux8_1
	port(	input1: in std_logic_vector(7 downto 0);
                input2: in std_logic_vector(7 downto 0);
                sel: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
component txread
	port(	input: in std_logic_vector(7 downto 0);
                sel: in std_logic;
                output: out std_logic_vector(7 downto 0));
end component;
component counter1
	port(	d: in std_logic;
                clk: in std_logic;
                reset: in std_logic;
                busy: out std_logic;
                q: out std_logic_vector(18 downto 0));
end component;
component tag
	port(	row_select: in std_logic_vector(7 downto 0);
                tag_in: in std_logic_vector(2 downto 0);
                valid_in: in std_logic;
                write_enable: in std_logic;
                read_enable: in std_logic;
                reset: in std_logic;
                output: out std_logic_vector(3 downto 0));
end component;
component tiehigh
	port(	 output: out std_logic);
end component;
component tielow
	port(	output: out std_logic);
end component;
component inverter
	port(	input: in std_logic;
		output: out std_logic);
end component;
component or1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
component mux2_1
	port(	input1, input2, sel: in std_logic;
                output: out std_logic);
end component;
component Dlatch
	port(	d   : in  std_logic;
         	clk : in  std_logic;
         	q   : out std_logic;
         	qbar: out std_logic);
end component;
component and1
	port(	input1, input2: in std_logic;
		output: out std_logic);
end component;
for all: latch1 use entity work.latch1(structural);
for all: same use entity work. same(structural);
for all: memory use entity work.memory(structural);
for all: dec2_4 use entity work.dec2_4(structural);
for all: dec8_3 use entity work.dec8_3(structural);
for all: enc4_2 use entity work.enc4_2(structural);
for all: hit_missb use entity work.hit_missb(structural);
for all: mux8_1 use entity work.mux8_1(structural);
for all: mux2_1 use entity work.mux2_1(structural);
for all: txread use entity work.txread(structural);
for all: counter1 use entity work.counter1(structural);
for all: tag use entity work.tag(structural);
for all: tiehigh use entity work.tiehigh(structural);
for all: tielow use entity work.tielow(structural);
for all: and1 use entity work.and1(structural);
for all: or1 use entity work.or1(structural);
for all: inverter use entity work.inverter(structural);
for all: Dlatch use entity work.Dlatch(structural);
signal colsel, tvdata, rwhit_miss: std_logic_vector(3 downto 0);
signal rowsel, memory_out, memory_latch, cpu_add_latch, cpu_data_latch: std_logic_vector(7 downto 0);
signal counter_out: std_logic_vector(18 downto 0);
signal rw_latch, rw_latchb, wr, high, low: std_logic;
signal dec_temp1, dec_temp2, dec_sel, t_dd0, t_dd1, tm_dd0, tm_dd1, cache_en, output_enable: std_logic;
signal temprh, whwm, bwhwm, rhit_whitmiss, busy_reset, temp_reset, busyb, tb, sig1, tml: std_logic;
signal replace_sig, temp_mem_add: std_logic_vector(7 downto 0);
signal rms1, rms2, rms3, rms4, wcwh, temp_mem_en: std_logic;
begin
	c1: counter1 port map(sig1, clk, temp_reset, tb, counter_out);
	s1: same port map(tb, busy);
	t1: tiehigh port map(high);
	t2: tielow port map(low);
	e1: enc4_2 port map(rms2, rms3, rms4, tm_dd0, tm_dd1);
	o1: or1 port map(rms1, rms2, dec_temp1);
	o2: or1 port map(rms3, rms4, dec_temp2);
	o3: or1 port map(dec_temp1, dec_temp2, dec_sel);
	l1: latch1 port map(cpu_add, tml, cpu_add_latch);
	l2: latch1 port map(cpu_data, tml, cpu_data_latch);
	dl1: Dlatch port map(cpu_rd_wrn, tml, rw_latch, rw_latchb);
	m1: mux8_1 port map( cpu_data_latch, mem_data, dec_sel, replace_sig);
	m2: mux2_1 port map(cpu_add_latch(0), dec_sel, tm_dd0, t_dd0);
	m3: mux2_1 port map(cpu_add_latch(1), dec_sel, tm_dd1, t_dd1);
	d1: dec2_4 port map(t_dd0, t_dd1, high, colsel);
	d2: dec8_3 port map(cpu_add_latch(2), cpu_add_latch(3), cpu_add_latch(4), rowsel);
	t3: tag port map(rowsel, cpu_add_latch(7 downto 5), high, counter_out(7), high, reset, tvdata);
	h1: hit_missb port map(tvdata(3), cpu_add_latch(7 downto 5), tvdata(2 downto 0), rw_latch, high, rwhit_miss);
	a1: and1 port map(rwhit_miss(1), counter_out(1), temp_mem_en);
	s2: same port map(temp_mem_en, mem_en);
	o4: or1 port map(counter_out(8), counter_out(9), rms1);
	o5: or1 port map(counter_out(10), counter_out(11), rms2);
	o6: or1 port map(counter_out(12), counter_out(13), rms3);
	o7: or1 port map(counter_out(14), counter_out(15), rms4);
	s3: same port map(low, temp_mem_add(0));
	s4: same port map(low, temp_mem_add(1));
	s5: same port map(cpu_add_latch(2), temp_mem_add(2));
	s6: same port map(cpu_add_latch(3), temp_mem_add(3));
 	s7: same port map(cpu_add_latch(4), temp_mem_add(4));
 	s8: same port map(cpu_add_latch(5), temp_mem_add(5));
 	s9: same port map(cpu_add_latch(6), temp_mem_add(6));
 	s10: same port map(cpu_add_latch(7), temp_mem_add(7));
	a2: and1 port map(rwhit_miss(2), counter_out(2), wcwh);
	o8: or1 port map(wcwh, dec_sel, cache_en);
	mem1: memory port map(rowsel, colsel, cache_en, replace_sig, rwhit_miss(0), memory_out);
	l3: latch1 port map(memory_out, busyb, memory_latch);
	t4: txread port map(memory_latch, busyb, cpu_data);
	t5: txread port map(temp_mem_add, temp_mem_en, mem_add);
	o9: or1 port map(rwhit_miss(2), rwhit_miss(3), whwm);
	a3: and1 port map(rwhit_miss(0), counter_out(1), temprh);
	a4: and1 port map(whwm, counter_out(2), bwhwm);
	o10: or1 port map(rhit_whitmiss, counter_out(18), busy_reset);
	o11: or1 port map(temprh, bwhwm, rhit_whitmiss);
	o12: or1 port map(reset, busy_reset, temp_reset);
	i1: inverter port map(tb, busyb);
	a5: and1 port map(start, busyb, sig1);
	a6: and1 port map(sig1, counter_out(0), tml);
end structural;
