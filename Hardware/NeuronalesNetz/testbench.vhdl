library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TESTBENCH is 
end TESTBENCH;

architecture TESTBENCH of TESTBENCH is

component NEURONALESNETZ is
	port (
		clk: 		in  std_logic;
		reset: 		in 	std_logic;
		halt: 		out std_logic;
		out_result: out std_logic_vector(9 downto 0)
	);
end component;

for SPEC: NEURONALESNETZ use entity WORK.NEURONALESNETZ(RTL);

signal reset: 	    std_logic;
signal clk:         std_logic;
signal halt:  	    std_logic;
signal spec_result: std_logic_vector(9 downto 0);

begin
	SPEC: NEURONALESNETZ port map ( 
		reset 	   => reset,
		clk   	   => clk,
		halt 	   => halt,
		out_result => spec_result
	);
	process 
		procedure run_cycle is
			begin
				clk <= '0'; 
				wait for 15 ns;
				clk <= '1';
				wait for 15 ns;
			end procedure;
	begin
	
		reset <= '1';
		run_cycle;
		reset <= '0';
		
		for i in 0 to 1000000 loop 
			run_cycle;
			if halt = '1' then exit;
			end if;
		end loop;
	
		-- assert spec_result = "00001001" report "Result ist wrong";
	
		-- report "neuronales netz tb finished OK";	
		wait;
	end process;
end architecture;
