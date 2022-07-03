library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MULTBLOCK is
port (
	in_data_rom: 	in 	std_logic_vector(31 downto 0);
	in_data_ram:  	in 	std_logic_vector(11 downto 0);
	out_mult_val:	out std_logic_vector(12 downto 0)
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
	
	for all: MULTIPLIER use entity WORK.MULTIPLIER(STRUCTURE);
	
	signal mult_out_1, mult_out_2, mult_out_3, mult_out_4 : std_logic_vector(10 downto 0);
	
begin

	MULT_1: MULTIPLIER port map (
		A => in_data_rom(7 downto 0),
		B => in_data_ram(2 downto 0),
		S => mult_out_1(10 downto 0)
	);
	
	MULT_2: MULTIPLIER port map (
		A => in_data_rom(15 downto 8),
		B => in_data_ram(5 downto 3),
		S => mult_out_2(10 downto 0)
	);
	
	MULT_3: MULTIPLIER port map (
		A => in_data_rom(23 downto 16),
		B => in_data_ram(8 downto 6),
		S => mult_out_3(10 downto 0)
	);
	
	MULT_4: MULTIPLIER port map (
		A => in_data_rom(31 downto 24),
		B => in_data_ram(11 downto 9),
		S => mult_out_4(10 downto 0)
	);

	out_mult_val <= std_logic_vector(
		("00" & unsigned(mult_out_1)) + 
		("00" & unsigned(mult_out_2)) + 
		("00" & unsigned(mult_out_3)) + 
		("00" & unsigned(mult_out_4)) 
	);
end RTL;
