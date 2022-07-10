LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FULL_ADDER IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        Cin : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        carry : OUT STD_LOGIC);
END FULL_ADDER;

-- ARCHITECTURE BEHAVIOR OF FULL_ADDER IS
-- BEGIN
--     PROCESS (a, b, cin)
--         VARIABLE a2, b2, cin2, result : unsigned(1 DOWNTO 0);
--     BEGIN
--         a2 := '0' & a;
--         b2 := '0' & b;
--         cin2 := '0' & cin;
--         result := cin2 + a2 + b2;
--         sum <= result(0);
--         carry <= result(1);
--     END PROCESS;
-- END BEHAVIOR;

-- ARCHITECTURE DATAFLOW OF FULL_ADDER IS
-- BEGIN
--     sum <= a XOR b XOR cin;
--     carry <= (a AND b) OR (a AND b AND cin) OR (a AND cin);
-- END DATAFLOW;

ARCHITECTURE STRUCTURE OF FULL_ADDER IS
    COMPONENT HALF_ADDER
        PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            sum : OUT STD_LOGIC;
            carry : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT OR2
        PORT (
            x, y : IN STD_LOGIC;
            z : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL S1HA : STD_LOGIC;
    SIGNAL C1HA : STD_LOGIC;
    SIGNAL S2HA : STD_LOGIC;
    SIGNAL C2HA : STD_LOGIC;
    SIGNAL C1OR : STD_LOGIC;

BEGIN
    HA1 : HALF_ADDER PORT MAP(
        a => a,
        b => b,
        sum => S1HA,
        carry => C1HA
    );
    HA2 : HALF_ADDER PORT MAP(
        a => S1HA,
        b => Cin,
        sum => sum,
        carry => C2HA
    );
    OR1 : OR2 PORT MAP(x => C1HA, y => C2HA, z => carry);

END STRUCTURE;