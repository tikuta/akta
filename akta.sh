#!/bin/bash -eu
for F in "$@"; do
	EXT=${F##*.}
	if [ $EXT == "csv" ]; then
		akta-csv "$F"
	elif [ $EXT == "asc" ]; then
		akta-asc "$F"
	fi
done
