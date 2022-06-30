LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY MULTBLOCK_TB IS
END MULTBLOCK_TB;

ARCHITECTURE TESTBENCH OF MULTBLOCK_TB IS

	COMPONENT MULTBLOCK IS
		PORT (
			c_mult : IN STD_LOGIC;
			in_weights : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in_inputs : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			out_val : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
		);
	END COMPONENT;

	FOR SPEC : MULTBLOCK USE ENTITY WORK.MULTBLOCK(RTL);

	SIGNAL c_mult : STD_LOGIC;
	SIGNAL in_weights : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL in_inputs : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL out_val_spec : STD_LOGIC_VECTOR(12 DOWNTO 0);

BEGIN

	SPEC : MULTBLOCK PORT MAP(
		c_mult => c_mult,
		in_weights => in_weights,
		in_inputs => in_inputs,
		out_val => out_val_spec
	);

	PROCESS
		PROCEDURE run_cycle IS
		BEGIN
			c_mult <= '0';
			WAIT FOR 1 ns;
			c_mult <= '1';
			WAIT FOR 80 ns; -- find critical path! 
		END PROCEDURE;
	BEGIN
		in_weights <= "11101101001110110101111100001100";
		in_inputs <= "110101000111";
		run_cycle;
		ASSERT out_val_spec = "0011100001001" REPORT "10110001110 + 00100100111 + 00000000000 + 00001010100 should be 11100001001";

		in_weights <= "11111111111111111111111111111111";
		in_inputs <= "111111111111";
		run_cycle;
		ASSERT out_val_spec = "1101111100100" REPORT "11111111111111111111111111111111 multblock 111111111111  should be 1101111100100";

		REPORT "multblock tb finished OK";
		WAIT;
	END PROCESS;

END ARCHITECTURE;