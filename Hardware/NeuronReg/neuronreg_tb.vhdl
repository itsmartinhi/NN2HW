library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONREG_TB is 
end NEURONREG_TB;

architecture TESTBENCH of NEURONREG_TB is

component NEURONREG is
	port (
		reset: 		  in  std_logic;
		clk: 		  in  std_logic;
		c_nreg: 	  in  std_logic;
		c_reset_reg:  in  std_logic;
		in_nreg_val:  in  std_logic_vector(12 downto 0);
		out_nreg_val: out std_logic_vector(20 downto 0)	
		);
end component;

for SPEC: NEURONREG use entity WORK.NEURONREG(RTL);

component CFG_NEURONREG is
	port (
		reset: 		  in  std_logic;
		clk: 		  in  std_logic;
		c_nreg: 	  in  std_logic;
		c_reset_reg:  in  std_logic;
		in_nreg_val:  in  std_logic_vector(12 downto 0);
		out_nreg_val: out std_logic_vector(20 downto 0)	
		);
end component;

for IMPL: CFG_NEURONREG use configuration WORK.CFG_neuronreg_final;

signal reset: 			std_logic;
signal clk: 			std_logic;
signal c_reset_reg: 	std_logic;
signal c_nreg: 			std_logic;
signal in_nreg_val: 	std_logic_vector(12 downto 0);	
signal out_nreg_spec: 	std_logic_vector(20 downto 0);
signal out_nreg_impl: 	std_logic_vector(20 downto 0);

begin
	
	SPEC: NEURONREG port map ( 
		reset 		 => reset,
		clk 		 => clk,
		c_nreg 		 => c_nreg,
		c_reset_reg  => c_reset_reg,
		in_nreg_val  => in_nreg_val,
		out_nreg_val => out_nreg_spec
	);
	
	IMPL: CFG_NEURONREG port map ( 
		reset 		 => reset,
		clk 		 => clk,
		c_nreg 		 => c_nreg,
		c_reset_reg  => c_reset_reg,
		in_nreg_val  => in_nreg_val,
		out_nreg_val => out_nreg_impl
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
		run_cycle;
		reset <= '0';
		
		in_nreg_val <= "0000000000000";
		c_nreg <= '1';
		run_cycle;
		assert out_nreg_spec = "000000000000000000000" report "Test 1 failed";
		assert out_nreg_impl = "000000000000000000000" report "Impl. Test 1 failed";
		
		in_nreg_val <= "1111111111111";
		c_nreg <= '1';
		run_cycle;
		assert out_nreg_spec = "000000001111111111111" report "Test 2 failed";
		assert out_nreg_impl = "000000001111111111111" report "Impl. Test 2 failed";
		
		in_nreg_val <= "1001001110110";
		c_nreg <= '1';
		run_cycle;
		assert out_nreg_spec = "000000011001001110101" report "Test 3 failed";
		assert out_nreg_impl = "000000011001001110101" report "Impl. Test 3 failed";
		
		
		report "nreg tb finished OK";
		wait;
	end process;
	
end architecture;

