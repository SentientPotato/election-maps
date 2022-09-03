#! /bin/bash

Rscript --no-echo presidential-election-maps0.R
convert -delay 200 -loop 0 *map.png maps.gif

