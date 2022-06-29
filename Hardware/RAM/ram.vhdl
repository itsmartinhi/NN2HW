library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    port (
        reset:              in std_logic;
        in_ram_input_index: in std_logic_vector(7 downto 0); -- this is the given memory address
        out_inputs:         out std_logic_vector(11 downto 0); -- this is the output datastream
    );
end RAM;
