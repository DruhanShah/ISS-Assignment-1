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
echo $text > temp1.txt
text=$(sed 's/[!.,]//g' temp1.txt)
echo $(echo $text | grep "\S" ) > temp2.txt
IFS=$'\n'
declare -A freq

while read word
do
	freq[$word]=0
done < temp2.txt


while read word
do
	freq[$word]=$(( ${freq[$word]} + 1 ))
	if [[ ${freq[$word]} == 1 ]]
	then
		echo $word >> temp3.txt
	fi
done < temp2.txt


while read key
do
	echo "Word:" $key " - " ${freq[$key]}
done < temp3.txt

rm temp*.txt
