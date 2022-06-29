library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INPDEC is
	port (
		   reset: 		    in  std_logic;
		   clk: 		    in  std_logic;
		   c_input_dec:  	in  std_logic;
		   out_input_index: out std_logic_vector(7 downto 0);
		   out_input_reset: out std_logic
	);
end INPDEC;

architecture RTL of INPDEC is
	signal count: std_logic_vector(8 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				count <= "011000011";
				out_input_index <= "11000100";
			elsif c_input_dec = '1' then
				if count(8) = '1' then 
					count <= "011000011";
					out_input_reset <= '1';
					out_input_index <= "11000100";
				else 
					out_input_index <= count(7 downto 0);
					out_input_reset <= '0';
					count <= std_logic_vector(signed(count) - 1);
				end if;
			end if;
		end if;
	end process;
end RTL;
