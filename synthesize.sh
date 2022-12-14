#!/bin/bash

echo "Enter the path to the component directory:"
read path

echo "Enter the name of the component (without the file ending .vhdl etc.):"
read name

cd $path

# vasy
function run_vasy {
    vasy -a -p -o ${name}.vhdl ${name}_vasy \
    && vxx2ghdl ${name}_vasy.vbe
}

# boom
function run_boom {
    boom ${name}_vasy ${name}_boom \
    && vxx2ghdl ${name}_boom.vbe
}

# boog
function run_boog {
    boog ${name}_boom ${name}_boog \
    && vxx2ghdl ${name}_boog.vst
}

# loon
function run_loon {
    loon ${name}_boog ${name}_final \
    && vxx2ghdl ${name}_final.vst
}

run_vasy && run_boom && run_boog && run_loon

echo "done"