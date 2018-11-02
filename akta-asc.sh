#!/bin/bash -eu
BNAME=${1%.*}
BNAME=${BNAME// /_}

NAME1="$BNAME.$(awk 'NR==2{print $1 $2}' "$1").csv"
awk 'NR>3{if(NF >= 2){print $1 "," $2}}' "$1" > $NAME1

NAME2="$BNAME.$(awk 'NR==2{print $3 $4}' "$1").csv"
awk 'NR>3{if(NF >= 4){print $3 "," $4}}' "$1" > $NAME2

NAME3="$BNAME.$(awk 'NR==2{print $5 $6}' "$1").csv"
awk 'NR>3{if(NF >= 6){print $5 "," $6}}' "$1" > $NAME3
