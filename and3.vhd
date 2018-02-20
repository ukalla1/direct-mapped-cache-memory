library STD;
library ieee;
use ieee.std_logic_1164.all;
entity and3 is
        port (  input1, input2, input3: in std_logic;
                output : out std_logic);
end and3;
architecture structural of and3 is
begin
        output <= input1 and input2 and input3;
end structural;

