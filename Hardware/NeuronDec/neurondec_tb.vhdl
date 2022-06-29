library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONDEC_TB is 
end NEURONDEC_TB;

architecture TESTBENCH of NEURONDEC_TB is

component NEURONDEC is
	port (
		reset: 				in 	std_logic;
		clk: 			 	in  std_logic;
		c_neuron_dec:  		in  std_logic;
		out_neuron_index:  	out std_logic_vector(3 downto 0);
		out_neuron_reset: 	out std_logic
	);
end component NEURONDEC;

for SPEC: NEURONDEC use entity WORK.NEURONDEC(RTL);

signal reset: 			 	std_logic;
signal clk: 			  	std_logic;
signal c_neuron_dec:  	  	std_logic;
signal spec_neuron_index:  	std_logic_vector(3 downto 0);
signal spec_neuron_reset: 	std_logic;
signal tb_count: 		  	std_logic_vector(4 downto 0);

begin
	SPEC: NEURONDEC port map ( 
		reset				=> reset,
		clk 			 	=> clk,
		c_neuron_dec 	 	=> c_neuron_dec,
		out_neuron_index  	=> spec_neuron_index,
		out_neuron_reset 	=> spec_neuron_reset
	);

	process 
		constant period: time := 1 ns;
		procedure run_cycle is
			begin
				clk <= '0'; 
				wait for period;
				clk <= '1';
				wait for period;
			end procedure;
	begin
	
		reset <= '1';
		run_cycle;
		reset <= '0';
	
		c_neuron_dec <= '1';
		tb_count <= "01000";
		for i in 0 to 8 loop 
			run_cycle;
			tb_count <= std_logic_vector(signed(tb_count) - 1);
			assert spec_neuron_index = tb_count(3 downto 0) report "tb failed on increment:" & integer'image(i);
			assert spec_neuron_reset = '0' report "reset signal is not 0 while looping on increment:" & integer'image(i);
		end loop;
		run_cycle;
		tb_count <= std_logic_vector(signed(tb_count) - 1);
		assert spec_neuron_reset = '1' report "reset not set";
		run_cycle;
		assert spec_neuron_index = "1000" report "count didnt got reseted";
		
		
		report "tb finished OK";
		wait;
		
	end process;
	
end architecture;
