LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ElevenBitAdder IS
    PORT (
        a : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        s : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END ElevenBitAdder;

ARCHITECTURE Structure OF ElevenBitAdder IS
    COMPONENT FULL_ADDER
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT HALF_ADDER
        PORT (
            a, b : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL C : STD_LOGIC_VECTOR (10 DOWNTO 0);
BEGIN

    HA1 : HALF_ADDER PORT MAP(A(0), B(0), S(0), C(0));
    FA1 : FuLL_ADDER PORT MAP(A(1), B(1), C(0), S(1), C(1));
    FA2 : FuLL_ADDER PORT MAP(A(2), B(2), C(1), S(2), C(2));
    FA3 : FuLL_ADDER PORT MAP(A(3), B(3), C(2), S(3), C(3));
    FA4 : FuLL_ADDER PORT MAP(A(4), B(4), C(3), S(4), C(4));
    FA5 : FuLL_ADDER PORT MAP(A(5), B(5), C(4), S(5), C(5));
    FA6 : FuLL_ADDER PORT MAP(A(6), B(6), C(5), S(6), C(6));
    FA7 : FuLL_ADDER PORT MAP(A(7), B(7), C(6), S(7), C(7));
    FA8 : FuLL_ADDER PORT MAP(A(8), B(8), C(7), S(8), C(8));
    FA9 : FuLL_ADDER PORT MAP(A(9), B(9), C(8), S(9), C(9));
    FA10 : FuLL_ADDER PORT MAP(A(10), B(10), C(9), S(10), S(11));

END Structure;