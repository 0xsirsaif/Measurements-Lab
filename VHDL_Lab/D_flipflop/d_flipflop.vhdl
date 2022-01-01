library ieee; use ieee.std_logic_1164.all;

entity d_flipflop is port(
    d, clk: in std_logic;
    q: out std_logic
);
end d_flipflop;

architecture synth of d_flipflop is
    begin
        process(clk) begin
            if clk' event and clk = '1' then
            -- if rising_edge(clk) then
                q <= d;
            end if;
        end process;
end synth; 