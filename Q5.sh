#!/bin/bash
read s
n=${#s}
for (( x=0 ; x<n; x++ ))
do
	v=$(( $n - $x - 1 ))
	echo -n ${s[0]:$v:1}
done
echo 

for (( x=n-1; x>=0; x-- ))
do
	char=${s[0]:$x:1}
	charint=$(printf "%d" "'$char'")
	if (( charint == 90 ))
	then
		charint=65
	elif (( charint == 122 ))
	then
		charint=97
	else
		charint=$(( $charint + 1 ))
	fi
	echo $charint | awk '{printf("%c", $0);}'
done
echo 

for (( x=0 ; x<n ; x++ ))
do
	if (( $(( 2 * $x )) < $n ))
	then
		v=$(( $(( $n / 2 )) - $x - 1 ))
		echo -n ${s[0]:$v:1}
	else
		echo -n ${s[0]:$x:1}
	fi
done
echo
