library ieee;
use ieee.std_logic_1164.all;

entity circuit_1 is port(
    z: out std_logic;
    a, b, c: in std_logic
);
end circuit_1;

architecture circuit_1_arch of circuit_1 is 
begin
    z <= (((a and b) or (not c)) nand a);
end circuit_1_arch;


