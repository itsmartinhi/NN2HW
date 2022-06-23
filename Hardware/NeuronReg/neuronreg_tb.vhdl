library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONREG_TB is 
end NEURONREG_TB;

architecture TESTBENCH of NEURONREG_TB is

component NEURONREG is
	port (
		clk: 		  in  std_logic;
		c_nreg: 	  in  std_logic;
		in_nreg_val:  in  std_logic_vector(11 downto 0);
		out_nreg_val: out std_logic_vector(20 downto 0)	
		);
end component;

for SPEC: NEURONREG use entity WORK.NEURONREG(RTL);

signal clk: std_logic;
signal c_nreg: std_logic;
signal in_nreg_val: std_logic_vector(11 downto 0);	
signal out_nreg_spec: std_logic_vector(20 downto 0);

begin
	
	SPEC: NEURONREG port map ( 
		clk => clk,
		c_nreg => c_nreg,
		in_nreg_val => in_nreg_val,
		out_nreg_val => out_nreg_spec
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
	
		in_nreg_val <= "000000000000";
		c_nreg <= '1';
		run_cycle;
		assert out_nreg_spec = "000000000000000000000" report "Test 1 failed";
		
		in_nreg_val <= "111111111111";
		c_nreg <= '1';
		run_cycle;
		assert out_nreg_spec = "000000000111111111111" report "Test 2 failed";
		
		in_nreg_val <= "100100111011";
		c_nreg <= '1';
		run_cycle;
		assert out_nreg_spec = "000000001100100111010" report "Test 3 failed";
		
		
		report "nreg tb finished OK";
		wait;
	end process;
	
end architecture;

