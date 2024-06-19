#!/bin/bash

monitor_syscalls() {
    local command=$1
    local strace_output="strace_output.txt"
    echo -e "Syscalls of command $command">"$strace_output"
    strace -o $strace_output -f -tt -T $command
    echo "System calls captured in $strace_output"
    echo -e "\n\n\n">>$strace_output
}
