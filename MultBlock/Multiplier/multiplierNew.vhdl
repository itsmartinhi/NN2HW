-- "11111111" = x * "111" = y

-- case 3 "1"
--     x shift 4  - 1
-- case 2 1 
-- 2 mal shift 
-- add +
-- case 1 
-- shift 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MULTIPLIER IS
    PORT (
        A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR (10 DOWNTO 0));
END MULTIPLIER;

ARCHITECTURE RTL OF MULTIPLIER IS
    SIGNAL test, test1, test2 : signed(10 DOWNTO 0);
    PROCESS (A, B)

        IF B(2 DOWNTO 2) = '1' THEN
            test <= shift_left(signed(A), 2);
        END IF;
        IF B(1 DOWNTO 1) = '1' THEN
            test2 <= shift_left(signed(A), 1);
        END IF;
        IF B(0 DOWNTO 0) = '1' THEN
            test3 <= A;
        END IF;
        s <= test + test2 + test3;
    END PROCESS;

END MULTIPLIER;