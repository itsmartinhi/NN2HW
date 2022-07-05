library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INPDEC_TB is 
end INPDEC_TB;

architecture TESTBENCH of INPDEC_TB is

component INPDEC is
	port (
	   reset: 		  	in  std_logic;
	   clk: 		  	in  std_logic;
	   c_input_dec: 	in  std_logic;
       out_input_index: out std_logic_vector(7 downto 0);
       out_input_reset: out std_logic
	);
end component INPDEC;

for SPEC: INPDEC use entity WORK.INPDEC(RTL);

component CFG_INPDEC is
	port (
	   reset: 		  	in  std_logic;
	   clk: 		  	in  std_logic;
	   c_input_dec: 	in  std_logic;
       out_input_index: out std_logic_vector(7 downto 0);
       out_input_reset: out std_logic
	);
end component CFG_INPDEC;

for IMPL: CFG_INPDEC use configuration WORK.CFG_inpdec_final;

signal reset: 			 std_logic;
signal clk: 			 std_logic;
signal c_input_dec:  	 std_logic;
signal spec_input_index: std_logic_vector(7 downto 0);
signal spec_input_reset: std_logic;
signal impl_input_index: std_logic_vector(7 downto 0);
signal impl_input_reset: std_logic;
signal tb_count: 		 std_logic_vector(8 downto 0);

begin
	SPEC: INPDEC port map ( 
		reset 		  	=> reset,
		clk 		  	=> clk,
		c_input_dec 	=> c_input_dec,
		out_input_index => spec_input_index,
		out_input_reset => spec_input_reset
	);
	
	IMPL: CFG_INPDEC port map ( 
		reset 		  	=> reset,
		clk 		  	=> clk,
		c_input_dec 	=> c_input_dec,
		out_input_index => impl_input_index,
		out_input_reset => impl_input_reset
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
	
		reset <= '1';
		c_input_dec <= '0';
		tb_count <= "011000100";
		run_cycle;
		reset <= '0';
	
		c_input_dec <= '1';
		for i in 0 to 195 loop 
			run_cycle;
			tb_count <= std_logic_vector(signed(tb_count) - 1);
			assert spec_input_index = tb_count(7 downto 0) report "tb failed on increment:" & integer'image(i);
			assert spec_input_reset = '0' report "reset signal is not 0 while looping on increment:" & integer'image(i);
			assert impl_input_index = tb_count(7 downto 0) report "tb failed on increment:" & integer'image(i);
			assert impl_input_reset = '0' report "impl reset signal is not 0 while looping on increment:" & integer'image(i);
		end loop;
		run_cycle;
		tb_count <= std_logic_vector(signed(tb_count) - 1);
		assert spec_input_reset = '1' report "reset not set";
		assert impl_input_reset = '1' report "impl reset not set";
		run_cycle;
		assert spec_input_index = "11000100" report "count didnt reset";
		assert impl_input_index = "11000100" report "impl count didnt reset";
		
		report "tb finished OK";
		wait;
		
	end process;
end architecture;
