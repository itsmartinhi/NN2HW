ees-ghdl -a Multiplier/and2.vhdl Multiplier/or2.vhdl Multiplier/xor2.vhdl Multiplier/half_adder.vhdl Multiplier/full_adder.vhdl Multiplier/multiplier.vhdl multblock.vhdl multblock_tb.vhdl
ees-ghdl -r multblock_tb --wave=multblock_tb_wave.ghw
gtkwave multblock_tb_wave.ghw multblock_tb.save
