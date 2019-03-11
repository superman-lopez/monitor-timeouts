#!/bin/bash
#Usage: ./monitor-timeouts.sh [target] [duration]
#where [target] can be host name or ip address, if left blank "google.com" will be used
#and where [duration] is duration of monitoring in minutes, if left blank 1 minute will be used
#example: ./monitor-timeouts.sh 192.168.1.1 10
target=$1
minutes=$2
if [ $# -eq 0 ]; then
	target=google.com
fi
if [ -z "$2" ]; then
	minutes=1
fi
pings=$((60 * $minutes))

echo "Start monitor for network timeouts at `date` for $minutes minute(s)."
echo "Target host: $target"
ping $target -i 1 -c $pings | grep "timeout\|statistics\|transmitted\|avg"
echo "End monitoring at `date`."
