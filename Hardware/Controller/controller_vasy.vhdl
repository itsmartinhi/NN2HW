-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY controller_vasy IS
PORT(
  clk	: IN STD_LOGIC;
  reset	: IN STD_LOGIC;
  in_ctrl_neuron_reset	: IN STD_LOGIC;
  in_ctrl_input_reset	: IN STD_LOGIC;
  c_dec_neuron	: OUT STD_LOGIC;
  c_dec_input	: OUT STD_LOGIC;
  c_add_to_neuron	: OUT STD_LOGIC;
  c_reset_register	: OUT STD_LOGIC;
  c_argmax	: OUT STD_LOGIC;
  halt	: OUT STD_LOGIC
);
END controller_vasy;

ARCHITECTURE RTL OF controller_vasy IS
  SIGNAL rtl_std_logic_vector_30	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_29	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_28	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_27	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_26	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_25	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_24	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_23	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_22	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_21	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_20	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_19	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_18	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_17	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_16	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_15	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_14	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_13	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_12	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_11	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_10	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_9	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtl_std_logic_8	: STD_LOGIC;
  SIGNAL rtl_std_logic_7	: STD_LOGIC;
  SIGNAL rtl_std_logic_6	: STD_LOGIC;
  SIGNAL rtl_std_logic_5	: STD_LOGIC;
  SIGNAL rtl_std_logic_4	: STD_LOGIC;
  SIGNAL rtl_std_logic_3	: STD_LOGIC;
  SIGNAL rtl_std_logic_2	: STD_LOGIC;
  SIGNAL rtl_std_logic_vector_1	: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL rtl_std_logic_vector_0	: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL rtldef_11	: STD_LOGIC;
  SIGNAL rtldef_10	: STD_LOGIC;
  SIGNAL rtldef_9	: STD_LOGIC;
  SIGNAL rtldef_8	: STD_LOGIC;
  SIGNAL rtldef_7	: STD_LOGIC;
  SIGNAL rtldef_6	: STD_LOGIC;
  SIGNAL rtldef_5	: STD_LOGIC;
  SIGNAL rtldef_4	: STD_LOGIC;
  SIGNAL rtldef_3	: STD_LOGIC;
  SIGNAL rtldef_2	: STD_LOGIC;
  SIGNAL rtldef_1	: STD_LOGIC;
  SIGNAL rtldef_0	: STD_LOGIC;
  SIGNAL state	: STD_LOGIC_VECTOR(0 TO 2);
  SIGNAL next_state	: STD_LOGIC_VECTOR(0 TO 2);
  SIGNAL p35_2_reddef_13	: STD_LOGIC;
  SIGNAL p35_2_reddef_12	: STD_LOGIC;
  SIGNAL p35_2_reddef_11	: STD_LOGIC;
  SIGNAL p35_2_reddef_10	: STD_LOGIC;
  SIGNAL p35_2_reddef_9	: STD_LOGIC;
  SIGNAL p35_2_def_1	: STD_LOGIC;
  SIGNAL p35_2_def_0	: STD_LOGIC;
BEGIN
  rtl_std_logic_vector_30 <= (rtl_std_logic_vector_29 & rtldef_11);
  rtl_std_logic_vector_29 <= (rtldef_11 & rtldef_11);
  rtl_std_logic_vector_28 <= (rtl_std_logic_vector_27 & rtldef_2);
  rtl_std_logic_vector_27 <= (rtldef_2 & rtldef_2);
  rtl_std_logic_vector_26 <= (rtl_std_logic_vector_25 & rtldef_1);
  rtl_std_logic_vector_25 <= (rtldef_1 & rtldef_1);
  rtl_std_logic_vector_24 <= (rtl_std_logic_vector_23 & rtldef_10);
  rtl_std_logic_vector_23 <= (rtldef_10 & rtldef_10);
  rtl_std_logic_vector_22 <= (rtl_std_logic_vector_21 & rtldef_9);
  rtl_std_logic_vector_21 <= (rtldef_9 & rtldef_9);
  rtl_std_logic_vector_20 <= (rtl_std_logic_vector_19 & rtldef_4);
  rtl_std_logic_vector_19 <= (rtldef_4 & rtldef_4);
  rtl_std_logic_vector_18 <= (rtl_std_logic_vector_17 & rtldef_3);
  rtl_std_logic_vector_17 <= (rtldef_3 & rtldef_3);
  rtl_std_logic_vector_16 <= (rtl_std_logic_vector_15 & rtldef_8);
  rtl_std_logic_vector_15 <= (rtldef_8 & rtldef_8);
  rtl_std_logic_vector_14 <= (rtl_std_logic_vector_13 & rtldef_7);
  rtl_std_logic_vector_13 <= (rtldef_7 & rtldef_7);
  rtl_std_logic_vector_12 <= (rtl_std_logic_vector_11 & rtldef_6);
  rtl_std_logic_vector_11 <= (rtldef_6 & rtldef_6);
  rtl_std_logic_vector_10 <= (rtl_std_logic_vector_9 & rtldef_5);
  rtl_std_logic_vector_9 <= (rtldef_5 & rtldef_5);
  rtl_std_logic_vector_1 <= (rtl_std_logic_vector_0 & rtldef_0);
  rtl_std_logic_vector_0 <= (rtldef_0 & rtldef_0);
  rtldef_0 <= '1' WHEN NOT((reset = '1')) ELSE
     '0';
  PROCESS ( clk )
  BEGIN
    IF  ((clk = '1') AND clk'EVENT)
    THEN state <= (rtl_std_logic_vector_1 AND next_state);
    END IF;
  END PROCESS;
  p35_2_reddef_13 <= rtl_std_logic_2;
  rtl_std_logic_2 <= '1' WHEN (((state(2) AND NOT(state(1))) AND state(0)) = '1') ELSE
     '0';
  p35_2_reddef_12 <= rtl_std_logic_3;
  rtl_std_logic_3 <= '1' WHEN (((NOT(state(2)) AND state(1)) AND state(0)) = '1') ELSE
     '0';
  p35_2_def_0 <= rtl_std_logic_4;
  rtl_std_logic_4 <= '1' WHEN (in_ctrl_neuron_reset = '1') ELSE
     '0';
  rtldef_1 <= '1' WHEN (NOT(p35_2_def_0) = '1') ELSE
     '0';
  rtldef_2 <= '1' WHEN (p35_2_def_0 = '1') ELSE
     '0';
  p35_2_reddef_11 <= rtl_std_logic_5;
  rtl_std_logic_5 <= '1' WHEN (((state(2) AND NOT(state(1))) AND NOT(state(0))) = '1') ELSE
     '0';
  p35_2_reddef_10 <= rtl_std_logic_6;
  rtl_std_logic_6 <= '1' WHEN (((NOT(state(2)) AND NOT(state(1))) AND state(0)) = '1') ELSE
     '0';
  p35_2_def_1 <= rtl_std_logic_7;
  rtl_std_logic_7 <= '1' WHEN (in_ctrl_input_reset = '1') ELSE
     '0';
  rtldef_3 <= '1' WHEN (NOT(p35_2_def_1) = '1') ELSE
     '0';
  rtldef_4 <= '1' WHEN (p35_2_def_1 = '1') ELSE
     '0';
  p35_2_reddef_9 <= rtl_std_logic_8;
  rtl_std_logic_8 <= '1' WHEN (((NOT(state(2)) AND state(1)) AND NOT(state(0))) = '1') ELSE
     '0';
  next_state <= (((((((rtl_std_logic_vector_10 AND "101") OR (rtl_std_logic_vector_12 AND "010"
)) OR (rtl_std_logic_vector_14 AND "100")) OR (rtl_std_logic_vector_16 AND ((rtl_std_logic_vector_18 AND "010"
) OR (rtl_std_logic_vector_20 AND "001")))) OR (rtl_std_logic_vector_22 AND "110"
)) OR (rtl_std_logic_vector_24 AND ((rtl_std_logic_vector_26 AND "010") OR (rtl_std_logic_vector_28 AND "101"
)))) OR (rtl_std_logic_vector_30 AND "101"));
  rtldef_5 <= '1' WHEN ((((((NOT(((state(2) AND NOT(state(1))) AND state(0))) AND NOT(((NOT(state(2)) 
AND state(1)) AND state(0)))) AND NOT(((state(2) AND NOT(state(1))) AND NOT(state(0)
)))) AND NOT(((NOT(state(2)) AND NOT(state(1))) AND state(0)))) AND NOT(((NOT(state(2)
) AND state(1)) AND NOT(state(0))))) AND NOT(((NOT(state(2)) AND NOT(state(1))) 
AND NOT(state(0))))) = '1') ELSE
     '0';
  rtldef_6 <= '1' WHEN (((NOT(state(2)) AND NOT(state(1))) AND NOT(state(0))) = '1') ELSE
     '0';
  rtldef_7 <= '1' WHEN (p35_2_reddef_9 = '1') ELSE
     '0';
  rtldef_8 <= '1' WHEN (p35_2_reddef_10 = '1') ELSE
     '0';
  rtldef_9 <= '1' WHEN (p35_2_reddef_11 = '1') ELSE
     '0';
  rtldef_10 <= '1' WHEN (p35_2_reddef_12 = '1') ELSE
     '0';
  rtldef_11 <= '1' WHEN (p35_2_reddef_13 = '1') ELSE
     '0';
  c_dec_neuron <= p35_2_reddef_12;
  c_dec_input <= p35_2_reddef_10;
  c_add_to_neuron <= p35_2_reddef_9;
  c_argmax <= p35_2_reddef_11;
  c_reset_register <= p35_2_reddef_12;
  halt <= p35_2_reddef_13;
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_controller_vasy of controller_vasy is
  for RTL
  end for;
end CFG_controller_vasy;