#!/bin/bash
#Usage: ./monitor-timeouts.sh [duration] [target]
#example: ./monitor-timeouts.sh 60 192.168.1.1
minutes=$1
target=$2
if [ $# -eq 0 ]; then
	minutes=1
	target=google.com
fi
if [ -z "$2" ]; then
	target=google.com
fi
pings=$((60 * $minutes))

system=`uname`
if [[ $system == *"Linux"* ]]; then
	extraflag="-O"
fi

echo "Start monitor for network timeouts at `date` for $minutes minute(s)."
echo "Target host: $target"
ping $target -i 1 -c $pings $extraflag | grep -i "timeout\|unreachable\|no answer\|statistics\|transmitted\|avg"
echo "End monitoring at `date`."
