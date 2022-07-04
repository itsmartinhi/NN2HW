LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY MULTIPLIER_TB IS
END MULTIPLIER_TB;

ARCHITECTURE TESTBENCH OF MULTIPLIER_TB IS
    COMPONENT MULTIPLIER IS
        PORT (
            A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            S : OUT STD_LOGIC_VECTOR (10 DOWNTO 0));
    END COMPONENT;

    FOR SPEC : MULTIPLIER USE ENTITY WORK.MULTIPLIER(STRUCTURE);

    SIGNAL A : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B : STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');
    SIGNAL S : STD_LOGIC_VECTOR (10 DOWNTO 0) := (OTHERS => '0');
BEGIN
    SPEC : MULTIPLIER PORT MAP(A => A, B => B, S => S);

    PROCESS
        CONSTANT wait_time : TIME := 11623 ps;
        VARIABLE i_vec : STD_LOGIC_VECTOR(7 DOWNTO 0);
        VARIABLE u_vec : STD_LOGIC_VECTOR(2 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO 255 LOOP
            i_vec := STD_LOGIC_VECTOR(to_unsigned(i, 8));
            A <= i_vec(7 DOWNTO 0);
            FOR u IN 0 TO 7 LOOP
                u_vec := STD_LOGIC_VECTOR(to_unsigned(u, 3));
                B <= u_vec(2 DOWNTO 0);
                WAIT FOR wait_time;
                ASSERT S = STD_LOGIC_VECTOR(to_unsigned(u * i, 11)) REPORT "calculatetion false";
            END LOOP;
        END LOOP;

        ASSERT false REPORT "Simulation finished" SEVERITY note;
        WAIT;
    END PROCESS;

END ARCHITECTURE;