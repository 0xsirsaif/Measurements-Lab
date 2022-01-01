library ieee; use ieee.std_logic_1164.all;

entity seven_segment_tb is
end seven_segment_tb;

architecture sim of seven_segment is
    begin
        process(data) begin
            --                          "abcdefg"
            case data is
                when X"0" => segment <= "1111110";
                when X"1" => segment <= "0110000";
                when X"2" => segment <= "1100101";
                when X"3" => segment <= "1111000";
                when X"4" => segment <= "0110011";
                when X"5" => segment <= "1001111";

                when X"6" => segment <= "1111110";
                when X"7" => segment <= "1111110";
                when X"8" => segment <= "1111110";
                when X"9" => segment <= "1111110";
                when others => segment <= "0000000";
            end case;
        end process;
end sim;