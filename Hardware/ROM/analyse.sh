ees-ghdl -a rom.vhdl rom_tb.vhdl
ees-ghdl -r rom_tb --wave=rom_tb_wave.ghw
gtkwave rom_tb_wave.ghw rom_tb.save