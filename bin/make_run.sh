#!/bin/bash
file=${1%.*}
make.sh $1 && ./$file.out
