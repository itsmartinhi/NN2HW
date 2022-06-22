library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONDEC_TB is 
end NEURONDEC_TB;

architecture TESTBENCH of NEURONDEC_TB is

component NEURONDEC is
	port (
	   clk: 			 in  std_logic;
	   c_neuron_dec:  	 in  std_logic;
       out_neuron_indx:  out std_logic_vector(4 downto 0);
       out_neuron_reset: out std_logic
	);
end component NEURONDEC;

for SPEC: NEURONDEC use entity WORK.NEURONDEC(RTL);

signal clk: 			  std_logic;
signal c_neuron_dec:  	  std_logic;
signal spec_neuron_indx:  std_logic_vector(4 downto 0);
signal spec_neuron_reset: std_logic;
signal tb_count: 		  std_logic_vector(4 downto 0);

begin
	SPEC: NEURONDEC port map ( 
		clk 			 => clk,
		c_neuron_dec 	 => c_neuron_dec,
		out_neuron_indx  => spec_neuron_indx,
		out_neuron_reset => spec_neuron_reset
	);

	process 
		constant period: time := 4 ns;
		procedure run_cycle is
			begin
				clk <= '0'; 
				wait for period;
				clk <= '1';
				wait for period;
			end procedure;
	begin
	
		c_neuron_dec <= '1';
		tb_count <= "01001";
		for i in 0 to 9 loop 
			run_cycle;
			tb_count <= std_logic_vector(signed(tb_count) - 1);
			assert spec_neuron_indx = tb_count report "tb failed on increment:" & integer'image(i);
			assert spec_neuron_reset = '0' report "reset signal is not 0 while looping on increment:" & integer'image(i);
		end loop;
		run_cycle;
		tb_count <= std_logic_vector(signed(tb_count) - 1);
		assert spec_neuron_reset = '1' report "reset not set";
		run_cycle;
		assert spec_neuron_indx = "01001" report "count didnt got reseted";
		
		
		report "tb finished OK";
		wait;
		
	end process;
	
end architecture;
