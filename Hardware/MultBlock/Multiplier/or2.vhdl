LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY OR2 IS
    PORT (
        x, y : IN STD_LOGIC;
        z : OUT STD_LOGIC);
END OR2;

ARCHITECTURE DATAFLOW OF OR2 IS
BEGIN
    z <= x OR y AFTER 3 ns;
END ARCHITECTURE;