library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARGMAX is
port (
	clk:			 in 	std_logic;
	c_argmax: 		 in 	std_logic;						
	in_argmax_val: 	 in 	std_logic_vector(20 downto 0);	
	in_argmax_indx:  in 	std_logic_vector(7 downto 0);
	out_argmax_indx: out std_logic_vector(7 downto 0)	
);
end ARGMAX;

architecture RTL of ARGMAX is
	signal reg_argmax_val: std_logic_vector(20 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if c_argmax = '1' then
				if reg_argmax_val < in_argmax_val then
					out_argmax_indx <= in_argmax_indx;
					reg_argmax_val  <= in_argmax_val;
				end if;
			end if;
		end if;
	end process;
end RTL;