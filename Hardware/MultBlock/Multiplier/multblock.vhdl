LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY MULTBLOCK IS
	PORT (
		in_data_rom : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_data_ram : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		out_mult_val : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
	);
END MULTBLOCK;

ARCHITECTURE Structure OF MULTBLOCK IS

	COMPONENT MULTIPLIER
		PORT (
			A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			S : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT ElevenBitAdder
		PORT (
			a : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			b : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			s : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT TwelveBitAdder
		PORT (
			a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			b : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			s : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
		);
	END COMPONENT;

	-- FOR ALL : MULTIPLIER USE ENTITY WORK.MULTIPLIER(STRUCTURE);

	SIGNAL mult_out_1, mult_out_2, mult_out_3, mult_out_4 : STD_LOGIC_VECTOR(10 DOWNTO 0);
	SIGNAL adder_11_out_1, adder_11_out_2 : STD_LOGIC_VECTOR (11 DOWNTO 0);

BEGIN

	MULT_1 : MULTIPLIER PORT MAP(
		A => in_data_rom(7 DOWNTO 0),
		B => in_data_ram(2 DOWNTO 0),
		S => mult_out_1(10 DOWNTO 0)
	);

	MULT_2 : MULTIPLIER PORT MAP(
		A => in_data_rom(15 DOWNTO 8),
		B => in_data_ram(5 DOWNTO 3),
		S => mult_out_2(10 DOWNTO 0)
	);

	MULT_3 : MULTIPLIER PORT MAP(
		A => in_data_rom(23 DOWNTO 16),
		B => in_data_ram(8 DOWNTO 6),
		S => mult_out_3(10 DOWNTO 0)
	);

	MULT_4 : MULTIPLIER PORT MAP(
		A => in_data_rom(31 DOWNTO 24),
		B => in_data_ram(11 DOWNTO 9),
		S => mult_out_4(10 DOWNTO 0)
	);

	ADDER1 : ElevenBitAdder PORT MAP(
		A => mult_out_1(10 DOWNTO 0)
		B => mult_out_2(10 DOWNTO 0)
		S => adder_11_out_1(11 DOWNTO 0)
	);

	ADDER2 : ElevenBitAdder PORT MAP(
		A => mult_out_3(10 DOWNTO 0)
		B => mult_out_4(10 DOWNTO 0)
		S => adder_11_out_2(11 DOWNTO 0)
	);

	ADDER3 : TwelveBitAdder PORT MAP(
		A => adder_11_out_1(11 DOWNTO 0)
		B => adder_11_out_2(11 DOWNTO 0)
		S => out_mult_val(12 DOWNTO 0)
	);

END Structure;