#!/bin/bash

COUNTER=0

while [ $COUNTER -lt 10 ]; do
	echo "Current counter is $COUNTER"
	COUNTER=$(($COUNTER+1))
	# let COUNTER=COUNTER+1
	# let COUNTER+=1
done

for myfile in `ls *.sh`; do
	cat $myfile
done

for x in {1..10}; do
	echo "X = $x"
done


for (( i=1; i<=10; i++ )); do
	echo $i
done
