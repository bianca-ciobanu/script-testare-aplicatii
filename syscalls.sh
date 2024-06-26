#!/bin/bash

monitor_syscalls() {
    local command=$@
    local strace_output="strace_output.txt"
    local error_file="error.txt"
    echo "We start tracking system calls..."
    echo -e "Syscalls of command $command" > "$strace_output"
    strace -o $strace_output -f -tt -T $command 2> $error_file
    if [[ -s "$error_file" ]]
    then
    echo "Error occured:"
    cat $error_file
    exit 1
    fi

    echo "System calls captured in $strace_output"
    echo -e "\n\n\n">>$strace_output
}
