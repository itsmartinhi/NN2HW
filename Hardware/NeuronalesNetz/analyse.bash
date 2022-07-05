# Test all components

cd ..

# Controller
echo "Controller"
cd Controller
ees-ghdl -a controller.vhdl

cd ..

# InputDec
echo "InputDec"
cd InpDec
ees-ghdl -a inpdec.vhdl inpdec_tb.vhdl
ees-ghdl -r inpdec_tb --wave=inpdec_tb_wave.ghw

cd ..

# NeuronDec
echo "NeuronDec"
cd NeuronDec
ees-ghdl -a neurondec.vhdl neurondec_tb.vhdl
ees-ghdl -r neurondec_tb --wave=neurondec_tb_wave.ghw

cd ..

# MultBlock
echo "Multblock"
cd MultBlock
ees-ghdl -a Multiplier/and2.vhdl Multiplier/or2.vhdl Multiplier/xor2.vhdl Multiplier/half_adder.vhdl Multiplier/full_adder.vhdl Multiplier/multiplier.vhdl multblock.vhdl multblock_tb.vhdl
ees-ghdl -r multblock_tb --wave=multblock_tb_wave.ghw

cd ..

# Argmax 
echo "Argmax"
cd Argmax
ees-ghdl -a argmax.vhdl argmax_final.vhdl argmax_tb.vhdl
ees-ghdl -r argmax_tb --wave=argmax_tb_wave.ghw

cd ..

# NeuronReg
echo "Neuron Reg"
cd NeuronReg
ees-ghdl -a neuronreg.vhdl neuronreg_final.vhdl neuronreg_tb.vhdl
ees-ghdl -r neuronreg_tb --wave=neuronreg_tb_wave.ghw

cd ..

# Neuronales Netz
echo "Neuornales Netz"
cd NeuronalesNetz
ees-ghdl -a ../Controller/controller.vhdl \
			../InpDec/inpdec.vhdl \
			../NeuronDec/neurondec.vhdl \
			../MultBlock/Multiplier/and2.vhdl ../MultBlock/Multiplier/or2.vhdl ../MultBlock/Multiplier/xor2.vhdl ../MultBlock/Multiplier/half_adder.vhdl ../MultBlock/Multiplier/full_adder.vhdl ../MultBlock/Multiplier/multiplier.vhdl ../MultBlock/multblock.vhdl \
			../Argmax/argmax.vhdl ../Argmax/argmax_final.vhdl \
			../NeuronReg/neuronreg.vhdl ../NeuronReg/neuronreg_final.vhdl \
			../RAM/ram.vhdl ../RAM/ram_final.vhdl \
			../ROM/rom.vhdl ../ROM/rom_final.vhdl \
			neuronalesNetz.vhdl testbench.vhdl
ees-ghdl -r testbench --wave=testbench_wave.ghw
gtkwave testbench_wave.ghw testbench.save


# gtkwave multblock_tb_wave.ghw multblock_tb.save
