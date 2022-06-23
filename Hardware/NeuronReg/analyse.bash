ees-ghdl -a neuronreg.vhdl neuronreg_tb.vhdl
ees-ghdl -r neuronreg_tb --wave=neuronreg_tb_wave.ghw
gtkwave neuronreg_tb_wave.ghw neuronreg_tb.save
