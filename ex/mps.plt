set multiplot layout 1,3

# in gnuplot interpreter, run by doing
# > call "mps.plt" 60 40

set xrange[-2:4]
set yrange[-4:3]

load "/Users/sam/colours/hexdocs/cols-12-60-0.pal"
load "/Users/sam/colours/hexdocs/cols-12-40-10-reverse.pal"
load "/Users/sam/colours/hexdocs/cols-12-50-100-reverse.pal"
load "/Users/sam/colours/hexdocs/cols-12-".ARG1."-".ARG2."-reverse.pal"

unset key
set colorbox
unset xtics
unset ytics

set bmargin 1
set lmargin 1
set rmargin 1
set size ratio 1

plot "raw_rt_02.dat" using (log ($2) / log (10)):(log ($1) / log (10)):(log ($8) / log (10)) with image
plot "raw_at_00.dat" using (log ($2) / log (10)):(log ($1) / log (10)):(log ($8) / log (10)) with image
plot "raw_si_02.dat" using (log ($2) / log (10)):(log ($1) / log (10)):(log ($8) / log (10)) with image
