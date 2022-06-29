library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port (
        reset:                  in std_logic;
        in_rom_input_index:     in std_logic_vector(7 downto 0); -- the given rom input index
        in_rom_neuron_index:    in std_logic_vector(3 downto 0); -- the given neuron index
        out_weights:            out std_logic_vector(11 downto 0); -- the output datastream
    );
end ROM;
