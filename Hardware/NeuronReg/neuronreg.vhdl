library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONREG is
	port (
		clk: 			in 	std_logic;
		reset: 			in 	std_logic;
		c_nreg: 		in 	std_logic;						
		in_nreg_val: 	in 	std_logic_vector(12 downto 0);
		out_nreg_val: 	out std_logic_vector(20 downto 0)
	);
end NEURONREG;

architecture RTL of NEURONREG is
	signal reg_nreg: std_logic_vector(20 downto 0); 
	signal sum: std_logic_vector(20 downto 0);
begin
	sum <= std_logic_vector(unsigned(reg_nreg) + unsigned(in_nreg_val)); 	
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				reg_nreg <= "000000000000000000000";
			elsif c_nreg = '1' then
				out_nreg_val <= sum;
				reg_nreg <= sum;
			end if;
		end if;
	end process;
end RTL;
