#!/bin/bash
# rename a bunch of pics in a directory
x=1; for i in *jpg; do counter=$(printf %03d $x); mv "$i" /tmp/slomo2/img"$counter".jpg; x=$(($x+1)); done
