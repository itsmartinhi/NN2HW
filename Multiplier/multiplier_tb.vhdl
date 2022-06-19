LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY multiplier_tb IS
END multiplier_tb;

ARCHITECTURE Testbench OF multiplier_tb IS
    COMPONENT multiplier IS
        PORT (
            A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            S : OUT STD_LOGIC_VECTOR (10 DOWNTO 0));
    END COMPONENT;

    FOR SPEC : multiplier USE ENTITY WORK.multiplier(Behavioral);

    SIGNAL A : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B : STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');
    SIGNAL S : STD_LOGIC_VECTOR (10 DOWNTO 0) := (OTHERS => '0');

BEGIN

    SPEC : multiplier PORT MAP(A => A, B => B, S => S);

    PROCESS
        CONSTANT wait_time : TIME := 100 ns;

    BEGIN
        A <= "00000000";
        B <= "110";
        WAIT FOR wait_time;
        ASSERT S = "00000000000" REPORT "00000000 *  110 is not 000000000000";

        A <= "10000000";
        B <= "110";
        WAIT FOR wait_time;
        ASSERT S = "01100000000" REPORT "10000000 *  110 is not 110000000000";

        A <= "00000001";
        B <= "110";
        WAIT FOR wait_time;
        ASSERT S = "00000000110" REPORT "00000001 *  110 is not 000000000110";

        A <= "11111111";
        B <= "001";
        WAIT FOR wait_time;
        ASSERT S = "00011111111" REPORT "111111111 *  001 is not 11111111111";

        ASSERT false REPORT "Simulation finished" SEVERITY note;
        WAIT;
    END PROCESS;

END ARCHITECTURE;