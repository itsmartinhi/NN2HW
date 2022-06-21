library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MULTBLOCK is
port (
	c_mult: 	in 	std_logic;
	in_weights: in 	std_logic_vector(31 downto 0);
	in_inputs:  in 	std_logic_vector(11 downto 0);
	out_val:	out std_logic_vector(12 downto 0)
);
end MULTBLOCK;

architecture RTL of MULTBLOCK is

    component MULTIPLIER is
		port (
			A: in  std_logic_vector(7 downto 0);
			B: in  std_logic_vector(2 downto 0);	
			S: out std_logic_vector(10 downto 0)
		);
	end component;
	
	for all: MULTIPLIER use entity WORK.MULTIPLIER(BEHAVOR);
	
	signal mult_out_1, mult_out_2, mult_out_3, mult_out_4 : std_logic_vector(10 downto 0);
	
begin

	MULT_1: MULTIPLIER port map (
		A => in_weights(7 downto 0),
		B => in_inputs(2 downto 0),
		S => mult_out_1(10 downto 0)
	);
	
	MULT_2: MULTIPLIER port map (
		A => in_weights(15 downto 8),
		B => in_inputs(5 downto 3),
		S => mult_out_2(10 downto 0)
	);
	
	MULT_3: MULTIPLIER port map (
		A => in_weights(23 downto 16),
		B => in_inputs(8 downto 6),
		S => mult_out_3(10 downto 0)
	);
	
	MULT_4: MULTIPLIER port map (
		A => in_weights(31 downto 24),
		B => in_inputs(11 downto 9),
		S => mult_out_4(10 downto 0)
	);
		
	process(c_mult, mult_out_1, mult_out_2, mult_out_3, mult_out_4)
	begin
		if c_mult = '1' then
			out_val <= std_logic_vector(
				unsigned(mult_out_1) + 
				unsigned(mult_out_2) + 
				unsigned(mult_out_3) + 
				unsigned(mult_out_4) +
				"0000000000000" -- HELP! not a beautiful padding method for dynamic vector lengths
			);
		end if;
	end process;
end RTL;
