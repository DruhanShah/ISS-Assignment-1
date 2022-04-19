#!/bin/bash
wc -c < $1
wc -l < $1
wc -w < $1

IFS=$'\n'
counter=0
while read line
do
	counter=$(( $counter + 1 ))
	echo "Line No: " $counter " - " $( wc -w <<< $line )
done < $1


