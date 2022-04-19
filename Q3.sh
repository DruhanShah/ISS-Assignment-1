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

text=$(tr ' ' '\n' < $1)
IFS=$' '
text=$(echo $text | sed 's/[;!.,]//g')
text=$(echo $text | grep "\S" )
text=$(echo $text | tr '\n' ' ')
declare -A freq
array=($(echo $text))

for word in ${array[@]}
do
	freq[$word]=0
done

unique=()

for word in ${array[@]}
do
	freq[$word]=$(( ${freq[$word]} + 1 ))
	if [[ ${freq[$word]} == 1 ]]
	then
		unique+=$word
	fi
done

for key in ${!freq[@]}
do
	echo "Word:" $key " - " ${freq[$key]}
done
