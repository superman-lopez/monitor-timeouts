#!/bin/bash
start=`date +%s`
minutes=""
timeouts=0

if [ $# -eq 0 ]; then
	minutes=1
else
	minutes=$1
fi

echo "Start monitor for network timeouts at `date` for $minutes minute(s)"

while [ $(( $(date +%s) - (60 * minutes) )) -lt $start ]
do
	ping=`ping google.com -c 1 | head -5`

	if [[ $ping == *"100% packet loss"* ]] || [[ $ping == *"100.0% packet loss"* ]]; then
		date
		echo $ping
		((timeouts++))
	fi
done

echo "End monitoring at `date`.  Total timeouts recorded: $timeouts"
