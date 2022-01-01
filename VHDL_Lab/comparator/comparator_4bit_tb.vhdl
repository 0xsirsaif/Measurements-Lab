library ieee; use ieee.std_logic_1164.all;

entity comparator_4bit_tb is
end comparator_4bit_tb;

architecture sim of comparator_4bit_tb is
    component comparator_4bit port(
        a, b: in std_logic_vector(3 downto 0);
        result: out std_logic
    );
    end component;  

    signal a, b: std_logic_vector(3 downto 0);
    signal result: std_logic;

    begin
        DUT: comparator_4bit port map(
            a => a,
            b => b,
            result => result
        );

        process begin
            a <= "0000"; b <= "0000"; wait for 1 ns;
            b <= "0001"; wait for 1 ns; 
            wait;
        end process;
    end sim;