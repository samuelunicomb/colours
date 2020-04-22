#!/bin/bash

# to be used like $ ./clean_cubehelix.sh 12 60 0

A=$1
B=$2
C=$3

python3 colours.py $A $B $C | tr ', ' '\n' | tr -d '[' | tr -d ']' | awk '{if (length ($0) > 3) print}' > dummy.dat

# move pdf to pdf director
mv $A-$B-$C.pdf pdfdocs/

# outputting to .tex format
cat dummy.dat | tr -d "'" | tr -d '#' | awk '{print "\\definecolor{COL"NR-1"}{HTML}{"$1"}"}' > hexdocs/cols-$A-$B-$C.tex
tac dummy.dat | tr -d "'" | tr -d '#' | awk '{print "\\definecolor{COL"NR-1"}{HTML}{"$1"}"}' > hexdocs/cols-$A-$B-$C-reverse.tex

# outputting to .pal format
N=$(wc -l dummy.dat | awk '{print $1}')

cat dummy.dat | awk -v var=$N 'BEGIN {print "set palette defined (\\"} {if (NR < var) {print NR - 1 " " $1 ",\\"} else {print NR - 1 " " $1 ")"}}' > hexdocs/cols-$A-$B-$C.pal
tac dummy.dat | awk -v var=$N 'BEGIN {print "set palette defined (\\"} {if (NR < var) {print NR - 1 " " $1 ",\\"} else {print NR - 1 " " $1 ")"}}' > hexdocs/cols-$A-$B-$C-reverse.pal

# clean up
rm dummy.dat
