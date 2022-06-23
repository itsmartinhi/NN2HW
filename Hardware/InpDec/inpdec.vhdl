library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INPDEC is
	port (
		   clk: 		  in  std_logic;
		   c_inp_dec:  	  in  std_logic;
		   out_inp_indx:  out std_logic_vector(7 downto 0);
		   out_inp_reset: out std_logic
	);
end INPDEC;

architecture RTL of INPDEC is
	signal count: std_logic_vector(8 downto 0):= "011000100";
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if c_inp_dec = '1' then
				if count(8) = '1' then 
					count <= "011000100";
					out_inp_reset <= '1';
				else 
					count <= std_logic_vector(signed(count) - 1);
					out_inp_indx <= count(7 downto 0);
					out_inp_reset <= '0';
				end if;
			end if;
		end if;
	end process;
end RTL;
