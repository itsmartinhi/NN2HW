library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONDEC is
	port (
		   reset: 			 in  std_logic;
		   clk: 			 in  std_logic;
		   c_neuron_dec:  	 in  std_logic;
		   out_neuron_index: out std_logic_vector(3 downto 0);
		   out_neuron_reset: out std_logic
	);
end NEURONDEC;

architecture RTL of NEURONDEC is
	signal count: std_logic_vector(4 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				count <= "01001";
				out_neuron_index <= "1001";
			elsif c_neuron_dec = '1' then
				if count = "00000" then 
					count <= "01001";
					out_neuron_reset <= '1';
					out_neuron_index <= "0000";
				else 
					out_neuron_index <= count(3 downto 0);
					out_neuron_reset <= '0';
					count <= std_logic_vector(signed(count) - 1);
				end if;
			end if;
		end if;
	end process;
end RTL;
