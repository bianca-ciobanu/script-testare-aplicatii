#!/bin/bash

while read line; do
	if [[ "$line" == "exit" ]]; then
	break
	fi
    echo "Processed: $line"
done

