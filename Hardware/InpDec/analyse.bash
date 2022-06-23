ees-ghdl -a inpdec.vhdl inpdec_tb.vhdl
ees-ghdl -r inpdec_tb --wave=inpdec_tb_wave.ghw
gtkwave inpdec_tb_wave.ghw inpdec_tb.save
