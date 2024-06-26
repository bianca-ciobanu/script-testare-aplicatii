#!/bin/bash

capture_io() {
    local command=./$1
    local input_file=$2
    local output_file="output.txt"
    local error_file="error.txt"

    if [[ -f $input_file ]]; then
        $command < $input_file > $output_file 2> $error_file
        echo "Input from file: $(cat $input_file)"
    else
        echo "Enter input (type 'exit' to finish):"

        temp_input=$(mktemp)
        
        while true; do
            read -r user_input
            if [[ "$user_input" == "exit" ]]; then
                break
            fi
            echo "$user_input" >> $temp_input
        done
        
        $command < $temp_input > $output_file 2> $error_file

        echo "Input from keyboard:"
        cat $temp_input
        
        # Șterge fișierul temporar
        rm $temp_input
    fi
    
    if [[ -s "$error_file" ]]
    then
    echo "Error occured:"
    cat $error_file
    exit 1
    fi

    echo "Output: $(cat $output_file)"
}

