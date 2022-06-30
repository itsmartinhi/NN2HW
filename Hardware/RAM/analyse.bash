ees-ghdl -a ram.vhdl ram_tb.vhdl
ees-ghdl -r ram_tb --wave=ram_tb_wave.ghw
gtkwave ram_tb_wave.ghw ram_tb.save