LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY HALF_ADDER IS
  PORT (
    a, b : IN STD_LOGIC;
    sum, carry : OUT STD_LOGIC);
END HALF_ADDER;

-- ARCHITECTURE BEHAVIOR OF HALF_ADDER IS
-- BEGIN

--   PROCESS (a, b)
--     VARIABLE a2, b2, result : unsigned (1 DOWNTO 0);
--   BEGIN
--     a2 := '0' & a; -- extend 'a' to 2 bit
--     b2 := '0' & b; -- extend 'b' to 2 bit
--     result := a2 + b2; -- add them
--     sum <= result(0); -- output 'sum' = lower bit
--     carry <= result(1); -- output 'carry' = upper bit
--   END PROCESS;

-- END BEHAVIOR;

ARCHITECTURE DATAFLOW OF HALF_ADDER IS
BEGIN
  sum <= a XOR b;
  carry <= a AND b;
END DATAFLOW;

ARCHITECTURE STRUCTURE OF HALF_ADDER IS

  COMPONENT XOR2
    PORT (
      x, y : IN STD_LOGIC;
      z : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT AND2
    PORT (
      x, y : IN STD_LOGIC;
      z : OUT STD_LOGIC);
  END COMPONENT;

  -- for I0: XOR2 use entity WORK.XOR2(DATAFLOW);
  -- for I1: AND2 use entity WORK.AND2(DATAFLOW);

BEGIN
  I0 : XOR2 PORT MAP(x => a, y => b, z => sum);
  I1 : AND2 PORT MAP(x => a, y => b, z => carry);
END STRUCTURE;