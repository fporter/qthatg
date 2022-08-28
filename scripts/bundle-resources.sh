#!/bin/sh

mkdir -p ./src/res
for d in ./resources/*; do
	pushd $d && godot --export-pack "Linux/X11" ../../src/res/`basename $d`.pck; popd
done;

