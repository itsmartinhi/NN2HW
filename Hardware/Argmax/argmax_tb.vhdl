library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARGMAX_TB is 
end ARGMAX_TB;

architecture TESTBENCH of ARGMAX_TB is

component ARGMAX is
	port (
		reset: 			  in  std_logic;
		clk: 			  in  std_logic;
		c_argmax: 		  in  std_logic;	
		in_argmax_val: 	  in  std_logic_vector(20 downto 0);
		in_argmax_index:  in  std_logic_vector(3 downto 0);
		out_argmax_index: out std_logic_vector(3 downto 0)		
			
		);
end component;

for SPEC: ARGMAX use entity WORK.ARGMAX(RTL);

component CFG_ARGMAX is
	port (
		reset: 			  in  std_logic;
		clk: 			  in  std_logic;
		c_argmax: 		  in  std_logic;	
		in_argmax_val: 	  in  std_logic_vector(20 downto 0);
		in_argmax_index:  in  std_logic_vector(3 downto 0);
		out_argmax_index: out std_logic_vector(3 downto 0)		
			
		);
end component;

signal reset: 			std_logic;
signal clk:			    std_logic;
signal c_argmax: 	    std_logic;
signal in_argmax_val:   std_logic_vector(20 downto 0);	
signal in_argmax_index: std_logic_vector(3 downto 0);
signal out_index_spec:  std_logic_vector(3 downto 0);
signal out_index_impl:  std_logic_vector(3 downto 0);

for IMPL: CFG_ARGMAX use configuration WORK.CFG_argmax_final;

begin

	SPEC: ARGMAX port map (
		reset 			 => reset,
		clk 			 => clk,
		c_argmax 		 => c_argmax,
		in_argmax_val    => in_argmax_val,
		in_argmax_index  => in_argmax_index,
		out_argmax_index => out_index_spec
	);
	
	IMPL: CFG_ARGMAX port map ( 
		reset 			 => reset,
		clk 			 => clk,
		c_argmax 		 => c_argmax,
		in_argmax_val    => in_argmax_val,
		in_argmax_index  => in_argmax_index,
		out_argmax_index => out_index_impl
	);

	process 
		constant period: time := 20 ns;
		procedure run_cycle is
			begin
				clk <= '0'; 
				wait for period;
				clk <= '1';
				wait for period;
			end procedure;
	begin
		reset <= '1';
		c_argmax <= '0';
		run_cycle;
		reset <= '0';
	
		in_argmax_val   <= "000000000000000000001";
		in_argmax_index <= "0000";
		c_argmax 	    <= '1';
		run_cycle;
		assert out_index_spec = in_argmax_index report "Spec Test 1 failed";
		assert out_index_impl = in_argmax_index report "Impl Test 1 failed";
		
		in_argmax_val   <= "000110000000000000000";
		in_argmax_index <= "0001";
		c_argmax 	    <= '1';
		run_cycle;
		run_cycle;
		assert out_index_impl = in_argmax_index report "Impl Test 2 failed";
		assert out_index_spec = in_argmax_index report "Spec Test 2 failed";
		
		in_argmax_val   <= "000011000000000000000";
		in_argmax_index <= "0011";
		c_argmax 	    <= '1';
		run_cycle;
		assert out_index_impl /= in_argmax_index report "Impl Test 3 failed";
		assert out_index_spec /= in_argmax_index report "Spec Test 3 failed";
		
		report "argmax tb finished OK";
		wait;
	end process;
	
end architecture;

