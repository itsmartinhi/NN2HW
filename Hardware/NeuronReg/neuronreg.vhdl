library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONREG is
port (
	clk: 			in 	std_logic;
	c_nreg: 		in 	std_logic;						
	in_nreg_val: 	in 	std_logic_vector(11 downto 0);
	out_nreg_val: 	out std_logic_vector(20 downto 0)	
);
end NEURONREG;

architecture RTL of NEURONREG is
	signal reg_nreg: std_logic_vector(20 downto 0) := "000000000000000000000"; -- why does this work!?
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if c_nreg = '1' then
				out_nreg_val <= std_logic_vector( -- use of a variable to assign same operation twice ?
					unsigned(reg_nreg) +
					unsigned(in_nreg_val)
				);
				reg_nreg <= std_logic_vector(
					unsigned(reg_nreg) +
					unsigned(in_nreg_val)
				);
			end if;
		end if;
	end process;
end RTL;
