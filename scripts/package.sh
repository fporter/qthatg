#!/bin/sh

# create bin dir
mkdir -p bin

# build out (requires setting up godot export templates)
pushd src && godot --export "Linux/X11" ../bin/qthatg.x86_64 && popd
