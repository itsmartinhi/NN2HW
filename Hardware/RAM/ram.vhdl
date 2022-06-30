library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    port (
        in_ram_input_index: in std_logic_vector(7 downto 0); -- this is the given memory address
        out_data_ram:       out std_logic_vector(11 downto 0) -- this is the output datastream
    );
end RAM;

architecture RTL of RAM is
    type t_ram_arr is array (0 to 196) of std_logic_vector(11 downto 0);
    constant ram_arr: t_ram_arr := (
        -- here follows the generated array allocation
        196 => "001000000000",
        195 => "000000000000",
        194 => "000000000000",
        193 => "000000000000",
        192 => "000000000000",
        191 => "000000000000",
        190 => "000000000000",
        189 => "000000000000",
        188 => "000000000000",
        187 => "000000000000",
        186 => "000000000000",
        185 => "000000000000",
        184 => "000000000000",
        183 => "000000000000",
        182 => "000000000000",
        181 => "000000000000",
        180 => "000000000000",
        179 => "000000000000",
        178 => "000000000000",
        177 => "000000000000",
        176 => "000000000000",
        175 => "000000000000",
        174 => "000000000000",
        173 => "000000000000",
        172 => "000000000010",
        171 => "100000000000",
        170 => "000000000000",
        169 => "000000000000",
        168 => "000000000000",
        167 => "000000000000",
        166 => "000000000000",
        165 => "000000000100",
        164 => "110100000000",
        163 => "000000000000",
        162 => "000000000000",
        161 => "000000000000",
        160 => "000000000000",
        159 => "000000000000",
        158 => "000000000101",
        157 => "110101000000",
        156 => "000000000000",
        155 => "000000000000",
        154 => "000000000000",
        153 => "000000000000",
        152 => "000000000000",
        151 => "000000000101",
        150 => "110100000000",
        149 => "000000000000",
        148 => "000000000000",
        147 => "000000000000",
        146 => "000000000000",
        145 => "000000000000",
        144 => "000000000110",
        143 => "110010000000",
        142 => "000000000000",
        141 => "000000000000",
        140 => "000000000000",
        139 => "000000000000",
        138 => "000000000000",
        137 => "000000011110",
        136 => "110010000000",
        135 => "000000000000",
        134 => "000000000000",
        133 => "000000000000",
        132 => "000000000000",
        131 => "000000000000",
        130 => "000000101110",
        129 => "110000000000",
        128 => "000000000000",
        127 => "000000000000",
        126 => "000000000000",
        125 => "000000000000",
        124 => "000000000000",
        123 => "000001110110",
        122 => "100000000000",
        121 => "000000000000",
        120 => "000000000000",
        119 => "000000000000",
        118 => "000000000000",
        117 => "000000000000",
        116 => "000100110110",
        115 => "010000000000",
        114 => "000000000000",
        113 => "000000000000",
        112 => "000000000000",
        111 => "000000000000",
        110 => "000000000000",
        109 => "000110110110",
        108 => "001000000000",
        107 => "000000000000",
        106 => "000000000000",
        105 => "000000000000",
        104 => "000000000000",
        103 => "000000000000",
        102 => "000110110100",
        101 => "000000000000",
        100 => "000000000000",
        99 => "000000000000",
        98 => "000000000000",
        97 => "000000000000",
        96 => "000000000000",
        95 => "011110110011",
        94 => "000000000000",
        93 => "000000000000",
        92 => "000000000000",
        91 => "000000000000",
        90 => "000000000000",
        89 => "000000000000",
        88 => "110110110001",
        87 => "000000000000",
        86 => "000000000000",
        85 => "000000000000",
        84 => "000000000000",
        83 => "000000000000",
        82 => "000000000001",
        81 => "110110101000",
        80 => "000000000000",
        79 => "000000000000",
        78 => "000000000000",
        77 => "000000000000",
        76 => "000000000000",
        75 => "000000000100",
        74 => "110110011000",
        73 => "000000000000",
        72 => "000000000000",
        71 => "000000000000",
        70 => "000000000000",
        69 => "000000000000",
        68 => "000000000110",
        67 => "110110001000",
        66 => "000000000000",
        65 => "000000000000",
        64 => "000000000000",
        63 => "000000000000",
        62 => "000000000000",
        61 => "000000010110",
        60 => "110101000000",
        59 => "000000000000",
        58 => "000000000000",
        57 => "000000000000",
        56 => "000000000000",
        55 => "000000000000",
        54 => "000000100110",
        53 => "110010000000",
        52 => "000000000000",
        51 => "000000000000",
        50 => "000000000000",
        49 => "000000000000",
        48 => "000000000000",
        47 => "000000110110",
        46 => "110000000000",
        45 => "000000000000",
        44 => "000000000000",
        43 => "000000000000",
        42 => "000000000000",
        41 => "000000000000",
        40 => "000000010110",
        39 => "010000000000",
        38 => "000000000000",
        37 => "000000000000",
        36 => "000000000000",
        35 => "000000000000",
        34 => "000000000000",
        33 => "000000000000",
        32 => "000000000000",
        31 => "000000000000",
        30 => "000000000000",
        29 => "000000000000",
        28 => "000000000000",
        27 => "000000000000",
        26 => "000000000000",
        25 => "000000000000",
        24 => "000000000000",
        23 => "000000000000",
        22 => "000000000000",
        21 => "000000000000",
        20 => "000000000000",
        19 => "000000000000",
        18 => "000000000000",
        17 => "000000000000",
        16 => "000000000000",
        15 => "000000000000",
        14 => "000000000000",
        13 => "000000000000",
        12 => "000000000000",
        11 => "000000000000",
        10 => "000000000000",
        9 => "000000000000",
        8 => "000000000000",
        7 => "000000000000",
        6 => "000000000000",
        5 => "000000000000",
        4 => "000000000000",
        3 => "000000000000",
        2 => "000000000000",
        1 => "000000000000",
        0 => "000000000000",
        -- here ends the generated array allocation
    );

begin
    out_data_ram <= ram_arr(to_integer(unsigned(in_ram_input_index)));
end RTL;