library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARGMAX is
port (
	clk: in std_logic;
	c_argmax: in std_logic;								-- Start Argmax
	in_neuron_val: in std_logic_vector(31 downto 0);	-- In Neuron Value
	in_neuron_indx: in std_logic_vector(7 downto 0);	-- In Neuron Index
	out_indx: out std_logic_vector(7 downto 0)			-- Max Output Index
);
end ARGMAX;

architecture RTL of ARGMAX is
	signal reg_max_val: std_logic_vector(31 downto 0);
	signal difference: std_logic_vector(31 downto 0);
begin
	process(clk, in_neuron_indx, difference)
	difference <= std_logic_vector(unsigned(reg_max_val) - unsigned(in_neuron_val));
	begin
		if difference(31) = '0' then then
			if reg_max_val < in_neuron_val then
				out_indx <= in_neuron_indx;
				reg_max_val <= in_neuron_val;
			end if;
		end if;
	end process;
end RTL;
