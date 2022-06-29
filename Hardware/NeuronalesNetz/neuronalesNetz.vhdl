LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity NEURONALESNETZ is
	port (
		clk: 		in  std_logic;
		reset: 		in 	std_logic;
		halt: 		out std_logic;
		out_result: out std_logic_vector(9 downto 0)
	);
end NEURONALESNETZ;

architecture RTL of NEURONALESNETZ is

	-- components

    component CONTROLLER IS
		port (
			clk:				    in  std_logic;
			reset:                 	in  std_logic;
			in_ctrl_neuron_reset:  	in  std_logic; 
			in_ctrl_input_reset:	in  std_logic;
			c_dec_neuron: 		    out std_logic;
			c_dec_input: 		    out std_logic;
			c_mult: 			    out std_logic;
			c_add_to_neuron:	    out std_logic;
			c_argmax: 			    out std_logic;
			halt: 					out std_logic
		);
	end component;

    component INPUTDECREMENTER IS
        port (
		   reset: 		    in  std_logic;
		   clk: 		    in  std_logic;
		   c_input_dec:  	in  std_logic;
		   out_input_index: out std_logic_vector(7 downto 0);
		   out_input_reset: out std_logic
		);
    end component;

    component NEURONDECREMENTER is
		port (
			reset: 				in 	std_logic;
			clk: 			 	in  std_logic;
			c_neuron_dec:  		in  std_logic;
			out_neuron_index:  	out std_logic_vector(3 downto 0);
			out_neuron_reset: 	out std_logic
		);
    end component;

    component MULTBLOCK is
        port (
			c_mult: 		in 	std_logic;
			in_weights: 	in 	std_logic_vector(31 downto 0);
			in_inputs:  	in 	std_logic_vector(11 downto 0);
			out_mult_val:	out std_logic_vector(12 downto 0)
		);
    end component;

    component NEURONREGISTER is
        port (
			clk: 			in 	std_logic;
			reset: 			in 	std_logic;
			c_nreg: 		in 	std_logic;						
			in_nreg_val: 	in 	std_logic_vector(12 downto 0);
			out_nreg_val: 	out std_logic_vector(20 downto 0)
		);
    end component;

    component ARGMAX is
        port (
            clk:			  in  std_logic;
			c_argmax: 		  in  std_logic;						
			in_argmax_val: 	  in  std_logic_vector(20 downto 0);	
			in_argmax_index:  in  std_logic_vector(3 downto 0);
			out_argmax_index: out std_logic_vector(3 downto 0)
        );
    end component;

	component RAM is
		port (
			in_ram_input_index: in  std_logic_vector(7 downto 0);
			out_inputs: 		out std_logic_vector(11 downto 0)
		);
	end component;
	
	component ROM is 
		port (
			in_rom_input_index: 	in  std_logic_vector(7 downto 0);
			in_rom_neuron_index: 	in  std_logic_vector(3 downto 0);
			out_weights: 			out std_logic_vector(31 downto 0)
		);
	end component;
	

    for all : CONTROLLER 		use entity WORK.CONTROLLER(RTL);
    for all : INPUTDECREMENTER 	use entity WORK.INPDEC(RTL);
    for all : NEURONDECREMENTER use entity WORK.NEURONDEC(RTL);
    for all : NEURONREGISTER 	use entity WORK.NEURONREG(RTL);
    for all : ARGMAX 			use entity WORK.ARGMAX(RTL);
    for all : MULTBLOCK			use entity WORK.MULTBLOCK(RTL);


    -- internal signals
    
    -- CONTROLLER
	signal c_dec_neuron: 	std_logic;
	signal c_dec_input:		std_logic;
	signal c_mult: 			std_logic;
	signal c_add_to_neuron:	std_logic;
	signal c_argmax: 		std_logic;

    -- INPUTDECREMENTER
    signal out_input_index: std_logic_vector(7 downto 0);
	signal out_input_reset: std_logic;

    -- NEURONDECREMENTER
	signal out_neuron_index: std_logic_vector(3 downto 0);
	signal out_neuron_reset: std_logic;

    -- MULTBLOCK
    signal out_mult_val: std_logic_vector(12 downto 0);

    -- NEURONREGISTER
    signal out_nreg_val: std_logic_vector(20 downto 0);

    -- ARGMAX
    signal out_argmax_index: std_logic_vector(3 downto 0);
    
    -- RAM
    signal out_inputs: std_logic_vector(11 downto 0);
    
	-- ROM 
	signal out_weights: std_logic_vector(31 downto 0);
   
begin
	-- port mapping
	
	U_CONTROLLER: CONTROLLER port map ( 
		clk 					=> clk,
		reset 					=> reset,
		in_ctrl_neuron_reset 	=> out_neuron_reset,
		in_ctrl_input_reset 	=> out_input_reset,
		c_dec_neuron 			=> c_dec_neuron,
		c_dec_input				=> c_dec_input,
		c_mult					=> c_mult,
		c_add_to_neuron			=> c_add_to_neuron,
		c_argmax				=> c_argmax,
		halt 					=> halt
	);

    U_INPUTDECREMENTER: INPUTDECREMENTER port map ( 
		reset 		  	=> reset,
		clk 		  	=> clk,
		c_input_dec 	=> c_dec_input,
		out_input_index => out_input_index,
		out_input_reset => out_input_reset
	);
	
	
	U_NEURONDECREMENTER: NEURONDECREMENTER port map ( 
		reset				=> reset,
		clk 			 	=> clk,
		c_neuron_dec 	 	=> c_dec_neuron,
		out_neuron_index  	=> out_neuron_index,
		out_neuron_reset 	=> out_neuron_reset
	);
	
    U_MULTBLOCK : MULTBLOCK port map (
        c_mult 		 => c_mult,
        in_weights 	 => out_weights,
        in_inputs 	 => out_inputs,
        out_mult_val => out_mult_val
    );
    
    U_NEURONREGISTER : NEURONREGISTER port map (
		clk			 	=> clk,
		reset		 	=> reset,
		c_nreg	 		=> c_add_to_neuron,				
		in_nreg_val	 	=> out_mult_val,
		out_nreg_val 	=> out_nreg_val
    );
    
    U_ARGMAX : ARGMAX port map (
		clk 			 => clk,
		c_argmax 		 => c_argmax,
        in_argmax_val 	 => out_nreg_val,
        in_argmax_index  => out_neuron_index,
        out_argmax_index => out_argmax_index
    );
    
    U_RAM : RAM port map (
		in_ram_input_index 	=> out_input_index,
		out_inputs			=> out_inputs
    );

	U_ROM : ROM port map (
		in_rom_input_index 	=> out_input_index,
		in_rom_neuron_index => out_neuron_index,
		out_weights 		=> out_weights
	);
	
end RTL;
