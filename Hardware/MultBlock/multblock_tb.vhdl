library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MULTBLOCK_TB is 
end MULTBLOCK_TB;

architecture TESTBENCH of MULTBLOCK_TB is

component MULTBLOCK is
	port (
		in_data_rom: 	in 	std_logic_vector(31 downto 0);
		in_data_ram:  	in 	std_logic_vector(11 downto 0);
		out_mult_val:	out std_logic_vector(12 downto 0)
		);
end component;

for SPEC: MULTBLOCK use entity WORK.MULTBLOCK(RTL);

signal in_data_rom: 	std_logic_vector(31 downto 0);
signal in_data_ram:    	std_logic_vector(11 downto 0);
signal out_val_spec: 	std_logic_vector(12 downto 0);

begin 

 	SPEC: MULTBLOCK port map ( 
		in_data_rom		=> in_data_rom,
		in_data_ram  	=> in_data_ram,
		out_mult_val    => out_val_spec
	);
	
	process 
	begin
		in_data_rom <= "11101101001110110101111100001100";
		in_data_ram <= "110101000111";
		wait for 10 ns;
		assert out_val_spec = "0011100001001" report "10110001110 + 00100100111 + 00000000000 + 00001010100 should be 11100001001";
		
		in_data_rom <= "11111111111111111111111111111111";
		in_data_ram <= "111111111111";
		wait for 10 ns;
		assert out_val_spec = "1101111100100" report "11111111111111111111111111111111 multblock 111111111111  should be 1101111100100";
		
		report "multblock tb finished OK";
		wait;	
	end process;

end architecture;
