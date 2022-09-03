# election-maps

To reproduce the GIF of the 1976-2020 election maps, you'll need not only R (I used version 4.1.2), but also Image Magick (I used version 6.9.11-60), and the following R add-on packages:

- `dplyr` (I used version 1.0.9)
- `readr` (I used version 2.1.2)
- `ggplot2` (I used version 3.3.6)
- `usmap` (I used version 0.6.0)

You can reproduce the GIF by executing the shell script `make-gif.sh`, or by manually running the R code in `presidential-election-maps0.R` and invoking Image Magick's `convert` command on your own.
