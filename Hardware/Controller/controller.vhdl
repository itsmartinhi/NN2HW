library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONTROLLER is
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
		 out_ctrl_neuron_index: out std_logic_vector(3 downto 0)
	);
end CONTROLLER;

architecture RTL of CONTROLLER is
	 type t_state is (S_RESET, INPUT_DEC, MULT, NEURON_REG, NEURON_DEC, ARGMAX, HALT);
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
	
	process(state) -- fires only on state change -> so i can safely wait
	begin
		 
		case state is 
			when S_RESET => 
				c_dec_neuron 		 <= '0';
				c_dec_input 		 <= '0';
				c_mult 				 <= '0';
				c_add_to_neuron 	 <= '0';
				c_argmax 			 <= '0';
				next_state 			 <= INPUT_DEC;
			when MULT =>
					c_dec_input  <= '0';
					c_dec_neuron <= '0';
					-- wait for RAM, ROM changing its storage adresses
					c_mult 		 <= '1' 	   after 50 ns;
					next_state   <= NEURON_REG after 50 ns;
			when NEURON_REG =>
					-- wait for multiplication
					c_add_to_neuron <= '1' 		 after 50 ns;
					c_mult 	   		<= '0' 		 after 50 ns;
					next_state 		<= INPUT_DEC after 50 ns;
			when INPUT_DEC =>
					c_dec_input 	<= '1';
					c_add_to_neuron	<= '0';
					if in_ctrl_input_reset = '1' 
						then next_state <= ARGMAX;
						else next_state <= MULT;		
					end if;
			when ARGMAX => 
					c_argmax    <= '1';
					c_dec_input <= '0';
					next_state  <= NEURON_DEC;
			when NEURON_DEC => 
					c_dec_neuron <= '1';
					c_argmax 	 <= '0';
					if in_ctrl_neuron_reset = '1' 
						then next_state <= HALT;
						else next_state <= MULT;
					end if;
			when others => null;		
		end case;
	end process;
end RTL;

