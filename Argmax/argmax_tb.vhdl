library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARGMAX_TB is 
end ARGMAX_TB;

architecture TESTBENCH of ARGMAX_TB is

component ARGMAX is
	port (
		in_neuron_val: in std_logic_vector(25 downto 0); -- needs to get decreased!	
		in_neuron_indx: in std_logic_vector(7 downto 0);
		out_indx: out std_logic_vector(7 downto 0);			
		c_argmax: in std_logic		
		);
end component;

for SPEC: ARGMAX use entity WORK.ARGMAX(RTL);

signal c_argmax: std_logic;
signal in_neuron_val: std_logic_vector(25 downto 0);	
signal in_neuron_indx: std_logic_vector(7 downto 0);
signal out_indx_spec: std_logic_vector(7 downto 0);

begin

	-- Port Mapping
	
	SPEC: ARGMAX port map ( 
		c_argmax => c_argmax,
		in_neuron_val => in_neuron_val,
		in_neuron_indx => in_neuron_indx,
		out_indx => out_indx_spec
	);

	process 
		constant period: time := 5 ns;
		procedure run_cycle is
			begin
				c_argmax <= '0'; 
				wait for period;
				c_argmax <= '1';
				wait for period;
			end procedure;
	begin
		in_neuron_val <= "00000000000000000000000000";
		in_neuron_indx <= "00000000";
		run_cycle;
		assert out_indx_spec = in_neuron_indx report "Test 1 failed";
		
		in_neuron_val <= "00011000000000000000000000";
		in_neuron_indx <= "00000001";
		run_cycle;
		assert out_indx_spec = in_neuron_indx report "Test 2 failed";
		
		in_neuron_val <= "00001100000000000000000000";
		in_neuron_indx <= "00000011";
		run_cycle;
		assert out_indx_spec /= in_neuron_indx report "Test 3 failed";
		
		report "argmax tb finished OK";
		wait;
	end process;
	
end architecture;

