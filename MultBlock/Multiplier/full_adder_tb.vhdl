LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY FULL_ADDER_TB IS
END FULL_ADDER_TB;
ARCHITECTURE TESTBENCH1 OF FULL_ADDER_TB IS

    -- Component declaration...
    COMPONENT FULL_ADDER IS
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Configuration...
    FOR SPEC : FULL_ADDER USE ENTITY WORK.FULL_ADDER(BEHAVIOR);
    FOR IMPL : FULL_ADDER USE ENTITY WORK.FULL_ADDER(STRUCTURE);

    -- Internal signals...
    SIGNAL a, b, cin, sum_spec, carry_spec, sum_impl, carry_impl : STD_LOGIC;

BEGIN

    -- Instantiate full adder...
    SPEC : FULL_ADDER PORT MAP(a => a, b => b, cin => cin, sum => sum_spec, carry => carry_spec);
    IMPL : FULL_ADDER PORT MAP(a => a, b => b, cin => cin, sum => sum_impl, carry => carry_impl);

    --Main process...
    PROCESS
        CONSTANT wait_time : TIME := 8 ns;

    BEGIN
        a <= '0';
        b <= '0';
        cin <= '0';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '0';
        b <= '0';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=1)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '0';
        b <= '1';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=1, cin=0)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '0';
        b <= '1';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=1, cin=1)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '1';
        b <= '0';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=1, b=0, cin=0)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '1';
        b <= '0';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=1, b=0, cin=1)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '1';
        b <= '1';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=1, b=1, cin=0)";

        a <= 'X';
        b <= 'X';
        cin <= 'X';
        WAIT FOR wait_time;
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=0, b=0, cin=0)";

        a <= '1';
        b <= '1';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
        REPORT "Specification and implementation differ! (a=1, b=1, cin=1)";

        -- Print a note & finish simulation now
        ASSERT false REPORT "Simulation finished" SEVERITY note;
        WAIT; -- end simulation

    END PROCESS;
END ARCHITECTURE;

ARCHITECTURE TESTBENCH2 OF FULL_ADDER_TB IS

    -- Component declaration
    COMPONENT FULL_ADDER IS
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC);
    END COMPONENT;

    -- Configuration...
    FOR IMPL : FULL_ADDER USE ENTITY WORK.FULL_ADDER(BEHAVIOR);

    -- Internal signals...
    SIGNAL a, b, cin, sum, carry : STD_LOGIC;

BEGIN
    -- Instantiate half adder
    IMPL : FULL_ADDER PORT MAP(a => a, b => b, cin => cin, sum => sum, carry => carry);

    -- Main process...
    PROCESS
        CONSTANT wait_time : TIME := 8 ns;
    BEGIN
        a <= '0';
        b <= '0';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '0' AND carry = '0' REPORT "0 + 0 + 0 is not 0/0!";

        a <= '0';
        b <= '1';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '1' AND carry = '0' REPORT "0 + 1 + 0 is not 1/0!";

        a <= '1';
        b <= '0';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '1' AND carry = '0' REPORT "1 + 0 + 0 is not 1/0!";

        a <= '1';
        b <= '1';
        cin <= '0';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '0' AND carry = '1' REPORT "1 + 1 + 0 is not 0/1!";

        a <= '1';
        b <= '1';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '1' AND carry = '1' REPORT "1 + 1 + 1 is not 1/1!";

        a <= '0';
        b <= '1';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '0' AND carry = '1' REPORT "1 + 0 + 1 is not 0/1!";

        a <= '1';
        b <= '0';
        cin <= '1';
        WAIT FOR wait_time; -- wait a bit
        ASSERT sum = '0' AND carry = '1' REPORT "1 + 0 + 1 is not 1/1!";

        -- Print a note & finish simulation now
        ASSERT false REPORT "Simulation finished" SEVERITY note;
        WAIT; -- end simulation

    END PROCESS;

END ARCHITECTURE;