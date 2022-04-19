#!/bin/bash
array=()
IFS=','
read -ra array

n=${#array[@]}

for (( i=0; i<n; i++ ))
do
	for (( ii=0; ii<n-1; ii++ ))
	do
		if [[ ${array[$ii]} -gt ${array[ (( $ii + 1 )) ]} ]]
		then
			temp=${array[$ii]}
			array[$ii]=${array[ $ii + 1 ]}
			array[$ii + 1]=$temp
		fi
	done
done

echo ${array[@]}
for (( i=0; i<n; i++ ))
do
	echo -n ${array[$i]}
	if [[ $i -lt $(( $n - 1 )) ]]
	then
		echo -n ","
	fi
done
echo ""
