library ieee; use ieee.std_logic_1164.all;

entity mux_1_tb is 
end mux_1_tb;

architecture sim of mux_1_tb is
    component mux_1 port(
        a, b: in std_logic;
        s1: in std_logic;
        c: out std_logic
    );
    end component;

    signal a, b, s1, c: std_logic;

    begin
        DUT: mux_1 port map(
            a => a,
            b => b,
            s1 => s1,
            c => c
        );

        process begin
            s1 <= '0'; a <= '0'; b <= '0'; wait for 1 ns;
            b <= '1'; wait for 1 ns;

            s1 <= '0'; a <= '1'; b <= '0'; wait for 1 ns;
            b <= '1'; wait for 1 ns;

            s1 <= '1'; a <= '1'; b <= '0'; wait for 1 ns;
            b <= '1'; wait for 1 ns;

            wait;
        end process;
end sim;