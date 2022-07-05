LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
			c_add_to_neuron:	    out std_logic;
			c_reset_register: 		out std_logic; 
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
			in_data_rom: 	in 	std_logic_vector(31 downto 0);
			in_data_ram:  	in 	std_logic_vector(11 downto 0);
			out_mult_val:	out std_logic_vector(12 downto 0)
		);
    end component;

    component NEURONREGISTER is
        port (
			clk: 			in 	std_logic;
			reset: 			in 	std_logic;
			c_nreg: 		in 	std_logic;
			c_reset_reg: 	in 	std_logic;						
			in_nreg_val: 	in 	std_logic_vector(12 downto 0);
			out_nreg_val: 	out std_logic_vector(20 downto 0)
		);
    end component;

    component ARGMAX is
        port (
            clk:			  in  std_logic;
            reset: 			  in  std_logic;
			c_argmax: 		  in  std_logic;						
			in_argmax_val: 	  in  std_logic_vector(20 downto 0);	
			in_argmax_index:  in  std_logic_vector(3 downto 0);
			out_argmax_index: out std_logic_vector(3 downto 0)
        );
    end component;

	component RAM is
		port (
			in_ram_input_index: in  std_logic_vector(7 downto 0);
			out_data_ram: 		out std_logic_vector(11 downto 0)
		);
	end component;
	
	component ROM is 
		port (
			in_rom_input_index: 	in  std_logic_vector(7 downto 0);
			in_rom_neuron_index: 	in  std_logic_vector(3 downto 0);
			out_data_rom: 			out std_logic_vector(31 downto 0)
		);
	end component;
	

    for all : CONTROLLER 		use configuration WORK.CFG_controller_final;
    for all : INPUTDECREMENTER 	use configuration WORK.CFG_inpdec_final;
    for all : NEURONDECREMENTER use configuration WORK.CFG_neurondec_final;
    for all : NEURONREGISTER 	use configuration WORK.CFG_neuronreg_final;
    for all : ARGMAX 		  	use configuration WORK.CFG_argmax_final;
    for all : MULTBLOCK			use entity WORK.MULTBLOCK(RTL); -- did not work because of structure subcomponents
	for all : ROM 				use entity WORK.ROM(RTL); -- for demo purposes off, because of too much signals
	for all : RAM 				use entity WORK.RAM(RTL); -- just switch to cfg when demo is finished

    -- internal signals
    
    -- CONTROLLER
	signal c_dec_neuron: 	 std_logic;
	signal c_dec_input:		 std_logic;
	signal c_mult: 			 std_logic;
	signal c_add_to_neuron:	 std_logic;
	signal c_argmax: 		 std_logic;
	signal c_reset_register: std_logic;

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
    signal out_data_ram: std_logic_vector(11 downto 0);
    
	-- ROM 
	signal out_data_rom: std_logic_vector(31 downto 0);
   
begin
	-- port mapping
	
	U_CONTROLLER: CONTROLLER port map ( 
		clk 					=> clk,
		reset 					=> reset,
		in_ctrl_neuron_reset 	=> out_neuron_reset,
		in_ctrl_input_reset 	=> out_input_reset,
		c_dec_neuron 			=> c_dec_neuron,
		c_dec_input				=> c_dec_input,
		c_add_to_neuron			=> c_add_to_neuron,
		c_reset_register		=> c_reset_register,
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
        in_data_rom  => out_data_rom,
        in_data_ram  => out_data_ram,
        out_mult_val => out_mult_val
    );
    
    U_NEURONREGISTER : NEURONREGISTER port map (
		clk			 	=> clk,
		reset		 	=> reset,
		c_nreg	 		=> c_add_to_neuron,
		c_reset_reg  	=> c_reset_register,		
		in_nreg_val	 	=> out_mult_val,
		out_nreg_val 	=> out_nreg_val
    );
    
    U_ARGMAX : ARGMAX port map (
		clk 			 => clk,
		reset 			 => reset,
		c_argmax 		 => c_argmax,
        in_argmax_val 	 => out_nreg_val,
        in_argmax_index  => out_neuron_index,
        out_argmax_index => out_argmax_index
    );
    
    U_RAM : RAM port map (
		in_ram_input_index 	=> out_input_index,
		out_data_ram		=> out_data_ram
    );

	U_ROM : ROM port map (
		in_rom_input_index 	=> out_input_index,
		in_rom_neuron_index => out_neuron_index,
		out_data_rom 		=> out_data_rom
	);
end RTL;
