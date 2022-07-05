-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY inpdec_boom IS
PORT(
  reset	: IN STD_LOGIC;
  clk	: IN STD_LOGIC;
  c_input_dec	: IN STD_LOGIC;
  out_input_index	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  out_input_reset	: OUT STD_LOGIC
);
END inpdec_boom;

ARCHITECTURE RTL OF inpdec_boom IS
  SIGNAL rtlalc_5	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtlalc_4	: STD_LOGIC;
  SIGNAL rtlalc_3	: STD_LOGIC_VECTOR(5 DOWNTO 3);
  SIGNAL rtlalc_2	: STD_LOGIC_VECTOR(7 DOWNTO 6);
  SIGNAL rtlalc_1	: STD_LOGIC;
  SIGNAL count	: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL aux1	: STD_LOGIC;
  SIGNAL aux2	: STD_LOGIC;
  SIGNAL aux3	: STD_LOGIC;
  SIGNAL aux7	: STD_LOGIC;
  SIGNAL aux8	: STD_LOGIC;
  SIGNAL aux9	: STD_LOGIC;
  SIGNAL aux10	: STD_LOGIC;
  SIGNAL aux12	: STD_LOGIC;
  SIGNAL aux13	: STD_LOGIC;
  SIGNAL aux14	: STD_LOGIC;
  SIGNAL aux16	: STD_LOGIC;
  SIGNAL aux17	: STD_LOGIC;
  SIGNAL aux18	: STD_LOGIC;
  SIGNAL aux19	: STD_LOGIC;
  SIGNAL aux20	: STD_LOGIC;
  SIGNAL aux21	: STD_LOGIC;
BEGIN
  out_input_index(7) <= rtlalc_2(7);
  out_input_index(6) <= rtlalc_2(6);
  out_input_index(5) <= rtlalc_3(5);
  out_input_index(4) <= rtlalc_3(4);
  out_input_index(3) <= rtlalc_3(3);
  out_input_index(2) <= rtlalc_4;
  out_input_index(1) <= rtlalc_5(1);
  out_input_index(0) <= rtlalc_5(0);
  out_input_reset <= rtlalc_1;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_5(1) <= '0';
    ELSIF ((c_input_dec AND NOT(reset)) = '1')
    THEN rtlalc_5(1) <= count(1);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux9 AND (NOT(reset) AND c_input_dec)) = '1')
    THEN rtlalc_5(0) <= '1';
    ELSIF ((NOT(aux9) OR reset) = '1')
    THEN rtlalc_5(0) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_4 <= '1';
    ELSIF ((c_input_dec AND NOT(reset)) = '1')
    THEN rtlalc_4 <= count(2);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((c_input_dec AND (NOT(reset) AND aux14)) = '1')
    THEN rtlalc_3(5) <= '1';
    ELSIF ((reset OR NOT(aux14)) = '1')
    THEN rtlalc_3(5) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_3(4) <= '0';
    ELSIF ((c_input_dec AND NOT(reset)) = '1')
    THEN rtlalc_3(4) <= count(4);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((c_input_dec AND (NOT(reset) AND aux13)) = '1')
    THEN rtlalc_3(3) <= '1';
    ELSIF ((reset OR NOT(aux13)) = '1')
    THEN rtlalc_3(3) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_2 <= (OTHERS => '1');
    ELSIF ((c_input_dec AND NOT(reset)) = '1')
    THEN rtlalc_2 <= count(7 downto 6);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((NOT(aux7) AND (NOT(reset) AND (aux21 AND c_input_dec))) = '1')
    THEN rtlalc_1 <= '1';
    ELSIF (((aux7 OR (reset OR NOT(aux21))) AND NOT(aux2)) = '1')
    THEN rtlalc_1 <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((reset OR NOT(aux18)) = '1')
    THEN count(8) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((NOT(aux18) OR reset) = '1')
    THEN count(7) <= '1';
    ELSIF ((NOT(aux17) AND (NOT(aux12) AND (aux18 AND NOT(reset)))) = '1')
    THEN count(7) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(6) <= '1';
    ELSIF ((NOT(reset) AND (NOT(aux12) AND NOT(aux16))) = '1')
    THEN count(6) <= NOT(count(6));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux19 AND (aux8 AND (NOT(aux13) AND (NOT(count(4)) AND aux20)))) = '1')
    THEN count(5) <= '1';
    ELSIF ((NOT(aux19) AND (NOT(aux8) OR NOT(aux20))) = '1')
    THEN count(5) <= '0';
    ELSIF ((NOT(aux19) AND (aux8 AND (NOT(aux13) AND (NOT(count(4)) AND aux20)))) = '1')
    THEN count(5) <= NOT(count(5));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux19 AND ((count(5) OR (count(8) OR (count(6) OR count(7)))) AND (NOT(aux13)
 AND aux20))) = '1')
    THEN count(4) <= '1';
    ELSIF ((NOT(aux19) AND (NOT((count(5) OR (count(8) OR (count(6) OR (count(7) OR aux13
))))) OR NOT(aux20))) = '1')
    THEN count(4) <= '0';
    ELSIF ((NOT(aux19) AND ((count(5) OR (count(8) OR (count(6) OR count(7)))) AND (NOT(aux13
) AND aux20))) = '1')
    THEN count(4) <= NOT(count(4));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux19 AND (c_input_dec AND (aux8 AND aux20))) = '1')
    THEN count(3) <= '1';
    ELSIF ((NOT(aux19) AND (NOT(aux8) OR NOT(aux20))) = '1')
    THEN count(3) <= '0';
    ELSIF ((NOT(aux19) AND (c_input_dec AND (aux8 AND aux20))) = '1')
    THEN count(3) <= NOT(count(3));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(2) <= '1';
    ELSIF ((NOT(reset) AND NOT(aux10)) = '1')
    THEN count(2) <= NOT(count(2));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (((aux8 OR count(2)) AND (NOT(reset) AND (aux9 AND aux1))) = '1')
    THEN count(1) <= '1';
    ELSIF ((((reset OR NOT(aux9)) AND NOT(aux1)) OR (NOT(aux8 OR count(2)) AND (reset OR 
NOT(aux9)))) = '1')
    THEN count(1) <= '0';
    ELSIF (((aux8 OR count(2)) AND ((reset OR NOT(aux9)) AND aux1)) = '1')
    THEN count(1) <= NOT(count(1));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (((aux8 OR NOT(aux3)) AND aux1) = '1')
    THEN count(0) <= '1';
    ELSIF ((NOT(aux2) AND NOT(aux1)) = '1')
    THEN count(0) <= '0';
    END IF;
    END IF;
  END PROCESS;
  aux1 <= ((c_input_dec AND NOT(reset)) AND NOT(count(0)));
  aux2 <= (NOT(c_input_dec) AND NOT(reset));
  aux3 <= NOT((count(1) OR count(2)));
  aux7 <= ((((count(5) OR count(3)) OR count(8)) OR count(4)) OR count(6));
  aux8 <= (aux7 OR count(7));
  aux9 <= (NOT(c_input_dec) OR count(0));
  aux10 <= NOT((NOT(aux9) AND NOT(count(1))));
  aux12 <= NOT(((NOT(count(0)) AND NOT(count(1))) AND NOT(count(2))));
  aux13 <= NOT((c_input_dec AND NOT(count(3))));
  aux14 <= NOT((NOT(count(5)) AND c_input_dec));
  aux16 <= NOT(((NOT(aux14) AND NOT(count(3))) AND NOT(count(4))));
  aux17 <= NOT((NOT(aux16) AND NOT(count(6))));
  aux18 <= NOT((NOT(aux17) AND aux21));
  aux19 <= (NOT(reset) AND aux12);
  aux20 <= (NOT(reset) AND NOT(aux12));
  aux21 <= ((NOT(count(7)) AND NOT(count(0))) AND aux3);
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_inpdec_boom of inpdec_boom is
  for RTL
  end for;
end CFG_inpdec_boom;
