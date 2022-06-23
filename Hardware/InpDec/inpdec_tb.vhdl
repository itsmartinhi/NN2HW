library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INPDEC_TB is 
end INPDEC_TB;

architecture TESTBENCH of INPDEC_TB is

component INPDEC is
	port (
	   reset: 		  in  std_logic;
	   clk: 		  in  std_logic;
	   c_inp_dec: 	  in  std_logic;
       out_inp_indx:  out std_logic_vector(7 downto 0);
       out_inp_reset: out std_logic
	);
end component INPDEC;

for SPEC: INPDEC use entity WORK.INPDEC(RTL);

signal reset: 			std_logic;
signal clk: 			std_logic;
signal c_inp_dec:  	  	std_logic;
signal spec_inp_indx:  	std_logic_vector(7 downto 0);
signal spec_inp_reset: 	std_logic;
signal tb_count: 		std_logic_vector(8 downto 0);

begin
	SPEC: INPDEC port map ( 
		reset 		  => reset,
		clk 		  => clk,
		c_inp_dec 	  => c_inp_dec,
		out_inp_indx  => spec_inp_indx,
		out_inp_reset => spec_inp_reset
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
		run_cycle;
		reset <= '0';
	
		c_inp_dec <= '1';
		tb_count <= "011000100";
		for i in 0 to 196 loop 
			run_cycle;
			tb_count <= std_logic_vector(signed(tb_count) - 1);
			assert spec_inp_indx = tb_count(7 downto 0) report "tb failed on increment:" & integer'image(i);
			assert spec_inp_reset = '0' report "reset signal is not 0 while looping on increment:" & integer'image(i);
		end loop;
		run_cycle;
		tb_count <= std_logic_vector(signed(tb_count) - 1);
		assert spec_inp_reset = '1' report "reset not set";
		run_cycle;
		assert spec_inp_indx = "11000100" report "count didnt reset";
		
		report "tb finished OK";
		wait;
		
	end process;
end architecture;
