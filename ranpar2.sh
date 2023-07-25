#!/bin/bash

[ -n "$1" ] && ITS=$1 || ITS=1

FORM=(square circle triangle cylinder sphere cube)

bcf(){
	echo "scale=4; $((RANDOM%100))/100" | bc -l
}

echo "par clear;" | pdsend 9090

for i in $(seq $ITS)
do

OBJ=$(echo """
$(bcf) $(bcf) $(bcf)
$(bcf) $(bcf) $(bcf)
$(bcf) $(bcf) $(bcf) 
$(bcf) $(bcf) $(bcf) $(bcf) $(bcf) $(bcf) $(bcf) 
${FORM[$((RANDOM%6))]}
$(bcf) $((RANDOM%10))
""" | tr '\n' ' ' | sed 's/\s\./ 0\./g')

echo "par obj 0 0 par2 $OBJ;" | pdsend 9090 
done

