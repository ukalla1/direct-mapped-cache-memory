library STD;
library ieee;
use ieee.std_logic_1164.all;
entity and1 is
        port (  input1 : in std_logic;
                input2 : in std_logic;
                output : out std_logic);
end and1;
architecture structural of and1 is
begin
        output <= input1 and input2;
end structural;

