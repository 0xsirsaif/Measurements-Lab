library ieee; use ieee.std_logic_1164.all;

entity flip_r_sync is port(
    clk, reset: in std_logic;
    d: in std_logic_vector(3 downto 0);
    q: out std_logic_vector(3 downto 0)
);
end flip_r_sync;

architecture sync_ressetable of flip_r_sync is
    begin
        process(clk) begin
            if rising_edge(clk) then
                if reset = '1' then
                    q <= "0000";
                else q <= d;
                end if;
            end if;
        end process;
end sync_ressetable;
