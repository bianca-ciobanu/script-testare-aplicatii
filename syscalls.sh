#!/bin/bash

monitor_syscalls() {
    local command=$@
    local strace_output="strace_output.txt"
    echo -e "Syscalls of command $command">"$strace_output"
    strace -o $strace_output -f -tt -T $command > /dev/null 2>&1
    echo "System calls captured in $strace_output"
    echo -e "\n\n\n">>$strace_output
}
