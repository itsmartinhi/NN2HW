#!/bin/bash

echo "WARNING: This script only performs the loon to vhdl step!\n"

echo "Enter the path to the component directory:"
read path

echo "Enter the name of the component (without the file ending .vhdl etc.):"
read name

cd $path

# loon
vxx2ghdl ${name}_final.vst

echo "done"