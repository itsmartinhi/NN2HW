-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY neurondec_boom IS
PORT(
  reset	: IN STD_LOGIC;
  clk	: IN STD_LOGIC;
  c_neuron_dec	: IN STD_LOGIC;
  out_neuron_index	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  out_neuron_reset	: OUT STD_LOGIC
);
END neurondec_boom;

ARCHITECTURE RTL OF neurondec_boom IS
  SIGNAL rtlalc_4	: STD_LOGIC;
  SIGNAL rtlalc_3	: STD_LOGIC_VECTOR(2 DOWNTO 1);
  SIGNAL rtlalc_2	: STD_LOGIC;
  SIGNAL rtlalc_1	: STD_LOGIC;
  SIGNAL count	: STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL aux0	: STD_LOGIC;
  SIGNAL aux1	: STD_LOGIC;
  SIGNAL aux2	: STD_LOGIC;
  SIGNAL aux3	: STD_LOGIC;
  SIGNAL aux4	: STD_LOGIC;
  SIGNAL aux5	: STD_LOGIC;
  SIGNAL aux6	: STD_LOGIC;
BEGIN
  out_neuron_index(3) <= rtlalc_2;
  out_neuron_index(2) <= rtlalc_3(2);
  out_neuron_index(1) <= rtlalc_3(1);
  out_neuron_index(0) <= rtlalc_4;
  out_neuron_reset <= rtlalc_1;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_4 <= '1';
    ELSIF ((c_neuron_dec AND NOT(reset)) = '1')
    THEN rtlalc_4 <= count(0);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux3 AND c_neuron_dec) = '1')
    THEN rtlalc_3(2) <= '1';
    ELSIF ((NOT(aux3 AND c_neuron_dec) AND NOT(aux6)) = '1')
    THEN rtlalc_3(2) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux2 AND c_neuron_dec) = '1')
    THEN rtlalc_3(1) <= '1';
    ELSIF ((NOT(aux2 AND c_neuron_dec) AND NOT(aux6)) = '1')
    THEN rtlalc_3(1) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_2 <= '1';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN rtlalc_2 <= count(3);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_1 <= '0';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN rtlalc_1 <= (aux4 AND (NOT(count(4)) AND NOT(count(0))));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (((aux4 AND NOT(aux0)) OR reset) = '1')
    THEN count(4) <= '0';
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(3) <= '1';
    ELSIF ((NOT(reset) AND (NOT(aux0) AND (NOT(count(2)) AND NOT(count(1))))) = '1')
    THEN count(3) <= NOT(count(3));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((aux3 AND aux0) = '1')
    THEN count(2) <= '1';
    ELSIF ((NOT(aux3 AND aux0) AND NOT(aux5)) = '1')
    THEN count(2) <= '0';
    ELSIF ((NOT(aux3 AND aux0) AND (NOT(count(1)) AND aux5)) = '1')
    THEN count(2) <= ((count(3) OR count(4)) AND NOT(count(2)));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN count(1) <= ((aux2 AND aux0) OR ((aux1 OR count(4)) AND (NOT(count(1)) AND aux5)));
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(0) <= '1';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN count(0) <= NOT(count(0));
    END IF;
    END IF;
  END PROCESS;
  aux0 <= NOT((c_neuron_dec AND NOT(count(0))));
  aux1 <= (count(3) OR count(2));
  aux2 <= (count(1) AND NOT(reset));
  aux3 <= (count(2) AND NOT(reset));
  aux4 <= NOT((aux1 OR count(1)));
  aux5 <= (NOT(reset) AND NOT(aux0));
  aux6 <= (NOT(reset) AND NOT(c_neuron_dec));
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_neurondec_boom of neurondec_boom is
  for RTL
  end for;
end CFG_neurondec_boom;
