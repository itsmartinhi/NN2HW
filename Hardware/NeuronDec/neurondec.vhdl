library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NEURONDEC is
	port (
		   clk: 			 in  std_logic;
		   c_neuron_dec:  	 in  std_logic;
		   out_neuron_indx:  out std_logic_vector(4 downto 0);
		   out_neuron_reset: out std_logic
	);
end NEURONDEC;

architecture RTL of NEURONDEC is
	signal count: std_logic_vector(4 downto 0):= "01001";
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if c_neuron_dec = '1' then
				if count(4) = '1' then 
					count <= "01001";
					out_neuron_reset <= '1';
				else 
					count <= std_logic_vector(signed(count) - 1);
					out_neuron_indx <= std_logic_vector(unsigned(count));
					out_neuron_reset <= '0';
				end if;
			end if;
		end if;
	end process;
end RTL;
