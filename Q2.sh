awk -F ". ~" -v RS='[\n]' '{print( $2 " once said " "\"" $1 "\"" ".")}' quotes.txt | grep -v " once said \"\"." > speech.txt
