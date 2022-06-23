LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MULTIPLIER IS
    PORT (
        A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR (10 DOWNTO 0));
END MULTIPLIER;

ARCHITECTURE BEHAVOR OF MULTIPLIER IS

    -- Full Adder 
    COMPONENT FULL_ADDER IS
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Half Adder 
    COMPONENT HALF_ADDER IS
        PORT (
            a, b : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC);
    END COMPONENT;

    -- Intermediate declaration
    SIGNAL AB0, AB1, AB2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL C1, C2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL P1, P2 : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
    -- Multiplier input
    AB0(0) <= A(0) AND B(0);
    AB0(1) <= A(1) AND B(0);
    AB0(2) <= A(2) AND B(0);
    AB0(3) <= A(3) AND B(0);
    AB0(4) <= A(4) AND B(0);
    AB0(5) <= A(5) AND B(0);
    AB0(6) <= A(6) AND B(0);
    AB0(7) <= A(7) AND B(0);

    AB1(0) <= A(0) AND B(1);
    AB1(1) <= A(1) AND B(1);
    AB1(2) <= A(2) AND B(1);
    AB1(3) <= A(3) AND B(1);
    AB1(4) <= A(4) AND B(1);
    AB1(5) <= A(5) AND B(1);
    AB1(6) <= A(6) AND B(1);
    AB1(7) <= A(7) AND B(1);

    AB2(0) <= A(0) AND B(2);
    AB2(1) <= A(1) AND B(2);
    AB2(2) <= A(2) AND B(2);
    AB2(3) <= A(3) AND B(2);
    AB2(4) <= A(4) AND B(2);
    AB2(5) <= A(5) AND B(2);
    AB2(6) <= A(6) AND B(2);
    AB2(7) <= A(7) AND B(2);

    -- Port Mapping Full Adder 13 times and Half Adder 3 times
    FA1 : full_adder PORT MAP(AB0(2), AB1(1), C1(0), P1(1), C1(1));
    FA2 : full_adder PORT MAP(AB0(3), AB1(2), C1(1), P1(2), C1(2));
    FA3 : full_adder PORT MAP(AB0(4), AB1(3), C1(2), P1(3), C1(3));
    FA4 : full_adder PORT MAP(AB0(5), AB1(4), C1(3), P1(4), C1(4));
    FA5 : full_adder PORT MAP(AB0(6), AB1(5), C1(4), P1(5), C1(5));
    FA6 : full_adder PORT MAP(AB0(7), AB1(6), C1(5), P1(6), C1(6));

    FA7 : full_adder PORT MAP(AB2(1), P1(2), C2(0), P2(1), C2(1));
    FA8 : full_adder PORT MAP(AB2(2), P1(3), C2(1), P2(2), C2(2));
    FA9 : full_adder PORT MAP(AB2(3), P1(4), C2(2), P2(3), C2(3));
    FA10 : full_adder PORT MAP(AB2(4), P1(5), C2(3), P2(4), C2(4));
    FA11 : full_adder PORT MAP(AB2(5), P1(6), C2(4), P2(5), C2(5));
    FA12 : full_adder PORT MAP(AB2(6), P1(7), C2(5), P2(6), C2(6));
    FA13 : full_adder PORT MAP(AB2(7), C1(7), C2(6), P2(7), C2(7));

    HA1 : half_adder PORT MAP(AB0(1), AB1(0), P1(0), C1(0));
    HA2 : half_adder PORT MAP(AB1(7), C1(6), P1(7), C1(7));

    HA3 : half_adder PORT MAP(P1(1), AB2(0), P2(0), C2(0));

    -- Mulitplier output
    S(0) <= AB0(0);
    S(1) <= P1(0);
    S(2) <= P2(0);
    S(3) <= P2(1);
    S(4) <= P2(2);
    S(5) <= P2(3);
    S(6) <= P2(4);
    S(7) <= P2(5);
    S(8) <= P2(6);
    S(9) <= P2(7);
    S(10) <= C2(7);

END BEHAVOR;
