#!/bin/bash
#for loop
#Vadym Myrgorodskyi

for ((l=1; l<=5; l++ ))
do
	for (( r=1; r<=l; r++ ))
	do
		echo -n "$r"
	done
	echo ""
done