read s
n=${#s}
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
echo ""
