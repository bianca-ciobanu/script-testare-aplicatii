#!/bin/bash
source ./measure_time.sh
source ./syscalls.sh
measure_time "$1"
monitor_syscalls "$1"
