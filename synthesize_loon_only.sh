#!/bin/bash

echo "WARNING: This script only performs the loon step!\n"

echo "Enter the path to the component directory:"
read path

echo "Enter the name of the component (without the file ending .vhdl etc.):"
read name

cd $path

# loon
loon ${name}_boog ${name}_final
vxx2ghdl ${name}_final.vst

echo "done"