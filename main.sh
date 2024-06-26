#!/bin/bash
source ./measure_time.sh
source ./syscalls.sh
source ./libcalls.sh
source ./input_output.sh
nume_fisier="$1"


if [ ! -f "$nume_fisier" ]; then
    echo "File $nume_fisier doesn't exist."
    exit 1
fi
nume_executable="${nume_fisier%.c}"
shift
argumente_program="$@"
gcc "$nume_fisier" -o "$nume_executable" 2> compile_errors.txt

if [ $? -ne 0 ]; then
    echo "Compiling error for $nume_fisier. Details in compile_errors.txt"
    exit 1
else
    echo "Compiling successful for $nume_fisier."
    measure_time ./$nume_executable $argumente_program
    capture_io $nume_executable $argumente_program
    monitor_libcalls ./$nume_executable $argumente_program
    monitor_syscalls ./$nume_executable $argumente_program
fi
