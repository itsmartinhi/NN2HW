-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY neurondec_vasy IS
PORT(
  reset	: IN STD_LOGIC;
  clk	: IN STD_LOGIC;
  c_neuron_dec	: IN STD_LOGIC;
  out_neuron_index	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  out_neuron_reset	: OUT STD_LOGIC
);
END neurondec_vasy;

ARCHITECTURE RTL OF neurondec_vasy IS
  SIGNAL rtl_std_logic_vector_4	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_3	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_2	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_1	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_0	: STD_LOGIC;
  SIGNAL rtlalc_4	: STD_LOGIC;
  SIGNAL rtlalc_3	: STD_LOGIC_VECTOR(2 DOWNTO 1);
  SIGNAL rtlalc_2	: STD_LOGIC;
  SIGNAL rtlalc_1	: STD_LOGIC;
  SIGNAL rtlsum_0	: STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL rtlcarry_0	: STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL rtldef_0	: STD_LOGIC;
  SIGNAL count	: STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL p18_1_reddef_5	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL p18_1_reddef_4	: STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL p18_1_def_3	: STD_LOGIC;
BEGIN
  rtl_std_logic_vector_4 <= ((NOT(p18_1_def_3) AND p18_1_reddef_4(2)) & (NOT(p18_1_def_3) AND p18_1_reddef_4(1)
));
  rtl_std_logic_vector_3 <= (rtl_std_logic_vector_2 & rtldef_0);
  rtl_std_logic_vector_2 <= (rtl_std_logic_vector_1 & rtldef_0);
  rtl_std_logic_vector_1 <= (rtldef_0 & rtldef_0);
  p18_1_def_3 <= rtl_std_logic_0;
  rtl_std_logic_0 <= '1' WHEN (count = "00000") ELSE
     '0';
  p18_1_reddef_5 <= (rtl_std_logic_vector_3 AND count(3 downto 0));
  rtldef_0 <= '1' WHEN (NOT(p18_1_def_3) = '1') ELSE
     '0';
  p18_1_reddef_4 <= rtlsum_0;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_4 <= '1';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN rtlalc_4 <= p18_1_reddef_5(0);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_3 <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN rtlalc_3 <= p18_1_reddef_5(2 downto 1);
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
    THEN rtlalc_2 <= p18_1_reddef_5(3);
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
    THEN rtlalc_1 <= p18_1_def_3;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(0) <= '1';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN count(0) <= (p18_1_def_3 OR p18_1_reddef_4(0));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(2 downto 1) <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN count(2 downto 1) <= rtl_std_logic_vector_4;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(3) <= '1';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN count(3) <= (p18_1_def_3 OR p18_1_reddef_4(3));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(4) <= '0';
    ELSIF ((NOT(reset) AND c_neuron_dec) = '1')
    THEN count(4) <= (NOT(p18_1_def_3) AND p18_1_reddef_4(4));
    END IF;
    END IF;
  END PROCESS;
  rtlcarry_0(4 downto 1) <= (((count(3 downto 0) AND "1110") OR (count(3 downto 0) AND rtlcarry_0(3 downto 0)
)) OR ("1110" AND rtlcarry_0(3 downto 0)));
  rtlsum_0 <= ((count XOR "11110") XOR rtlcarry_0);
  rtlcarry_0(0) <= '1';
  out_neuron_reset <= rtlalc_1;
  out_neuron_index(3) <= rtlalc_2;
  out_neuron_index(2 downto 1) <= rtlalc_3;
  out_neuron_index(0) <= rtlalc_4;
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_neurondec_vasy of neurondec_vasy is
  for RTL
  end for;
end CFG_neurondec_vasy;
