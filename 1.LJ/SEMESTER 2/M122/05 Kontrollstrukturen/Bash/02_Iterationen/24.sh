#!/bin/bash

range() {
	a="$1"
	b="$2"
	local start end i

	if [ "$a" -le "$b" ]; then
		start="$a"
		end="$b"
	else
		start="$b"
		end="$a"
	fi

	for ((i = start; i < end; i++)); do
		echo "$i"
	done
}

range 20 24
range 35 30
