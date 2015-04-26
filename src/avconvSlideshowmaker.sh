#!/bin/bash
# this will make a slidewhow out of a folder of jpegs
# ensure they are named img000.jpg thru img999.jpg
# use picRenamer.sh
avconv -r "8" -i img%03d.jpg -s 1920x1080 /tmp/out.mp4
