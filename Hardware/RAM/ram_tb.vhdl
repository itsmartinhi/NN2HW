library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_TB is
end RAM_TB;

architecture TESTBENCH of RAM_TB is

component RAM is
    port (
        in_ram_input_index:     in std_logic_vector(7 downto 0); -- the given rom input index
        out_data_ram:           out std_logic_vector(11 downto 0) -- the output datastream
    );
end component RAM;

for SPEC: RAM use entity WORK.RAM(RTL);

signal in_ram_input_index:  std_logic_vector(7 downto 0);
signal out_data_ram:        std_logic_vector(11 downto 0);

begin
    SPEC: RAM port map (
        in_ram_input_index  => in_ram_input_index,
        out_data_ram        => out_data_ram
    );

    process
    begin
        in_ram_input_index <= "10000010"; -- index 130

        wait for 1 ns; -- this is needed for some reason

        assert out_data_ram = "110110101000" report "output not as expected!";

        report "ram tb finished.";
        wait;

    end process;

end architecture;