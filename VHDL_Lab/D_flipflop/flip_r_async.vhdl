library ieee; use ieee.std_logic_1164.all;

entity flip_r_async is port(
    clk, reset: in std_logic;
    d: in std_logic_vector(3 downto 0);
    q: out std_logic_vector(3 downto 0)
);
end flip_r_async;

architecture async_ressetable of flip_r_async is
    begin
        process(clk, reset) begin
            if reset = '1' then
                q <= "0000";
            -- elsif clk' event and clk = '1' then
            elsif rising_edge(clk) then
                q <= d;
            end if;
        end process;
end async_ressetable;
