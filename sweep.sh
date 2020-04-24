#!/bin/bash

NUMSAMPLES=4

for i in $(seq 0 5 100);
do
  for j in $(seq 0 5 100);
  do
    echo $i " " $j
    ./clean_cubehelix.sh $NUMSAMPLES $i $j
  done
done
