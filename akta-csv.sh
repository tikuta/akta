#!/bin/bash -eu
BNAME=${1%.*}
BNAME=${BNAME// /_}

UTF8="$BNAME.utf8.csv"
iconv -f UTF-16 -t UTF-8 "$1" > $UTF8

FIELD1=$(awk -F$'\t' 'NR==2{print $1}' "$UTF8")
NAME1="$BNAME.${FIELD1// /_}.csv"
awk -F$'\t' 'NR>3{if($1 != ""){print $1 "," $2}}' "$UTF8" > $NAME1

FIELD2=$(awk -F$'\t' 'NR==2{print $11}' "$UTF8")
NAME2="$BNAME.${FIELD2// /_}.csv"
awk -F$'\t' 'NR>3{if($11 != ""){print $11 "," $12}}' "$UTF8" > $NAME2

FIELD3=$(awk -F$'\t' 'NR==2{print $13}' "$UTF8")
NAME3="$BNAME.${FIELD3// /_}.csv"
awk -F$'\t' 'NR>3{if($13 != ""){print $13 "," $14}}' "$UTF8" > $NAME3
