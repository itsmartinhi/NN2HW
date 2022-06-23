ees-ghdl -a neurondec.vhdl neurondec_tb.vhdl
ees-ghdl -r neurondec_tb --wave=neurondec_tb_wave.ghw
gtkwave neurondec_tb_wave.ghw neurondec_tb.save
