#!/bin/bash


while [ $(date +%H) -lt 18 ]
do
	echo "Waiting..."
	sleep 900
done

echo -e "\nStarting execution loop:\n"

COUNT=0

for i in IN/input_*
do
	HOUR=$(date +%H)

	if [ $HOUR -ge 7 ] && [ $HOUR -lt 18 ]
	then
		break
	fi

	((COUNT++))
	
	#if [ $COUNT -gt 1 ]
	#then
	#	break
	#fi

	echo "Processing block $i"

	echo -e "\n##########$i###########\n" &>> out.txt
	php add676.php $i &>> out.txt
	echo -e "\n#####################\n" &>> out.txt

done

echo -e "\nEnd of execution loop. $COUNT blocks processed."

