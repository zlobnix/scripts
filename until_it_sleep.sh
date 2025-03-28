#!/bin/bash

file=~/temp/bashdays
timeout=100
SECONDS=0

until [ -s "$file" ] || (( SECONDS >= timeout ))
do 
	SECONDS=$((SECONDS+1))
	sleep 1
done

[ -s "$file" ] || exit 1

echo "вот и всё"

