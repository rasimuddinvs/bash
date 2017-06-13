#!/bin/bash                                            
read varname
len=$(expr $varname - 1)
read -a first
read -a second
IFS=$'\n'
f=$(echo "${first[*]}" | sort -nr | tail -n1)
s=$(echo "${second[*]}" | sort -nr | tail -n1)
total=$(expr $f + $s)
echo $total 