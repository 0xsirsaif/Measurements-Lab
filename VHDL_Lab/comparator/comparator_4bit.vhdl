library ieee; use ieee.std_logic_1164.all;

entity comparator_4bit is port(
    a, b: in std_logic_vector(3 downto 0);
    result: out std_logic
);
end comparator_4bit;

architecture synth of comparator_4bit is
    begin
        result <= '1' when (a=b) else '0';
end synth;