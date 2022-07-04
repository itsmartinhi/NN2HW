-- Generated by vxx2ghdl
--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY argmax_final IS
PORT(
  clk	: IN STD_LOGIC;
  c_argmax	: IN STD_LOGIC;
  reset	: IN STD_LOGIC;
  in_argmax_val	: IN STD_LOGIC_VECTOR(20 DOWNTO 0);
  in_argmax_index	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  out_argmax_index	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END argmax_final;

ARCHITECTURE RTL OF argmax_final IS
  SIGNAL not_in_argmax_val	: STD_LOGIC_VECTOR(19 DOWNTO 0);
  SIGNAL not_reg_argmax_val	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL not_rtlcarry_2	: STD_LOGIC_VECTOR(20 DOWNTO 20);
  SIGNAL reg_argmax_val	: STD_LOGIC_VECTOR(20 DOWNTO 0);
  SIGNAL rtlalc_3	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rtlcarry_2	: STD_LOGIC_VECTOR(19 DOWNTO 2);
  SIGNAL oa22_x2_sig	: STD_LOGIC;
  SIGNAL oa22_x2_3_sig	: STD_LOGIC;
  SIGNAL oa22_x2_2_sig	: STD_LOGIC;
  SIGNAL not_reset	: STD_LOGIC;
  SIGNAL not_aux7	: STD_LOGIC;
  SIGNAL not_aux6	: STD_LOGIC;
  SIGNAL not_aux4	: STD_LOGIC;
  SIGNAL not_aux2	: STD_LOGIC;
  SIGNAL not_aux0	: STD_LOGIC;
  SIGNAL noa22_x1_sig	: STD_LOGIC;
  SIGNAL noa22_x1_9_sig	: STD_LOGIC;
  SIGNAL noa22_x1_8_sig	: STD_LOGIC;
  SIGNAL noa22_x1_7_sig	: STD_LOGIC;
  SIGNAL noa22_x1_6_sig	: STD_LOGIC;
  SIGNAL noa22_x1_5_sig	: STD_LOGIC;
  SIGNAL noa22_x1_4_sig	: STD_LOGIC;
  SIGNAL noa22_x1_3_sig	: STD_LOGIC;
  SIGNAL noa22_x1_2_sig	: STD_LOGIC;
  SIGNAL noa22_x1_17_sig	: STD_LOGIC;
  SIGNAL noa22_x1_16_sig	: STD_LOGIC;
  SIGNAL noa22_x1_15_sig	: STD_LOGIC;
  SIGNAL noa22_x1_14_sig	: STD_LOGIC;
  SIGNAL noa22_x1_13_sig	: STD_LOGIC;
  SIGNAL noa22_x1_12_sig	: STD_LOGIC;
  SIGNAL noa22_x1_11_sig	: STD_LOGIC;
  SIGNAL noa22_x1_10_sig	: STD_LOGIC;
  SIGNAL nao22_x1_sig	: STD_LOGIC;
  SIGNAL nao22_x1_2_sig	: STD_LOGIC;
  SIGNAL na3_x1_sig	: STD_LOGIC;
  SIGNAL na3_x1_9_sig	: STD_LOGIC;
  SIGNAL na3_x1_8_sig	: STD_LOGIC;
  SIGNAL na3_x1_7_sig	: STD_LOGIC;
  SIGNAL na3_x1_6_sig	: STD_LOGIC;
  SIGNAL na3_x1_5_sig	: STD_LOGIC;
  SIGNAL na3_x1_4_sig	: STD_LOGIC;
  SIGNAL na3_x1_3_sig	: STD_LOGIC;
  SIGNAL na3_x1_2_sig	: STD_LOGIC;
  SIGNAL na3_x1_12_sig	: STD_LOGIC;
  SIGNAL na3_x1_11_sig	: STD_LOGIC;
  SIGNAL na3_x1_10_sig	: STD_LOGIC;
  SIGNAL na2_x1_sig	: STD_LOGIC;
  SIGNAL na2_x1_9_sig	: STD_LOGIC;
  SIGNAL na2_x1_8_sig	: STD_LOGIC;
  SIGNAL na2_x1_7_sig	: STD_LOGIC;
  SIGNAL na2_x1_6_sig	: STD_LOGIC;
  SIGNAL na2_x1_5_sig	: STD_LOGIC;
  SIGNAL na2_x1_4_sig	: STD_LOGIC;
  SIGNAL na2_x1_3_sig	: STD_LOGIC;
  SIGNAL na2_x1_2_sig	: STD_LOGIC;
  SIGNAL na2_x1_13_sig	: STD_LOGIC;
  SIGNAL na2_x1_12_sig	: STD_LOGIC;
  SIGNAL na2_x1_11_sig	: STD_LOGIC;
  SIGNAL na2_x1_10_sig	: STD_LOGIC;
  SIGNAL mbk_buf_not_aux2	: STD_LOGIC;
  SIGNAL inv_x2_sig	: STD_LOGIC;
  SIGNAL inv_x2_9_sig	: STD_LOGIC;
  SIGNAL inv_x2_8_sig	: STD_LOGIC;
  SIGNAL inv_x2_7_sig	: STD_LOGIC;
  SIGNAL inv_x2_6_sig	: STD_LOGIC;
  SIGNAL inv_x2_5_sig	: STD_LOGIC;
  SIGNAL inv_x2_4_sig	: STD_LOGIC;
  SIGNAL inv_x2_3_sig	: STD_LOGIC;
  SIGNAL inv_x2_2_sig	: STD_LOGIC;
  SIGNAL inv_x2_21_sig	: STD_LOGIC;
  SIGNAL inv_x2_20_sig	: STD_LOGIC;
  SIGNAL inv_x2_19_sig	: STD_LOGIC;
  SIGNAL inv_x2_18_sig	: STD_LOGIC;
  SIGNAL inv_x2_17_sig	: STD_LOGIC;
  SIGNAL inv_x2_16_sig	: STD_LOGIC;
  SIGNAL inv_x2_15_sig	: STD_LOGIC;
  SIGNAL inv_x2_14_sig	: STD_LOGIC;
  SIGNAL inv_x2_13_sig	: STD_LOGIC;
  SIGNAL inv_x2_12_sig	: STD_LOGIC;
  SIGNAL inv_x2_11_sig	: STD_LOGIC;
  SIGNAL inv_x2_10_sig	: STD_LOGIC;
  SIGNAL aux5	: STD_LOGIC;
  SIGNAL ao22_x2_sig	: STD_LOGIC;
  SIGNAL ao22_x2_9_sig	: STD_LOGIC;
  SIGNAL ao22_x2_8_sig	: STD_LOGIC;
  SIGNAL ao22_x2_7_sig	: STD_LOGIC;
  SIGNAL ao22_x2_6_sig	: STD_LOGIC;
  SIGNAL ao22_x2_5_sig	: STD_LOGIC;
  SIGNAL ao22_x2_4_sig	: STD_LOGIC;
  SIGNAL ao22_x2_3_sig	: STD_LOGIC;
  SIGNAL ao22_x2_2_sig	: STD_LOGIC;
  SIGNAL ao22_x2_16_sig	: STD_LOGIC;
  SIGNAL ao22_x2_15_sig	: STD_LOGIC;
  SIGNAL ao22_x2_14_sig	: STD_LOGIC;
  SIGNAL ao22_x2_13_sig	: STD_LOGIC;
  SIGNAL ao22_x2_12_sig	: STD_LOGIC;
  SIGNAL ao22_x2_11_sig	: STD_LOGIC;
  SIGNAL ao22_x2_10_sig	: STD_LOGIC;

  COMPONENT buf_x2
  PORT(
  i	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT sff1_x4
  PORT(
  ck	: IN STD_LOGIC;
  i	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT noa22_x1
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT inv_x2
  PORT(
  i	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT na2_x1
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT na3_x1
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT nao22_x1
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT ao22_x2
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT oa22_x2
  PORT(
  i1	: IN STD_LOGIC;
  i0	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT oa2a2a23_x2
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i3	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  i4	: IN STD_LOGIC;
  i5	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT oa2ao222_x2
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  i3	: IN STD_LOGIC;
  i4	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT no2_x1
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT noa2a2a23_x1
  PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i3	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  i4	: IN STD_LOGIC;
  i5	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT o3_x4
  PORT(
  i0	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  q	: OUT STD_LOGIC
   );
  END COMPONENT;

BEGIN
  i_mbk_buf_not_aux2 : buf_x2
  PORT MAP (
    i => not_aux2,
    q => mbk_buf_not_aux2
  );
  out_argmax_index_3_ins : buf_x2
  PORT MAP (
    i => rtlalc_3(3),
    q => out_argmax_index(3)
  );
  out_argmax_index_2_ins : buf_x2
  PORT MAP (
    i => rtlalc_3(2),
    q => out_argmax_index(2)
  );
  out_argmax_index_1_ins : buf_x2
  PORT MAP (
    i => rtlalc_3(1),
    q => out_argmax_index(1)
  );
  out_argmax_index_0_ins : buf_x2
  PORT MAP (
    i => rtlalc_3(0),
    q => out_argmax_index(0)
  );
  rtlalc_3_3_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_17_sig,
    q => rtlalc_3(3)
  );
  noa22_x1_17_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_21_sig,
    i1 => not_aux4,
    i2 => na2_x1_13_sig,
    nq => noa22_x1_17_sig
  );
  inv_x2_21_ins : inv_x2
  PORT MAP (
    i => rtlalc_3(3),
    nq => inv_x2_21_sig
  );
  na2_x1_13_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_12_sig,
    nq => na2_x1_13_sig
  );
  na3_x1_12_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => inv_x2_20_sig,
    nq => na3_x1_12_sig
  );
  inv_x2_20_ins : inv_x2
  PORT MAP (
    i => in_argmax_index(3),
    nq => inv_x2_20_sig
  );
  rtlalc_3_2_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_16_sig,
    q => rtlalc_3(2)
  );
  noa22_x1_16_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_19_sig,
    i1 => not_aux4,
    i2 => nao22_x1_2_sig,
    nq => noa22_x1_16_sig
  );
  inv_x2_19_ins : inv_x2
  PORT MAP (
    i => rtlalc_3(2),
    nq => inv_x2_19_sig
  );
  nao22_x1_2_ins : nao22_x1
  PORT MAP (
    i0 => in_argmax_index(2),
    i1 => inv_x2_18_sig,
    i2 => not_reset,
    nq => nao22_x1_2_sig
  );
  inv_x2_18_ins : inv_x2
  PORT MAP (
    i => not_aux6,
    nq => inv_x2_18_sig
  );
  rtlalc_3_1_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_15_sig,
    q => rtlalc_3(1)
  );
  noa22_x1_15_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_17_sig,
    i1 => not_aux4,
    i2 => nao22_x1_sig,
    nq => noa22_x1_15_sig
  );
  inv_x2_17_ins : inv_x2
  PORT MAP (
    i => rtlalc_3(1),
    nq => inv_x2_17_sig
  );
  nao22_x1_ins : nao22_x1
  PORT MAP (
    i0 => in_argmax_index(1),
    i1 => inv_x2_16_sig,
    i2 => not_reset,
    nq => nao22_x1_sig
  );
  inv_x2_16_ins : inv_x2
  PORT MAP (
    i => not_aux6,
    nq => inv_x2_16_sig
  );
  rtlalc_3_0_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_15_sig,
    q => rtlalc_3(0)
  );
  ao22_x2_15_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => rtlalc_3(0),
    i2 => ao22_x2_16_sig,
    q => ao22_x2_15_sig
  );
  ao22_x2_16_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_index(0),
    i2 => not_reset,
    q => ao22_x2_16_sig
  );
  reg_argmax_val_20_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_14_sig,
    q => reg_argmax_val(20)
  );
  noa22_x1_14_ins : noa22_x1
  PORT MAP (
    i0 => not_reg_argmax_val(20),
    i1 => na2_x1_12_sig,
    i2 => reset,
    nq => noa22_x1_14_sig
  );
  na2_x1_12_ins : na2_x1
  PORT MAP (
    i0 => in_argmax_val(20),
    i1 => c_argmax,
    nq => na2_x1_12_sig
  );
  reg_argmax_val_19_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_13_sig,
    q => reg_argmax_val(19)
  );
  ao22_x2_13_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(19),
    i2 => ao22_x2_14_sig,
    q => ao22_x2_13_sig
  );
  ao22_x2_14_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(19),
    i2 => not_reset,
    q => ao22_x2_14_sig
  );
  reg_argmax_val_18_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_13_sig,
    q => reg_argmax_val(18)
  );
  noa22_x1_13_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_15_sig,
    i1 => not_aux4,
    i2 => na2_x1_11_sig,
    nq => noa22_x1_13_sig
  );
  inv_x2_15_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(18),
    nq => inv_x2_15_sig
  );
  na2_x1_11_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_11_sig,
    nq => na2_x1_11_sig
  );
  na3_x1_11_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(18),
    nq => na3_x1_11_sig
  );
  reg_argmax_val_17_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_12_sig,
    q => reg_argmax_val(17)
  );
  noa22_x1_12_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_14_sig,
    i1 => not_aux4,
    i2 => oa22_x2_3_sig,
    nq => noa22_x1_12_sig
  );
  inv_x2_14_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(17),
    nq => inv_x2_14_sig
  );
  oa22_x2_3_ins : oa22_x2
  PORT MAP (
    i1 => not_in_argmax_val(17),
    i0 => not_aux6,
    i2 => reset,
    q => oa22_x2_3_sig
  );
  reg_argmax_val_16_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_11_sig,
    q => reg_argmax_val(16)
  );
  noa22_x1_11_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_13_sig,
    i1 => not_aux4,
    i2 => na2_x1_10_sig,
    nq => noa22_x1_11_sig
  );
  inv_x2_13_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(16),
    nq => inv_x2_13_sig
  );
  na2_x1_10_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_10_sig,
    nq => na2_x1_10_sig
  );
  na3_x1_10_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(16),
    nq => na3_x1_10_sig
  );
  reg_argmax_val_15_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_10_sig,
    q => reg_argmax_val(15)
  );
  noa22_x1_10_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_12_sig,
    i1 => not_aux4,
    i2 => na2_x1_9_sig,
    nq => noa22_x1_10_sig
  );
  inv_x2_12_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(15),
    nq => inv_x2_12_sig
  );
  na2_x1_9_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_9_sig,
    nq => na2_x1_9_sig
  );
  na3_x1_9_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(15),
    nq => na3_x1_9_sig
  );
  reg_argmax_val_14_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_11_sig,
    q => reg_argmax_val(14)
  );
  ao22_x2_11_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(14),
    i2 => ao22_x2_12_sig,
    q => ao22_x2_11_sig
  );
  ao22_x2_12_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(14),
    i2 => not_reset,
    q => ao22_x2_12_sig
  );
  reg_argmax_val_13_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_9_sig,
    q => reg_argmax_val(13)
  );
  noa22_x1_9_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_11_sig,
    i1 => not_aux4,
    i2 => na2_x1_8_sig,
    nq => noa22_x1_9_sig
  );
  inv_x2_11_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(13),
    nq => inv_x2_11_sig
  );
  na2_x1_8_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_8_sig,
    nq => na2_x1_8_sig
  );
  na3_x1_8_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(13),
    nq => na3_x1_8_sig
  );
  reg_argmax_val_12_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_9_sig,
    q => reg_argmax_val(12)
  );
  ao22_x2_9_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(12),
    i2 => ao22_x2_10_sig,
    q => ao22_x2_9_sig
  );
  ao22_x2_10_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(12),
    i2 => not_reset,
    q => ao22_x2_10_sig
  );
  reg_argmax_val_11_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_8_sig,
    q => reg_argmax_val(11)
  );
  noa22_x1_8_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_10_sig,
    i1 => not_aux4,
    i2 => na2_x1_7_sig,
    nq => noa22_x1_8_sig
  );
  inv_x2_10_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(11),
    nq => inv_x2_10_sig
  );
  na2_x1_7_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_7_sig,
    nq => na2_x1_7_sig
  );
  na3_x1_7_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(11),
    nq => na3_x1_7_sig
  );
  reg_argmax_val_10_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_7_sig,
    q => reg_argmax_val(10)
  );
  noa22_x1_7_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_9_sig,
    i1 => not_aux4,
    i2 => oa22_x2_2_sig,
    nq => noa22_x1_7_sig
  );
  inv_x2_9_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(10),
    nq => inv_x2_9_sig
  );
  oa22_x2_2_ins : oa22_x2
  PORT MAP (
    i1 => not_in_argmax_val(10),
    i0 => not_aux6,
    i2 => reset,
    q => oa22_x2_2_sig
  );
  reg_argmax_val_9_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_6_sig,
    q => reg_argmax_val(9)
  );
  noa22_x1_6_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_8_sig,
    i1 => not_aux4,
    i2 => na2_x1_6_sig,
    nq => noa22_x1_6_sig
  );
  inv_x2_8_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(9),
    nq => inv_x2_8_sig
  );
  na2_x1_6_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_6_sig,
    nq => na2_x1_6_sig
  );
  na3_x1_6_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(9),
    nq => na3_x1_6_sig
  );
  reg_argmax_val_8_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_5_sig,
    q => reg_argmax_val(8)
  );
  noa22_x1_5_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_7_sig,
    i1 => not_aux4,
    i2 => na2_x1_5_sig,
    nq => noa22_x1_5_sig
  );
  inv_x2_7_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(8),
    nq => inv_x2_7_sig
  );
  na2_x1_5_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_5_sig,
    nq => na2_x1_5_sig
  );
  na3_x1_5_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(8),
    nq => na3_x1_5_sig
  );
  reg_argmax_val_7_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_4_sig,
    q => reg_argmax_val(7)
  );
  noa22_x1_4_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_6_sig,
    i1 => not_aux4,
    i2 => na2_x1_4_sig,
    nq => noa22_x1_4_sig
  );
  inv_x2_6_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(7),
    nq => inv_x2_6_sig
  );
  na2_x1_4_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_4_sig,
    nq => na2_x1_4_sig
  );
  na3_x1_4_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(7),
    nq => na3_x1_4_sig
  );
  reg_argmax_val_6_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_7_sig,
    q => reg_argmax_val(6)
  );
  ao22_x2_7_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(6),
    i2 => ao22_x2_8_sig,
    q => ao22_x2_7_sig
  );
  ao22_x2_8_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(6),
    i2 => not_reset,
    q => ao22_x2_8_sig
  );
  reg_argmax_val_5_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_5_sig,
    q => reg_argmax_val(5)
  );
  ao22_x2_5_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(5),
    i2 => ao22_x2_6_sig,
    q => ao22_x2_5_sig
  );
  ao22_x2_6_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(5),
    i2 => not_reset,
    q => ao22_x2_6_sig
  );
  reg_argmax_val_4_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_3_sig,
    q => reg_argmax_val(4)
  );
  noa22_x1_3_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_5_sig,
    i1 => not_aux4,
    i2 => oa22_x2_sig,
    nq => noa22_x1_3_sig
  );
  inv_x2_5_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(4),
    nq => inv_x2_5_sig
  );
  oa22_x2_ins : oa22_x2
  PORT MAP (
    i1 => not_in_argmax_val(4),
    i0 => not_aux6,
    i2 => reset,
    q => oa22_x2_sig
  );
  reg_argmax_val_3_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_3_sig,
    q => reg_argmax_val(3)
  );
  ao22_x2_3_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(3),
    i2 => ao22_x2_4_sig,
    q => ao22_x2_3_sig
  );
  ao22_x2_4_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(3),
    i2 => not_reset,
    q => ao22_x2_4_sig
  );
  reg_argmax_val_2_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_2_sig,
    q => reg_argmax_val(2)
  );
  noa22_x1_2_ins : noa22_x1
  PORT MAP (
    i0 => inv_x2_4_sig,
    i1 => not_aux4,
    i2 => na2_x1_3_sig,
    nq => noa22_x1_2_sig
  );
  inv_x2_4_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(2),
    nq => inv_x2_4_sig
  );
  na2_x1_3_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_3_sig,
    nq => na2_x1_3_sig
  );
  na3_x1_3_ins : na3_x1
  PORT MAP (
    i0 => c_argmax,
    i1 => not_aux7,
    i2 => not_in_argmax_val(2),
    nq => na3_x1_3_sig
  );
  reg_argmax_val_1_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => ao22_x2_sig,
    q => reg_argmax_val(1)
  );
  ao22_x2_ins : ao22_x2
  PORT MAP (
    i0 => aux5,
    i1 => reg_argmax_val(1),
    i2 => ao22_x2_2_sig,
    q => ao22_x2_sig
  );
  ao22_x2_2_ins : ao22_x2
  PORT MAP (
    i0 => not_aux4,
    i1 => in_argmax_val(1),
    i2 => not_reset,
    q => ao22_x2_2_sig
  );
  reg_argmax_val_0_ins : sff1_x4
  PORT MAP (
    ck => clk,
    i => noa22_x1_sig,
    q => reg_argmax_val(0)
  );
  noa22_x1_ins : noa22_x1
  PORT MAP (
    i0 => not_reg_argmax_val(0),
    i1 => not_aux4,
    i2 => na2_x1_2_sig,
    nq => noa22_x1_sig
  );
  na2_x1_2_ins : na2_x1
  PORT MAP (
    i0 => not_reset,
    i1 => na3_x1_2_sig,
    nq => na2_x1_2_sig
  );
  na3_x1_2_ins : na3_x1
  PORT MAP (
    i0 => not_aux7,
    i1 => c_argmax,
    i2 => not_in_argmax_val(0),
    nq => na3_x1_2_sig
  );
  rtlcarry_2_19_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(18),
    i1 => not_in_argmax_val(18),
    i3 => reg_argmax_val(18),
    i2 => rtlcarry_2(18),
    i4 => rtlcarry_2(18),
    i5 => not_in_argmax_val(18),
    q => rtlcarry_2(19)
  );
  rtlcarry_2_18_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(17),
    i1 => not_in_argmax_val(17),
    i3 => reg_argmax_val(17),
    i2 => rtlcarry_2(17),
    i4 => rtlcarry_2(17),
    i5 => not_in_argmax_val(17),
    q => rtlcarry_2(18)
  );
  rtlcarry_2_17_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(16),
    i1 => not_in_argmax_val(16),
    i3 => reg_argmax_val(16),
    i2 => rtlcarry_2(16),
    i4 => rtlcarry_2(16),
    i5 => not_in_argmax_val(16),
    q => rtlcarry_2(17)
  );
  rtlcarry_2_16_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(15),
    i1 => not_in_argmax_val(15),
    i3 => reg_argmax_val(15),
    i2 => rtlcarry_2(15),
    i4 => rtlcarry_2(15),
    i5 => not_in_argmax_val(15),
    q => rtlcarry_2(16)
  );
  rtlcarry_2_15_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(14),
    i1 => not_in_argmax_val(14),
    i3 => reg_argmax_val(14),
    i2 => rtlcarry_2(14),
    i4 => rtlcarry_2(14),
    i5 => not_in_argmax_val(14),
    q => rtlcarry_2(15)
  );
  rtlcarry_2_14_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(13),
    i1 => not_in_argmax_val(13),
    i3 => reg_argmax_val(13),
    i2 => rtlcarry_2(13),
    i4 => rtlcarry_2(13),
    i5 => not_in_argmax_val(13),
    q => rtlcarry_2(14)
  );
  rtlcarry_2_13_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(12),
    i1 => not_in_argmax_val(12),
    i3 => reg_argmax_val(12),
    i2 => rtlcarry_2(12),
    i4 => rtlcarry_2(12),
    i5 => not_in_argmax_val(12),
    q => rtlcarry_2(13)
  );
  rtlcarry_2_12_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(11),
    i1 => not_in_argmax_val(11),
    i3 => reg_argmax_val(11),
    i2 => rtlcarry_2(11),
    i4 => rtlcarry_2(11),
    i5 => not_in_argmax_val(11),
    q => rtlcarry_2(12)
  );
  rtlcarry_2_11_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(10),
    i1 => not_in_argmax_val(10),
    i3 => reg_argmax_val(10),
    i2 => rtlcarry_2(10),
    i4 => rtlcarry_2(10),
    i5 => not_in_argmax_val(10),
    q => rtlcarry_2(11)
  );
  rtlcarry_2_10_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(9),
    i1 => not_in_argmax_val(9),
    i3 => reg_argmax_val(9),
    i2 => rtlcarry_2(9),
    i4 => rtlcarry_2(9),
    i5 => not_in_argmax_val(9),
    q => rtlcarry_2(10)
  );
  rtlcarry_2_9_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(8),
    i1 => not_in_argmax_val(8),
    i3 => reg_argmax_val(8),
    i2 => rtlcarry_2(8),
    i4 => rtlcarry_2(8),
    i5 => not_in_argmax_val(8),
    q => rtlcarry_2(9)
  );
  rtlcarry_2_8_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(7),
    i1 => not_in_argmax_val(7),
    i3 => reg_argmax_val(7),
    i2 => rtlcarry_2(7),
    i4 => rtlcarry_2(7),
    i5 => not_in_argmax_val(7),
    q => rtlcarry_2(8)
  );
  rtlcarry_2_7_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(6),
    i1 => not_in_argmax_val(6),
    i3 => reg_argmax_val(6),
    i2 => rtlcarry_2(6),
    i4 => rtlcarry_2(6),
    i5 => not_in_argmax_val(6),
    q => rtlcarry_2(7)
  );
  rtlcarry_2_6_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(5),
    i1 => not_in_argmax_val(5),
    i3 => reg_argmax_val(5),
    i2 => rtlcarry_2(5),
    i4 => rtlcarry_2(5),
    i5 => not_in_argmax_val(5),
    q => rtlcarry_2(6)
  );
  rtlcarry_2_5_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(4),
    i1 => not_in_argmax_val(4),
    i3 => reg_argmax_val(4),
    i2 => rtlcarry_2(4),
    i4 => rtlcarry_2(4),
    i5 => not_in_argmax_val(4),
    q => rtlcarry_2(5)
  );
  rtlcarry_2_4_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(3),
    i1 => not_in_argmax_val(3),
    i3 => reg_argmax_val(3),
    i2 => rtlcarry_2(3),
    i4 => rtlcarry_2(3),
    i5 => not_in_argmax_val(3),
    q => rtlcarry_2(4)
  );
  rtlcarry_2_3_ins : oa2a2a23_x2
  PORT MAP (
    i0 => reg_argmax_val(2),
    i1 => not_in_argmax_val(2),
    i3 => reg_argmax_val(2),
    i2 => rtlcarry_2(2),
    i4 => rtlcarry_2(2),
    i5 => not_in_argmax_val(2),
    q => rtlcarry_2(3)
  );
  rtlcarry_2_2_ins : oa2ao222_x2
  PORT MAP (
    i0 => reg_argmax_val(1),
    i1 => inv_x2_3_sig,
    i2 => inv_x2_2_sig,
    i3 => reg_argmax_val(1),
    i4 => na3_x1_sig,
    q => rtlcarry_2(2)
  );
  inv_x2_3_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(1),
    nq => inv_x2_3_sig
  );
  inv_x2_2_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(1),
    nq => inv_x2_2_sig
  );
  na3_x1_ins : na3_x1
  PORT MAP (
    i0 => in_argmax_val(0),
    i1 => not_reg_argmax_val(0),
    i2 => na2_x1_sig,
    nq => na3_x1_sig
  );
  na2_x1_ins : na2_x1
  PORT MAP (
    i0 => not_in_argmax_val(0),
    i1 => reg_argmax_val(0),
    nq => na2_x1_sig
  );
  aux5_ins : no2_x1
  PORT MAP (
    i0 => reset,
    i1 => not_aux4,
    nq => aux5
  );
  not_in_argmax_val_0_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(0),
    nq => not_in_argmax_val(0)
  );
  not_in_argmax_val_2_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(2),
    nq => not_in_argmax_val(2)
  );
  not_in_argmax_val_3_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(3),
    nq => not_in_argmax_val(3)
  );
  not_in_argmax_val_4_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(4),
    nq => not_in_argmax_val(4)
  );
  not_in_argmax_val_5_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(5),
    nq => not_in_argmax_val(5)
  );
  not_in_argmax_val_6_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(6),
    nq => not_in_argmax_val(6)
  );
  not_in_argmax_val_7_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(7),
    nq => not_in_argmax_val(7)
  );
  not_in_argmax_val_8_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(8),
    nq => not_in_argmax_val(8)
  );
  not_in_argmax_val_9_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(9),
    nq => not_in_argmax_val(9)
  );
  not_in_argmax_val_10_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(10),
    nq => not_in_argmax_val(10)
  );
  not_in_argmax_val_11_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(11),
    nq => not_in_argmax_val(11)
  );
  not_in_argmax_val_12_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(12),
    nq => not_in_argmax_val(12)
  );
  not_in_argmax_val_13_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(13),
    nq => not_in_argmax_val(13)
  );
  not_in_argmax_val_14_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(14),
    nq => not_in_argmax_val(14)
  );
  not_in_argmax_val_15_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(15),
    nq => not_in_argmax_val(15)
  );
  not_in_argmax_val_16_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(16),
    nq => not_in_argmax_val(16)
  );
  not_in_argmax_val_17_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(17),
    nq => not_in_argmax_val(17)
  );
  not_in_argmax_val_18_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(18),
    nq => not_in_argmax_val(18)
  );
  not_in_argmax_val_19_ins : inv_x2
  PORT MAP (
    i => in_argmax_val(19),
    nq => not_in_argmax_val(19)
  );
  not_reset_ins : inv_x2
  PORT MAP (
    i => reset,
    nq => not_reset
  );
  not_reg_argmax_val_0_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(0),
    nq => not_reg_argmax_val(0)
  );
  not_rtlcarry_2_20_ins : noa2a2a23_x1
  PORT MAP (
    i0 => reg_argmax_val(19),
    i1 => not_in_argmax_val(19),
    i3 => reg_argmax_val(19),
    i2 => rtlcarry_2(19),
    i4 => rtlcarry_2(19),
    i5 => not_in_argmax_val(19),
    nq => not_rtlcarry_2(20)
  );
  not_reg_argmax_val_20_ins : inv_x2
  PORT MAP (
    i => reg_argmax_val(20),
    nq => not_reg_argmax_val(20)
  );
  not_aux0_ins : no2_x1
  PORT MAP (
    i1 => not_rtlcarry_2(20),
    i0 => not_reg_argmax_val(20),
    nq => not_aux0
  );
  not_aux2_ins : noa22_x1
  PORT MAP (
    i1 => not_reg_argmax_val(20),
    i0 => not_rtlcarry_2(20),
    i2 => in_argmax_val(20),
    nq => not_aux2
  );
  not_aux4_ins : o3_x4
  PORT MAP (
    i0 => not_aux0,
    i2 => not_aux2,
    i1 => inv_x2_sig,
    q => not_aux4
  );
  inv_x2_ins : inv_x2
  PORT MAP (
    i => c_argmax,
    nq => inv_x2_sig
  );
  not_aux7_ins : no2_x1
  PORT MAP (
    i0 => not_aux0,
    i1 => mbk_buf_not_aux2,
    nq => not_aux7
  );
  not_aux6_ins : na2_x1
  PORT MAP (
    i1 => not_aux4,
    i0 => not_reset,
    nq => not_aux6
  );
END RTL;



-- Configuration for sxlib/VITAL library...
library sxlib;
use sxlib.vcomponents.all;

configuration CFG_argmax_final of argmax_final is
  for RTL
    for all: buf_x2 use entity sxlib.buf_x2(vital); end for;
    for all: sff1_x4 use entity sxlib.sff1_x4(vital); end for;
    for all: noa22_x1 use entity sxlib.noa22_x1(vital); end for;
    for all: inv_x2 use entity sxlib.inv_x2(vital); end for;
    for all: na2_x1 use entity sxlib.na2_x1(vital); end for;
    for all: na3_x1 use entity sxlib.na3_x1(vital); end for;
    for all: nao22_x1 use entity sxlib.nao22_x1(vital); end for;
    for all: ao22_x2 use entity sxlib.ao22_x2(vital); end for;
    for all: oa22_x2 use entity sxlib.oa22_x2(vital); end for;
    for all: oa2a2a23_x2 use entity sxlib.oa2a2a23_x2(vital); end for;
    for all: oa2ao222_x2 use entity sxlib.oa2ao222_x2(vital); end for;
    for all: no2_x1 use entity sxlib.no2_x1(vital); end for;
    for all: noa2a2a23_x1 use entity sxlib.noa2a2a23_x1(vital); end for;
    for all: o3_x4 use entity sxlib.o3_x4(vital); end for;
  end for;
end CFG_argmax_final;
