library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONTROLLER is
	port (
		 in_ctrl_inp_indx: 	   in  std_logic_vector(9 downto 0);
		 in_ctrl_neuron_indx:  in  std_logic_vector(3 downto 0);
		 c_dec_neuron: 		   out std_logic;
		 c_dec_input: 		   out std_logic;
		 c_mult: 			   out std_logic;
		 c_add_to_neuron:	   out std_logic;
		 c_argmax: 			   out std_logic;
		 clk:				   out std_logic;
		 out_ctrl_neuron_indx: out std_logic_vector(3 downto 0);
	);
end CONTROLLER;

architecture RTL of CONTROLLER is
begin
	process()
	begin
		-- big stuff is coming here!
	end process;
end RTL;
