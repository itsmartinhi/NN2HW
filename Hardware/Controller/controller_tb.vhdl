library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONTROLLER_TB is 
end CONTROLLER_TB;

architecture TESTBENCH of CONTROLLER_TB is

component CONTROLLER is
	port (
		 clk:				    in  std_logic;
		 reset:                 in  std_logic;
		 in_ctrl_neuron_index:  in  std_logic_vector(3 downto 0);
		 in_ctrl_neuron_reset:  in  std_logic; 
		 in_ctrl_input_reset:	in  std_logic;
		 c_dec_neuron: 		    out std_logic;
		 c_dec_input: 		    out std_logic;
		 c_mult: 			    out std_logic;
		 c_add_to_neuron:	    out std_logic;
		 c_argmax: 			    out std_logic;
		 c_halt: 				out std_logic;
		 out_ctrl_neuron_index: out std_logic_vector(3 downto 0)
	);
end component CONTROLLER;

for SPEC: CONTROLLER use entity WORK.CONTROLLER(RTL);

signal clk:				    	std_logic;
signal reset:                 	std_logic;
signal in_ctrl_neuron_index:  	std_logic_vector(3 downto 0);
signal in_ctrl_neuron_reset:  	std_logic; 
signal in_ctrl_input_reset:		std_logic;
signal c_dec_neuron: 		    std_logic;
signal c_dec_input: 		    std_logic;
signal c_mult: 			    	std_logic;
signal c_add_to_neuron:	     	std_logic;
signal c_argmax: 			  	std_logic;
signal spec_halt: 				std_logic;
signal spec_ctrl_neuron_index: 	std_logic_vector(3 downto 0);

begin
	SPEC: CONTROLLER port map ( 
		clk 					=> clk,
		reset 					=> reset,
		in_ctrl_neuron_index 	=> in_ctrl_neuron_index,
		in_ctrl_neuron_reset 	=> in_ctrl_neuron_reset,
		in_ctrl_input_reset 	=> in_ctrl_input_reset,
		c_dec_neuron 			=> c_dec_neuron,
		c_dec_input				=> c_dec_input,
		c_mult					=> c_mult,
		c_add_to_neuron			=> c_add_to_neuron,
		c_argmax				=> c_argmax,
		c_halt 					=> spec_halt,
		out_ctrl_neuron_index	=> spec_ctrl_neuron_index
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
	
	
		for i in 0 to 100000 loop 
			exit when spec_halt = '1';
			run_cycle;
		end loop;
	
		
		report "tb finished OK";
		wait;
		
	end process;
end architecture;
