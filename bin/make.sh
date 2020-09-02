#!/bin/bash
file=${1%.*}
ctelda $1 $file.maketo && link.sh $file.maketo $file.out && rm $file.maketo