# (C) 2007-2020 Gundolf Kiefer, Augsburg University of Applied Sciences
#
# This is Makefile for the "multblock" design example used for various courses
# at the Efficient Embedded Systems (EES) lab.


GHDL=ees-ghdl


# Default target: Create an IC layout ...
#all: ic-layout



##### Simulation (GHDL) #####


.PHONY: sim
sim: multblock.vhdl multblock_tb.vhdl
	$(GHDL) -a multblock.vhdl multblock_tb.vhdl
	$(GHDL) -r multblock_tb --wave=multblock_tb.ghw

# Elaboration targets (GHDL)
multblock_tb: multblock_tb.o multblock.o
	$(GHDL) -e $@

# Generic rule to analyze files (GHDL)
%.o:	%.vhdl
	$(GHDL) -a $<

# Files dependencies...
multblock_tb.o: multblock.o





##### Synthesis & IC layout (Alliance) #####


# Frontend: Synthesis up to gate-level netlist ...
.PHONY: ic-syn
ic-syn: multblock_final.vst

multblock_final.vst: multblock.vhdl
#	vasy -a -p and2 and2_vasy
#	vasy -a -p xor2 xor2_vasy
#	vasy -a -p or2 or2_vasy
#	vasy -a -p half_adder half_adder_vasy
#	vasy -a -p -H full_adder full_adder_vasy
#	vasy -a -p -H half_adder half_adder_vasy
	vasy -a -p -H multblock multblock_vasy
	boom and2 and2_boom
	boom or2 or2_boom
	boom xor2 xor2_boom
#	boom multblock_vasy multblock_boom
#	boog multblock_boom multblock_boog
	boog and2_boom and2
	boog or2_boom or2
	boog xor2_boom xor2
	loon -x 1 multblock_vasy multblock_final
	@echo "To view the result, run 'xsch &' and open '"$@"'!"


# Frontend: Post-Simulation ...
#   To run this successfully, precomiled SXLIB and VITAL libraries are required.
.PHONY: ic-sim
ic-sim: multblock.vhdl multblock_final.vhdl multblock_tb.vhdl multblock_tb_cfg.vhdl
	$(GHDL) -a multblock.vhdl multblock_final.vhdl multblock_tb.vhdl multblock_tb_cfg.vhdl
	$(GHDL) -r cfg_multblock_post --wave=multblock_tb.ghw

multblock_final.vhdl: multblock_final.vst
	vxx2ghdl $<


.PHONY: clean
clean:
	rm *.vbe
	rm *.vst
	rm *.xsc

