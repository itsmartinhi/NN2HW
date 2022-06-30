library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ROM_TB is
end ROM_TB;

architecture TESTBENCH of ROM_TB is

component ROM is
    port (
        in_rom_input_index:     in std_logic_vector(7 downto 0); -- the given rom input index
        in_rom_neuron_index:    in std_logic_vector(3 downto 0); -- the given neuron index
        out_weights:            out std_logic_vector(31 downto 0) -- the output datastream
    );
end component ROM;

for SPEC: ROM use entity WORK.ROM(RTL);

signal in_rom_input_index:  std_logic_vector(7 downto 0);
signal in_rom_neuron_index: std_logic_vector(3 downto 0);
signal out_weights:         std_logic_vector(31 downto 0);

begin
    SPEC: ROM port map (
        in_rom_input_index  => in_rom_input_index,
        in_rom_neuron_index => in_rom_neuron_index,
        out_weights         => out_weights
    );

    process
    begin
        wait for 1 ns; -- this is needed for some reason

        in_rom_input_index <= "00000000";
        in_rom_neuron_index <= "0000";
        
        run_cycle;

        assert out_weights = "01100011000000000000000000000000" report "output not as expected!";

        report "rom tb finished.";
        wait;

    end process;

end architecture;
