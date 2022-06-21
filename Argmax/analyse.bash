ees-ghdl -a argmax.vhdl argmax_tb.vhdl
ees-ghdl -r argmax_tb --wave=argmax_tb_wave.ghw
gtkwave argmax_tb_wave.ghw argmax_tb.save
