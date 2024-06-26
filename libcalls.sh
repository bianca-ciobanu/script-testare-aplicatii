#!/bin/bash

monitor_libcalls() {
    local command=$@
    local ltrace_output="ltrace_output.txt"
    local error_file="error.txt"
    echo "We start tracking library calls..."
    ltrace -o "$ltrace_output" -f -tt -T $command 2> $error_file
    if [[ -s "$error_file" ]]
    then
    echo "Error occured:"
    cat $error_file
    exit 1
    fi
    echo "Library calls captured in $ltrace_output"
}

