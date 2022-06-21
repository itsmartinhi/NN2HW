LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY HALF_ADDER_TB IS
END HALF_ADDER_TB;
ARCHITECTURE TESTBENCH2 OF HALF_ADDER_TB IS

  -- Component declaration...
  COMPONENT HALF_ADDER IS
    PORT (
      a, b : IN STD_LOGIC;
      sum, carry : OUT STD_LOGIC);
  END COMPONENT;

  -- Configuration...
  FOR SPEC : HALF_ADDER USE ENTITY WORK.HALF_ADDER(DATAFLOW);
  FOR IMPL : HALF_ADDER USE ENTITY WORK.HALF_ADDER(STRUCTURE);

  -- Internal signals...
  SIGNAL a, b, sum_spec, carry_spec, sum_impl, carry_impl : STD_LOGIC;

BEGIN

  -- Instantiate half adder...
  SPEC : HALF_ADDER PORT MAP(a => a, b => b, sum => sum_spec, carry => carry_spec);
  IMPL : HALF_ADDER PORT MAP(a => a, b => b, sum => sum_impl, carry => carry_impl);

  -- Main process...
  PROCESS
  BEGIN
    a <= '0';
    b <= '0';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
    REPORT "Specification and implementation differ! (a=0, b=0)";

    a <= '0';
    b <= '1';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
    REPORT "Specification and implementation differ! (a=0, b=1)";

    a <= '1';
    b <= '0';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
    REPORT "Specification and implementation differ! (a=1, b=0)";

    a <= '1';
    b <= '1';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum_spec = sum_impl AND carry_spec = carry_impl
    REPORT "Specification and implementation differ! (a=1, b=1)";

    -- Print a note & finish simulation now
    ASSERT false REPORT "Simulation finished" SEVERITY note;
    WAIT; -- end simulation

  END PROCESS;

END ARCHITECTURE;
ARCHITECTURE TESTBENCH1 OF HALF_ADDER_TB IS

  -- Component declaration
  COMPONENT HALF_ADDER IS
    PORT (
      a, b : IN STD_LOGIC;
      sum, carry : OUT STD_LOGIC);
  END COMPONENT;

  -- Configuration...
  FOR IMPL : HALF_ADDER USE ENTITY WORK.HALF_ADDER(BEHAVIOR);

  -- Internal signals...
  SIGNAL a, b, sum, carry : STD_LOGIC;

BEGIN

  -- Instantiate half adder
  IMPL : HALF_ADDER PORT MAP(a => a, b => b, sum => sum, carry => carry);

  -- Main process...
  PROCESS
  BEGIN
    a <= '0';
    b <= '0';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum = '0' AND carry = '0' REPORT "0 + 0 is not 0/0!";

    a <= '0';
    b <= '1';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum = '1' AND carry = '0' REPORT "0 + 1 is not 1/0!";

    a <= '1';
    b <= '0';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum = '1' AND carry = '0' REPORT "1 + 0 is not 1/0!";

    a <= '1';
    b <= '1';
    WAIT FOR 1 ns; -- wait a bit
    ASSERT sum = '0' AND carry = '1' REPORT "1 + 1 is not 0/1!";

    -- Print a note & finish simulation now
    ASSERT false REPORT "Simulation finished" SEVERITY note;
    WAIT; -- end simulation

  END PROCESS;

END ARCHITECTURE;