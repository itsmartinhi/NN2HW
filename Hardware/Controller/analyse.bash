ees-ghdl -a controller.vhdl controller_tb.vhdl
ees-ghdl -r controller_tb --wave=controller_tb_wave.ghw
gtkwave controller_tb_wave.ghw controller_tb.save 
