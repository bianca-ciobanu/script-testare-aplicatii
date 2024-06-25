#!/bin/bash

capture_io() {
    local command=$1
    local input_file=$2
    local output_file=$3

    if [[ -f $input_file ]]; then
        eval $command < $input_file > $output_file
        echo "Input from file: $(cat $input_file)"
    else
        echo "Enter input (type 'exit' to finish):"
        # Pregătește un fișier temporar pentru a stoca inputul de la tastatură
        # temp_input=$(mktemp)
        
        while true; do
            read -r user_input
           if [[ "$user_input" == "exit" ]]; then
                break
            fi
           temp_input=`echo "$user_input"`
           #echo $temp_input
        done
        if [[ -f $temp_input ]]; then
          eval $command < $temp_input > $output_file
          else
          eval $command > $output_file
        fi
        echo "Input from keyboard:"
        echo "$temp_input"
        
        # Șterge fișierul temporar
        # rm $temp_input
    fi

    echo "Output: $(cat $output_file)"
}

