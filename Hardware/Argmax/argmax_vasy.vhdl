-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY argmax_vasy IS
PORT(
  clk	: IN STD_LOGIC;
  c_argmax	: IN STD_LOGIC;
  reset	: IN STD_LOGIC;
  in_argmax_val	: IN STD_LOGIC_VECTOR(20 DOWNTO 0);
  in_argmax_index	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  out_argmax_index	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END argmax_vasy;

ARCHITECTURE RTL OF argmax_vasy IS
  SIGNAL rtl_std_logic_vector_1	: STD_LOGIC_VECTOR(21 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_0	: STD_LOGIC_VECTOR(21 DOWNTO 0);
  SIGNAL rtlalc_3	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rtlltgt_2	: STD_LOGIC;
  SIGNAL rtlcarry_2	: STD_LOGIC_VECTOR(21 DOWNTO 0);
  SIGNAL alcexts_1	: STD_LOGIC_VECTOR(21 DOWNTO 0);
  SIGNAL alcexts_0	: STD_LOGIC_VECTOR(21 DOWNTO 0);
  SIGNAL reg_argmax_val	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL p19_1_def_3	: STD_LOGIC;
BEGIN
  rtl_std_logic_vector_1 <= ('0' & in_argmax_val);
  rtl_std_logic_vector_0 <= ('0' & reg_argmax_val);
  p19_1_def_3 <= rtlltgt_2;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN rtlalc_3 <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND (p19_1_def_3 AND c_argmax)) = '1')
    THEN rtlalc_3 <= in_argmax_index;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (reset = '1')
    THEN reg_argmax_val <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND (p19_1_def_3 AND c_argmax)) = '1')
    THEN reg_argmax_val <= in_argmax_val;
    END IF;
    END IF;
  END PROCESS;
  alcexts_0 <= rtl_std_logic_vector_0;
  alcexts_1 <= rtl_std_logic_vector_1;
  rtlltgt_2 <= ((alcexts_0(21) XOR NOT(alcexts_1(21))) XOR rtlcarry_2(21));
  rtlcarry_2(21 downto 1) <= (((alcexts_0(20 downto 0) AND NOT(alcexts_1(20 downto 0))) OR (alcexts_0(20 downto 0)
 AND rtlcarry_2(20 downto 0))) OR (NOT(alcexts_1(20 downto 0)) AND rtlcarry_2(20 downto 0)
));
  rtlcarry_2(0) <= '1';
  out_argmax_index <= rtlalc_3;
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_argmax_vasy of argmax_vasy is
  for RTL
  end for;
end CFG_argmax_vasy;
