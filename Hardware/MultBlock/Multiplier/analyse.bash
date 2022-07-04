ees-ghdl -a and2.vhdl or2.vhdl xor2.vhdl half_adder.vhdl full_adder.vhdl multiplier.vhdl multiplier_tb.vhdl ElevenBitAdder.vdhl TwelveBitAdder.vdhl multblock.vhdl multblock_tb.vhdl
ees-ghdl -a multiplier_final.vhdl multiplier_tb.vhdl
ees-ghdl -r multiplier_tb --wave=multiplier_tb_wave.ghw

ees-ghdl -a elevenBitAdder.vdhl