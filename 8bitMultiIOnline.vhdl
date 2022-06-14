--
--
--  Implementation of an 8 bit by 8 bit multiplier
--
--
--  File name: multiplier.vhdl
--
--
--	Ports:
--	  X, Y	inputs of type bit_vector( 7 downto 0 ) 
--		    These lines contain the two input values of eight
--		    bits each.  The assumption is that these are
--		    positive numbers, so that this ends up being an
--		    unsigned binary multiplication
--	  F     output of type bit_vector( 15 downto 0 )
--		    The output needs to be sufficiently large to enable
--		    the full multiplication to be represented.
--
--	Note that the assumption here is a combinational multiplier.
--	If the implementation is to extend to a clocked sequential
--	implementation, then input clocks are needed, and an output
--	clock could also be represented.

LIBRARY USER;
USE USER.MULT_PKG.ALL;
USE USER.ALL;

ENTITY MULTIPLIER IS

    PORT (
        X, Y : IN bit_vector (7 DOWNTO 0);
        F : OUT bit_vector (15 DOWNTO 0));

END MULTIPLIER;

ARCHITECTURE ALGORITHMIC OF MULTIPLIER IS
BEGIN

    PROCESS (X, Y)
        VARIABLE X_VAL, Y_VAL, F_VAL : INTEGER;
        VARIABLE F_BITS : bit_vector (15 DOWNTO 0);
    BEGIN
        X_VAL := INTVAL (X);
        Y_VAL := INTVAL (Y);
        F_VAL := X_VAL * Y_VAL;
        F_BITS := INT_TO_BITV (F_VAL, 16);
        F <= F_BITS;
    END PROCESS;

END ALGORITHMIC;

ARCHITECTURE SHIFT_N_ADD OF MULTIPLIER IS
BEGIN
    PROCESS (X, Y)
        VARIABLE X_VAL, Y_VAL, F_VAL : INTEGER;
        VARIABLE F_BITS : bit_vector (15 DOWNTO 0);
    BEGIN
        X_VAL := INTVAL (X);
        Y_VAL := INTVAL (Y);
        F_VAL := 0;
        FOR N IN 0 TO 7 LOOP
            IF (Y_VAL MOD 2) = 1 THEN
                F_VAL := F_VAL + X_VAL;
            END IF;
            X_VAL := X_VAL * 2;
            Y_VAL := Y_VAL / 2;
        END LOOP;
        F_BITS := INT_TO_BITV (F_VAL, 16);
        F <= F_BITS;
    END PROCESS;
END SHIFT_N_ADD;

ARCHITECTURE SORT_OF_EQNS OF MULTIPLIER IS
BEGIN
    PROCESS (X, Y)
        VARIABLE F_BITS : bit_vector (15 DOWNTO 0);
        VARIABLE ROW0, ROW1, ROW2, ROW3,
        ROW4, ROW5, ROW6, ROW7 : bit_vector (7 DOWNTO 0);
        VARIABLE PSUM0, PSUM1, PSUM2, PSUM3,
        PSUM4, PSUM5, PSUM6 : bit_vector (8 DOWNTO 0);
        VARIABLE tvec : bit_vector (7 DOWNTO 0);
        VARIABLE tbit0, tbit1, tbit2, tbit3 : BIT;
    BEGIN
        tvec := X;
        tbit0 := Y(0);
        tbit1 := Y(1);
        tbit2 := Y(2);
        tbit3 := Y(3);
        ROW0 := ROW_MAKER (X, Y(0));
        ROW1 := ROW_MAKER (X, Y(1));
        ROW2 := ROW_MAKER (X, Y(2));
        ROW3 := ROW_MAKER (X, Y(3));
        ROW4 := ROW_MAKER (X, Y(4));
        ROW5 := ROW_MAKER (X, Y(5));
        ROW6 := ROW_MAKER (X, Y(6));
        ROW7 := ROW_MAKER (X, Y(7));

        F_BITS(0) := ROW0(0);

        PSUM0 := ADD89 ('0' & ROW0(7 DOWNTO 1), ROW1);

        F_BITS(1) := PSUM0(0);

        PSUM1 := ADD89 (PSUM0(8 DOWNTO 1), ROW2);

        F_BITS(2) := PSUM1(0);

        PSUM2 := ADD89 (PSUM1(8 DOWNTO 1), ROW3);

        F_BITS(3) := PSUM2(0);

        PSUM3 := ADD89 (PSUM2(8 DOWNTO 1), ROW4);

        F_BITS(4) := PSUM3(0);

        PSUM4 := ADD89 (PSUM3(8 DOWNTO 1), ROW5);

        F_BITS(5) := PSUM4(0);

        PSUM5 := ADD89 (PSUM4(8 DOWNTO 1), ROW6);

        F_BITS(6) := PSUM5(0);

        PSUM6 := ADD89 (PSUM5(8 DOWNTO 1), ROW7);

        F_BITS(15 DOWNTO 7) := PSUM6;

        F <= F_BITS;

    END PROCESS;
END SORT_OF_EQNS;

ARCHITECTURE WITH_STRUCTURE OF MULTIPLIER IS
    COMPONENT ROW_ELEMENT
        PORT (
            X : IN bit_vector (7 DOWNTO 0);
            Y_BIT : IN BIT;
            F : OUT bit_vector (7 DOWNTO 0));
    END COMPONENT;
    COMPONENT ADDER_8
        PORT (
            A_VEC, B_VEC : IN bit_vector (7 DOWNTO 0);
            Cin : IN BIT;
            Cout : OUT BIT;
            F_VEC : OUT bit_vector (7 DOWNTO 0));
    END COMPONENT;

    FOR ALL : ROW_ELEMENT USE ENTITY ROW_ELT (SIMPLE);
    FOR ALL : ADDER_8 USE ENTITY ADDER8 (RIPPLE);

    SIGNAL ROW0, ROW1, ROW2, ROW3,
    ROW4, ROW5, ROW6, ROW7 : bit_vector (7 DOWNTO 0);
    SIGNAL PSUM0, PSUM1, PSUM2, PSUM3, PSUM4,
    PSUM5, PSUM6, PSUM7 : bit_vector (7 DOWNTO 0);
    SIGNAL CRY0, CRY1, CRY2, CRY3, CRY4, CRY5, CRY6, CRY7 : BIT;
    SIGNAL ADDIN1, ADDIN2, ADDIN3, ADDIN4,
    ADDIN5, ADDIN6, ADDIN7 : bit_vector (7 DOWNTO 0);
    SIGNAL GND : BIT;

BEGIN

    GND <= '0';
    R0 : ROW_ELEMENT
    PORT MAP(X, Y(0), ROW0);
    R1 : ROW_ELEMENT
    PORT MAP(X, Y(1), ROW1);
    R2 : ROW_ELEMENT
    PORT MAP(X, Y(2), ROW2);
    R3 : ROW_ELEMENT
    PORT MAP(X, Y(3), ROW3);
    R4 : ROW_ELEMENT
    PORT MAP(X, Y(4), ROW4);
    R5 : ROW_ELEMENT
    PORT MAP(X, Y(5), ROW5);
    R6 : ROW_ELEMENT
    PORT MAP(X, Y(6), ROW6);
    R7 : ROW_ELEMENT
    PORT MAP(X, Y(7), ROW7);
    ADDIN1 <= GND & ROW0 (7 DOWNTO 1);
    ADDIN2 <= GND & PSUM1 (7 DOWNTO 1);
    ADDIN3 <= GND & PSUM2 (7 DOWNTO 1);
    ADDIN4 <= GND & PSUM3 (7 DOWNTO 1);
    ADDIN5 <= GND & PSUM4 (7 DOWNTO 1);
    ADDIN6 <= GND & PSUM5 (7 DOWNTO 1);
    ADDIN7 <= GND & PSUM6 (7 DOWNTO 1);

    A1 : ADDER_8
    PORT MAP(ROW1, ADDIN1, GND, CRY1, PSUM1);
    A2 : ADDER_8
    PORT MAP(ROW2, ADDIN2, GND, CRY2, PSUM2);
    A3 : ADDER_8
    PORT MAP(ROW3, ADDIN3, GND, CRY3, PSUM3);
    A4 : ADDER_8
    PORT MAP(ROW4, ADDIN4, GND, CRY4, PSUM4);
    A5 : ADDER_8
    PORT MAP(ROW5, ADDIN5, GND, CRY5, PSUM5);
    A6 : ADDER_8
    PORT MAP(ROW6, ADDIN6, GND, CRY6, PSUM6);
    A7 : ADDER_8
    PORT MAP(ROW7, ADDIN7, GND, CRY7, PSUM7);

    F(0) <= ROW0(0);
    F(1) <= PSUM1(0);
    F(2) <= PSUM2(0);
    F(3) <= PSUM3(0);
    F(4) <= PSUM4(0);
    F(5) <= PSUM5(0);
    F(6) <= PSUM6(0);
    F(14 DOWNTO 7) <= PSUM7;
    F(15) <= CRY7;

END WITH_STRUCTURE;