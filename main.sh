#!/bin/bash
source ./measure_time.sh
source ./syscalls.sh
source ./libcalls.sh
source ./input_output.sh
measure_time "$@"
monitor_syscalls "$@"
monitor_libcalls "$@"
capture_io "$1" "" "output.txt"
