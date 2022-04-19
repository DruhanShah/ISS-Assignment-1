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

text=$(tr ' ' '\n' < $1 | sort)
IFS=$' '
echo $text > temp.txt
text=$(sed 's/[.,]//g' temp.txt)
echo $text > temp.txt
previous=""
while read word
do 
	if [[ $previous == "" ]]
	then
		previous=$word
		count=1
	fi
	if [[ $word != $previous ]]
	then
		echo "Word:" $previous "-" $count
		count=1
		previous=$word
	else
		count=$(( $count + 1 ))
	fi
done < temp.txt
echo "Word:" $previous "-" $count
rm temp.txt
