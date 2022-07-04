library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARGMAX is
port (
	clk:			  in  std_logic;
	c_argmax: 		  in  std_logic;		
	reset: 			  in  std_logic;				
	in_argmax_val: 	  in  std_logic_vector(20 downto 0);	
	in_argmax_index:  in  std_logic_vector(3 downto 0);
	out_argmax_index: out std_logic_vector(3 downto 0)	
);
end ARGMAX;

architecture RTL of ARGMAX is
	signal reg_argmax_val: std_logic_vector(20 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				reg_argmax_val <= "000000000000000000000";
				out_argmax_index <= "0000";
			elsif c_argmax = '1' then
				if reg_argmax_val < in_argmax_val then
					out_argmax_index <= in_argmax_index;
					reg_argmax_val   <= in_argmax_val;
				end if;
			end if;
		end if;
	end process;
end RTL;
