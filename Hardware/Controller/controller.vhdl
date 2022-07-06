library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONTROLLER is
	port (
		 clk:				    in  std_logic;
		 reset:                 in  std_logic;
		 in_ctrl_neuron_reset:  in  std_logic; 
		 in_ctrl_input_reset:	in  std_logic;
		 c_dec_neuron: 		    out std_logic;
		 c_dec_input: 		    out std_logic;
		 c_add_to_neuron:	    out std_logic;
		 c_reset_register:		out std_logic;
		 c_argmax: 			    out std_logic;
		 halt: 					out std_logic
	);
end CONTROLLER;

architecture RTL of CONTROLLER is
	 type t_state is (S_RESET, S_MULT, S_INPUT_DEC, S_NEURON_REG, S_NEURON_DEC, S_ARGMAX, S_HALT);
	 signal state, next_state: t_state;
begin

	process(clk) 
	begin
		if rising_edge (clk) then
			if reset = '1' 
				then state <= S_RESET;
				else state <= next_state;
			end if;
		end if;
	end process;
	
	process(state, in_ctrl_neuron_reset, in_ctrl_input_reset) 
	begin
	
		-- For Synthefication
		c_dec_neuron 		 <= '0';
		c_dec_input 		 <= '0';
		c_add_to_neuron 	 <= '0';
		c_argmax 			 <= '0';
		c_reset_register     <= '0';
		halt 				 <= '0';
		
		case state is 
			when S_RESET => 
					c_dec_neuron 		 <= '0';
					c_dec_input 		 <= '0';
					c_add_to_neuron 	 <= '0';
					c_argmax 			 <= '0';
					c_reset_register     <= '0';
					halt 				 <= '0';
					next_state 			 <= S_NEURON_REG;
			when S_MULT => 
					next_state 		 <= S_NEURON_REG;
			when S_NEURON_REG =>
					c_add_to_neuron  <= '1';
					next_state 		 <= S_INPUT_DEC;
			when S_INPUT_DEC =>
					c_dec_input 	<= '1';
					c_add_to_neuron	<= '0';
					if in_ctrl_input_reset = '1' 
						then next_state <= S_ARGMAX;
						else next_state <= S_MULT;		
					end if;
			when S_ARGMAX => 
					c_argmax    <= '1';
					c_dec_input <= '0';
					next_state  <= S_NEURON_DEC;
			when S_NEURON_DEC => 
					c_reset_register <= '1';
					c_dec_neuron 	 <= '1';
					c_argmax 	 	 <= '0';
					if in_ctrl_neuron_reset = '1' 
						then next_state <= S_HALT;
						else next_state <= S_MULT;
					end if;
			when S_HALT =>
					c_reset_register <= '0';
					c_dec_neuron 	 <= '0';
					halt <= '1';
					next_state <= S_HALT;
			when others => 
					next_state <= S_HALT;		
		end case;
	end process;
end RTL;

