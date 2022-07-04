-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY neuronreg_vasy IS
PORT(
  clk	: IN STD_LOGIC;
  reset	: IN STD_LOGIC;
  c_reset_reg	: IN STD_LOGIC;
  c_nreg	: IN STD_LOGIC;
  in_nreg_val	: IN STD_LOGIC_VECTOR(12 DOWNTO 0);
  out_nreg_val	: OUT STD_LOGIC_VECTOR(20 DOWNTO 0)
);
END neuronreg_vasy;

ARCHITECTURE RTL OF neuronreg_vasy IS
  SIGNAL rtl_std_logic_vector_5	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL rtl_std_logic_4	: STD_LOGIC;
  SIGNAL rtl_bit_3	: BIT;
  SIGNAL rtl_std_logic_2	: STD_LOGIC;
  SIGNAL rtl_bit_1	: BIT;
  SIGNAL rtl_std_logic_0	: STD_LOGIC;
  SIGNAL rtlalc_1	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL rtlsum_0	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL rtlcarry_0	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL rtlexts_0	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL reg_nreg	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL sum	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL p20_1_def_1	: STD_LOGIC;
BEGIN
  rtl_std_logic_vector_5 <= ("00000000" & in_nreg_val);
  rtl_std_logic_4 <= to_stdulogic((rtl_bit_1 OR rtl_bit_3));
  rtl_bit_3 <= to_bit(rtl_std_logic_2);
  rtl_bit_1 <= to_bit(rtl_std_logic_0);
  p20_1_def_1 <= rtl_std_logic_4;
  rtl_std_logic_2 <= '1' WHEN (c_reset_reg = '1') ELSE
     '0';
  rtl_std_logic_0 <= '1' WHEN (reset = '1') ELSE
     '0';
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '0') AND clk'EVENT)
    THEN sum <= rtlsum_0;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((reset OR c_reset_reg) = '1')
    THEN rtlalc_1 <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND (NOT(c_reset_reg) AND c_nreg)) = '1')
    THEN rtlalc_1 <= sum;
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((reset OR c_reset_reg) = '1')
    THEN reg_nreg(10 downto 0) <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND (NOT(c_reset_reg) AND c_nreg)) = '1')
    THEN reg_nreg(10 downto 0) <= sum(10 downto 0);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF (p20_1_def_1 = '1')
    THEN reg_nreg(11) <= '0';
    ELSIF ((NOT(p20_1_def_1) AND c_nreg) = '1')
    THEN reg_nreg(11) <= sum(11);
    END IF;
    END IF;
  END PROCESS;
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN 
    IF ((reset OR c_reset_reg) = '1')
    THEN reg_nreg(20 downto 12) <= (OTHERS => '0');
    ELSIF ((NOT(reset) AND (NOT(c_reset_reg) AND c_nreg)) = '1')
    THEN reg_nreg(20 downto 12) <= sum(20 downto 12);
    END IF;
    END IF;
  END PROCESS;
  rtlexts_0 <= rtl_std_logic_vector_5;
  rtlcarry_0(20 downto 1) <= (((reg_nreg(19 downto 0) AND rtlexts_0(19 downto 0)) OR (reg_nreg(19 downto 0) 
AND rtlcarry_0(19 downto 0))) OR (rtlexts_0(19 downto 0) AND rtlcarry_0(19 downto 0)
));
  rtlsum_0 <= ((reg_nreg XOR rtlexts_0) XOR rtlcarry_0);
  rtlcarry_0(0) <= '0';
  out_nreg_val <= rtlalc_1;
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_neuronreg_vasy of neuronreg_vasy is
  for RTL
  end for;
end CFG_neuronreg_vasy;
