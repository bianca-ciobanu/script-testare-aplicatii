#!/bin/bash

monitor_libcalls() {
    local command=$@
    local ltrace_output="ltrace_output.txt"
    
    ltrace -o "$ltrace_output" -f -tt -T eval $command > /dev/null 2>&1
    echo "Library calls captured in $ltrace_output"
}

