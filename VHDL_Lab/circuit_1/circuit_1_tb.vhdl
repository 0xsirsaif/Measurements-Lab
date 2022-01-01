library ieee; use ieee.std_logic_1164.all;

-- same file name, no input/output
entity circuit_1_tb is
end circuit_1_tb;

architecture sim of circuit_1_tb is
    -- component name is the same as entity name.
    component circuit_1 port(
        z: out std_logic;
        a, b, c: in std_logic
    );
    end component;

    signal a, b, c, z : std_logic;
    
    begin
        -- inistantiate Device Under Test (DUT)
        DUT : circuit_1 port map (
            a => a,
            b => b,
            c => c,
            z => z
        );
        -- apply inputs one at a time.
        process begin
            a <= '0'; b <= '0'; c <= '0'; wait for 1 ns;
            c <= '1';                     wait for 1 ns;
            
            a <= '0'; b <= '1'; c <= '0'; wait for 1 ns;
            c <= '1';                     wait for 1 ns;
            
            a <= '1'; b <= '0'; c <= '0'; wait for 1 ns;
            c <= '1';                     wait for 1 ns;
            
            a <= '1'; b <= '1'; c <= '0'; wait for 1 ns;
            c <= '1';                     wait for 1 ns;
            
            wait; -- wait forever
        end process;
    end sim;
        