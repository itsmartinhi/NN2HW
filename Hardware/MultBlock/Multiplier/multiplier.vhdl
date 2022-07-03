LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MULTIPLIER IS
    PORT (
        A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR (10 DOWNTO 0));
END MULTIPLIER;

ARCHITECTURE STRUCTURE OF MULTIPLIER IS

    -- Full Adder 
    COMPONENT FULL_ADDER
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Half Adder 
    COMPONENT HALF_ADDER
        PORT (
            a, b : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT AND2
        PORT (
            x, y : IN STD_LOGIC;
            z : OUT STD_LOGIC);
    END COMPONENT;

    -- Intermediate declaration
    SIGNAL AB0, AB1, AB2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL C1, C2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL P1, P2 : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
    -- Multiplier input
    AND1 : and2 PORT MAP(A(0), B(0), S(0));
    AND2x : and2 PORT MAP(A(1), B(0), AB0(1));
    AND3 : and2 PORT MAP(A(2), B(0), AB0(2));
    AND4 : and2 PORT MAP(A(3), B(0), AB0(3));
    AND5 : and2 PORT MAP(A(4), B(0), AB0(4));
    AND6 : and2 PORT MAP(A(5), B(0), AB0(5));
    AND7 : and2 PORT MAP(A(6), B(0), AB0(6));
    AND8 : and2 PORT MAP(A(7), B(0), AB0(7));
    AND9 : and2 PORT MAP(A(0), B(1), AB1(0));
    AND10 : and2 PORT MAP(A(0), B(1), AB1(0));
    AND11 : and2 PORT MAP(A(1), B(1), AB1(1));
    AND12 : and2 PORT MAP(A(2), B(1), AB1(2));
    AND13 : and2 PORT MAP(A(3), B(1), AB1(3));
    AND14 : and2 PORT MAP(A(4), B(1), AB1(4));
    AND15 : and2 PORT MAP(A(5), B(1), AB1(5));
    AND16 : and2 PORT MAP(A(6), B(1), AB1(6));
    AND17 : and2 PORT MAP(A(7), B(1), AB1(7));
    AND18 : and2 PORT MAP(A(0), B(2), AB2(0));
    AND19 : and2 PORT MAP(A(1), B(2), AB2(1));
    AND20 : and2 PORT MAP(A(2), B(2), AB2(2));
    AND21 : and2 PORT MAP(A(3), B(2), AB2(3));
    AND22 : and2 PORT MAP(A(4), B(2), AB2(4));
    AND23 : and2 PORT MAP(A(5), B(2), AB2(5));
    AND24 : and2 PORT MAP(A(6), B(2), AB2(6));
    AND25 : and2 PORT MAP(A(7), B(2), AB2(7));

    -- Port  A(7), B(2)Mapping F, AB2(7)ull Adder 13 times and Half Adder 3 times
    -- FA1 : full_adder PORT MAP(AB0(2), AB1(1), C1(0), P1(1), C1(1));
    -- FA2 : full_adder PORT MAP(AB0(3), AB1(2), C1(1), P1(2), C1(2));
    -- FA3 : full_adder PORT MAP(AB0(4), AB1(3), C1(2), P1(3), C1(3));
    -- FA4 : full_adder PORT MAP(AB0(5), AB1(4), C1(3), P1(4), C1(4));
    -- FA5 : full_adder PORT MAP(AB0(6), AB1(5), C1(4), P1(5), C1(5));
    -- FA6 : full_adder PORT MAP(AB0(7), AB1(6), C1(5), P1(6), C1(6));

    -- FA7 : full_adder PORT MAP(AB2(1), P1(2), C2(0), P2(1), C2(1));
    -- FA8 : full_adder PORT MAP(AB2(2), P1(3), C2(1), P2(2), C2(2));
    -- FA9 : full_adder PORT MAP(AB2(3), P1(4), C2(2), P2(3), C2(3));
    -- FA10 : full_adder PORT MAP(AB2(4), P1(5), C2(3), P2(4), C2(4));
    -- FA11 : full_adder PORT MAP(AB2(5), P1(6), C2(4), P2(5), C2(5));
    -- FA12 : full_adder PORT MAP(AB2(6), P1(7), C2(5), P2(6), C2(6));
    -- FA13 : full_adder PORT MAP(AB2(7), C1(7), C2(6), P2(7), C2(7));

    -- HA1 : half_adder PORT MAP(AB0(1), AB1(0), P1(0), C1(0));
    -- HA2 : half_adder PORT MAP(AB1(7), C1(6), P1(7), C1(7));

    -- HA3 : half_adder PORT MAP(P1(1), AB2(0), P2(0), C2(0));

    -- Port mapping carry safe
    FA1 : full_adder PORT MAP(AB0(2), AB1(1), C1(0), P1(1), C1(1));
    FA2 : full_adder PORT MAP(AB0(3), AB1(2), C2(0), P1(2), C1(2));
    FA3 : full_adder PORT MAP(AB0(4), AB1(3), C2(1), P1(3), C1(3));
    FA4 : full_adder PORT MAP(AB0(5), AB1(4), C2(2), P1(4), C1(4));
    FA5 : full_adder PORT MAP(AB0(6), AB1(5), C2(3), P1(5), C1(5));
    FA6 : full_adder PORT MAP(AB0(7), AB1(6), C2(4), P1(6), C1(6));

    FA7 : full_adder PORT MAP(AB2(1), P1(2), C1(1), S(3), C2(1));
    FA8 : full_adder PORT MAP(AB2(2), P1(3), C1(2), S(4), C2(2));
    FA9 : full_adder PORT MAP(AB2(3), P1(4), C1(3), S(5), C2(3));
    FA10 : full_adder PORT MAP(AB2(4), P1(5), C1(4), S(6), C2(4));
    FA11 : full_adder PORT MAP(AB2(5), P1(6), C1(5), S(7), C2(5));
    FA12 : full_adder PORT MAP(AB2(6), P1(7), C1(6), S(8), C2(6));
    FA13 : full_adder PORT MAP(AB2(7), C1(7), C2(6), S(9), S(10));

    HA1 : half_adder PORT MAP(AB0(1), AB1(0), S(1), C1(0));
    HA2 : half_adder PORT MAP(AB1(7), C2(5), P1(7), C1(7));

    HA3 : half_adder PORT MAP(P1(1), AB2(0), S(2), C2(0));

    -- Mulitplier output
END STRUCTURE;