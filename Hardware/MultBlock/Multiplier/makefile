# (C) 2007-2020 Gundolf Kiefer, Augsburg University of Applied Sciences
#
# This is Makefile for the "multiplier" design example used for various courses
# at the Efficient Embedded Systems (EES) lab.


GHDL=ees-ghdl


# Default target: Create an IC layout ...
#all: ic-layout



##### Simulation (GHDL) #####


.PHONY: sim
sim: multiplier.vhdl multiplier_tb.vhdl
	$(GHDL) -a multiplier.vhdl multiplier_tb.vhdl
	$(GHDL) -r multiplier_tb --wave=multiplier_tb.ghw

# Elaboration targets (GHDL)
multiplier_tb: multiplier_tb.o multiplier.o
	$(GHDL) -e $@

# Generic rule to analyze files (GHDL)
%.o:	%.vhdl
	$(GHDL) -a $<

# Files dependencies...
multiplier_tb.o: multiplier.o





##### Synthesis & IC layout (Alliance) #####


# Frontend: Synthesis up to gate-level netlist ...
.PHONY: ic-syn
ic-syn: multiplier_final.vst

multiplier_final.vst: multiplier.vhdl
# vasy -a -p and2 and2_vasy
# vasy -a -p xor2 xor2_vasy
#	vasy -a -p -H half_adder half_adder_vasy
#vasy -a -p -H half_adder half_adder_vasy
#	vasy -a -p -H full_adder full_adder_vasy
	vasy -a -p -H multiplier multiplier_vasy
	boom multiplier_vasy_model multiplier_boom
	boog multiplier_boom multiplier_boog
	loon -x 1 multiplier_boog multiplier_final
	@echo "To view the result, run 'xsch &' and open '"$@"'!"


# Frontend: Post-Simulation ...
#   To run this successfully, precomiled SXLIB and VITAL libraries are required.
.PHONY: ic-sim
ic-sim: multiplier.vhdl multiplier_final.vhdl multiplier_tb.vhdl multiplier_tb_cfg.vhdl
	$(GHDL) -a multiplier.vhdl multiplier_final.vhdl multiplier_tb.vhdl multiplier_tb_cfg.vhdl
	$(GHDL) -r cfg_multiplier_post --wave=multiplier_tb.ghw

multiplier_final.vhdl: multiplier_final.vst
	vxx2ghdl $<


.PHONY: clean
clean:
	rm *.vbe
	rm *.vst
