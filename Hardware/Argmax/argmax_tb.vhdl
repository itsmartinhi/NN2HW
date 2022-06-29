library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARGMAX_TB is 
end ARGMAX_TB;

architecture TESTBENCH of ARGMAX_TB is

component ARGMAX is
	port (
		clk: 			  in  std_logic;
		c_argmax: 		  in  std_logic;	
		in_argmax_val: 	  in  std_logic_vector(20 downto 0);
		in_argmax_index:  in  std_logic_vector(3 downto 0);
		out_argmax_index: out std_logic_vector(3 downto 0)		
			
		);
end component;

for SPEC: ARGMAX use entity WORK.ARGMAX(RTL);

signal clk:			    std_logic;
signal c_argmax: 	    std_logic;
signal in_argmax_val:   std_logic_vector(20 downto 0);	
signal in_argmax_index: std_logic_vector(3 downto 0);
signal out_index_spec:  std_logic_vector(3 downto 0);

begin

	SPEC: ARGMAX port map ( 
		clk 			=> clk,
		c_argmax 		=> c_argmax,
		in_argmax_val   => in_argmax_val,
		in_argmax_index  => in_argmax_index,
		out_argmax_index => out_index_spec
	);

	process 
		constant period: time := 5 ns;
		procedure run_cycle is
			begin
				clk <= '0'; 
				wait for period;
				clk <= '1';
				wait for period;
			end procedure;
	begin
		in_argmax_val   <= "000000000000000000000";
		in_argmax_index <= "0000";
		c_argmax 	    <= '1';
		run_cycle;
		assert out_index_spec = in_argmax_index report "Test 1 failed";
		
		in_argmax_val   <= "000110000000000000000";
		in_argmax_index <= "0001";
		c_argmax 	    <= '1';
		run_cycle;
		assert out_index_spec = in_argmax_index report "Test 2 failed";
		
		in_argmax_val   <= "000011000000000000000";
		in_argmax_index <= "0011";
		c_argmax 	    <= '1';
		run_cycle;
		assert out_index_spec /= in_argmax_index report "Test 3 failed";
		
		report "argmax tb finished OK";
		wait;
	end process;
	
end architecture;

