library ieee; use ieee.std_logic_1164.all;

entity d_flipflop_tb is
end d_flipflop_tb;

architecture sim of d_flipflop_tb is
    component d_flipflop is port(
        d, clk: in std_logic;
        q: out std_logic
    );
    end component;
    
    signal clk, d, q: std_logic;
    
    begin
        DUT: d_flipflop port map(
            d => d,
            clk => clk,
            q => q
        );

        process begin
            clk <= '0'; d <= '0'; wait for 10 ns;
            d <= '1'; wait for 10 ns;

            clk <= '1'; d <= '0'; wait for 10 ns;
            d <= '1'; wait for 10 ns;

            wait; -- wait forever
        end process;
end sim;