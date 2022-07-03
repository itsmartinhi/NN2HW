-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY inpdec_vasy IS
PORT(
  reset	: IN STD_LOGIC;
  clk	: IN STD_LOGIC;
  c_input_dec	: IN STD_LOGIC;
  out_input_index	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  out_input_reset	: OUT STD_LOGIC
);
END inpdec_vasy;

ARCHITECTURE RTL OF inpdec_vasy IS
  SIGNAL rtl_std_logic_vector_11	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_10	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_9	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_8	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_7	: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_6	: STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_5	: STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_4	: STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_3	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_2	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_1	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_0	: STD_LOGIC;
  SIGNAL rtlalc_5	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtlalc_4	: STD_LOGIC;
  SIGNAL rtlalc_3	: STD_LOGIC_VECTOR(5 DOWNTO 3);
  SIGNAL rtlalc_2	: STD_LOGIC_VECTOR(7 DOWNTO 6);
  SIGNAL rtlalc_1	: STD_LOGIC;
  SIGNAL rtlsum_0	: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL rtlcarry_0	: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL rtldef_0	: STD_LOGIC;
  SIGNAL count	: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL p18_1_reddef_5	: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL p18_1_reddef_4	: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL p18_1_def_3	: STD_LOGIC;
BEGIN
  rtl_std_logic_vector_11 <= ((p18_1_def_3 OR p18_1_reddef_4(7)) & (p18_1_def_3 OR p18_1_reddef_4(6)));
  rtl_std_logic_vector_10 <= (rtl_std_logic_vector_9 & (NOT(p18_1_def_3) AND p18_1_reddef_4(3)));
  rtl_std_logic_vector_9 <= ((NOT(p18_1_def_3) AND p18_1_reddef_4(5)) & (NOT(p18_1_def_3) AND p18_1_reddef_4(4)
));
  rtl_std_logic_vector_8 <= ((NOT(p18_1_def_3) AND p18_1_reddef_4(1)) & (NOT(p18_1_def_3) AND p18_1_reddef_4(0)
));
  rtl_std_logic_vector_7 <= (rtl_std_logic_vector_6 & rtldef_0);
  rtl_std_logic_vector_6 <= (rtl_std_logic_vector_5 & rtldef_0);
  rtl_std_logic_vector_5 <= (rtl_std_logic_vector_4 & rtldef_0);
  rtl_std_logic_vector_4 <= (rtl_std_logic_vector_3 & rtldef_0);
  rtl_std_logic_vector_3 <= (rtl_std_logic_vector_2 & rtldef_0);
  rtl_std_logic_vector_2 <= (rtl_std_logic_vector_1 & rtldef_0);
  rtl_std_logic_vector_1 <= (rtldef_0 & rtldef_0);
  p18_1_def_3 <= rtl_std_logic_0;
  rtl_std_logic_0 <= '1' WHEN (count = "000000000") ELSE
     '0';
  p18_1_reddef_5 <= (rtl_std_logic_vector_7 AND count(7 downto 0));
  rtldef_0 <= '1' WHEN (NOT(p18_1_def_3) = '1') ELSE
     '0';
  p18_1_reddef_4 <= rtlsum_0;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_5 <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN rtlalc_5 <= p18_1_reddef_5(1 downto 0);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_4 <= '1';
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN rtlalc_4 <= p18_1_reddef_5(2);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_3 <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN rtlalc_3 <= p18_1_reddef_5(5 downto 3);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_2 <= (OTHERS => '1');
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN rtlalc_2 <= p18_1_reddef_5(7 downto 6);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((NOT(reset) AND c_input_dec) = '1')
    THEN rtlalc_1 <= p18_1_def_3;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(1 downto 0) <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN count(1 downto 0) <= rtl_std_logic_vector_8;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(2) <= '1';
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN count(2) <= (p18_1_def_3 OR p18_1_reddef_4(2));
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(5 downto 3) <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN count(5 downto 3) <= rtl_std_logic_vector_10;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(7 downto 6) <= (OTHERS => '1');
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN count(7 downto 6) <= rtl_std_logic_vector_11;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN count(8) <= '0';
    ELSIF ((NOT(reset) AND c_input_dec) = '1')
    THEN count(8) <= (NOT(p18_1_def_3) AND p18_1_reddef_4(8));
    END IF;
    END IF;
  END PROCESS;
  rtlcarry_0(8 downto 1) <= (((count(7 downto 0) AND "11111110") OR (count(7 downto 0) AND rtlcarry_0(7 downto 0)
)) OR ("11111110" AND rtlcarry_0(7 downto 0)));
  rtlsum_0 <= ((count XOR "111111110") XOR rtlcarry_0);
  rtlcarry_0(0) <= '1';
  out_input_reset <= rtlalc_1;
  out_input_index(7 downto 6) <= rtlalc_2;
  out_input_index(5 downto 3) <= rtlalc_3;
  out_input_index(2) <= rtlalc_4;
  out_input_index(1 downto 0) <= rtlalc_5;
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_inpdec_vasy of inpdec_vasy is
  for RTL
  end for;
end CFG_inpdec_vasy;