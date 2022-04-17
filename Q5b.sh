read s;
n=${#s}

for (( x=0; x<n; x++ ))
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
echo ""
