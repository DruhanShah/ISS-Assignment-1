read s
n=${#s}
for (( x=0 ; x<n; x++ ))
do
	v=$(( $n - $x - 1 ))
	echo -n ${s[0]:$v:1}
done
echo 
