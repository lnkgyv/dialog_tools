#!/bin/bash

# Progress bar example for dialog gauge widget.
# Timeout is set in seconds.
_progress()
{
	timeout=${1:-0}

	[ -z "$timeout" -o $timeout -eq 0 ] && return

	sleep_step=$(echo "scale=2 ; $timeout/100" | bc 2>/dev/null)

	i=0
	sec=$timeout
	{	
	while [ $i -lt 100 ]
	do
		echo "XXX"
		echo $i
		echo "Progress ( $sec sec) ..."
		echo "XXX"

		sleep $sleep_step
		((i++))
		sec=$(echo "scale=0 ; $sec-$sleep_step" | bc 2>/dev/null)

	done 
	} | dialog --title "Progress" --gauge "Please wait" 7 70 0
}

_progress 20
