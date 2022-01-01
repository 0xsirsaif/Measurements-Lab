library ieee; use ieee.std_logic_1164.all;

entity mux_1 is port(
    a, b: in std_logic;
    s1: in std_logic;
    c: out std_logic
);
end mux_1;

architecture synth of mux_1 is
    begin
        process(a, b, s1) begin
            if s1 = '0' then
                c <= a;
            elsif s1 ='1' then
                c <= b;
            end if;
        end process;
end synth;