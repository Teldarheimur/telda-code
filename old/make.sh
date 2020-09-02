#!/bin/bash
file=${1%.*}
cargo run --bin ctelda -- $1 $file.maketo && ./link.sh $file.maketo $file && rm $file.maketo