library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MULTBLOCK_TB is 
end MULTBLOCK_TB;

architecture TESTBENCH of MULTBLOCK_TB is

component MULTBLOCK is
	port (
		c_mult: 	in 	std_logic;
		in_weights: in 	std_logic_vector(31 downto 0);
		in_inputs:  in 	std_logic_vector(11 downto 0);
		out_val:	out std_logic_vector(12 downto 0)
		);
end component;

for SPEC: MULTBLOCK use entity WORK.MULTBLOCK(RTL);

signal c_mult: 		 std_logic;
signal in_weights: 	 std_logic_vector(31 downto 0);
signal in_inputs:    std_logic_vector(11 downto 0);
signal out_val_spec: std_logic_vector(12 downto 0);

begin 

 	SPEC: MULTBLOCK port map ( 
		c_mult 	   => c_mult,
		in_weights => in_weights,
		in_inputs  => in_inputs,
		out_val    => out_val_spec
	);
	
	process 
		procedure run_cycle is
			begin
				c_mult <= '0'; 
				wait for 5 ns;
				c_mult <= '1';
				wait for 45 ns; -- find critical path! 
			end procedure;
	begin
		in_weights <= "11101101001110110101111100001100";
		in_inputs  <= "110101000111";
		run_cycle;
		assert out_val_spec = "0011100001001" report "10110001110 + 00100100111 + 00000000000 + 00001010100 should be 11100001001";
		report "multblock tb finished OK";
		wait;
	end process;

end architecture;
