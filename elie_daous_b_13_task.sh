#!/bin/bash

#this is task b13, it is used to highlight certain words with certain colors provided by the user in te argument list.

declare -A paramenter=()
declare -A color=()
counter=1
RED='\\\e[00;31m' #line 10
BLUE='\\\e[00;34m'
GREEN='\\\e[00;32m'
ColorOff='\\\e[0m'
if [[ "$1" = -v ]]
then
	echo "13"
	exit 0
fi
if [[ "$1" = -h ]]
then
	echo "this is elie's b-task, varient 13. You just input a string to color it"
	exit 0
fi

for var in "$@"
do
	if [ $((counter%2)) -eq 0 ]
	then
		parameter[$counter]=$var #line 20
	else
		color[$counter]=$var
	fi
	counter=$(( $counter + 1 ))
#	echo "$counter"
done

while read input
do 
	counter=2
	#read input
	output=$input
	if [[ "$output" = "" ]]
	then
		exit 0
	fi

	while (($counter <= $#))
	do
		if [ "${color[$(($counter - 1))]}" == "r" ]; then
			output=$(echo -e "$output" | sed -e "s/${parameter[$counter]}/${RED}&${ColorOff}/g") 
			let "counter+=2"
			
		fi

		if [ "${color[$(($counter - 1))]}" == "b" ]; then
			output=$(echo -e "$output" | sed -e "s/${parameter[$counter]}/${BLUE}&${ColorOff}/g")
			let "counter+=2"
		
		fi

		if [ "${color[$(($counter - 1))]}" == "g" ]; then
			output=$(echo -e "$output" | sed -e "s/${parameter[$counter]}/${GREEN}&${ColorOff}/g")
			let "counter+=2"
	
		fi
	done
	echo -e "$output"
#	break
done
