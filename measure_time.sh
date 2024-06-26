measure_time() {
    local command="$1"
    local error_file="error.txt"
    echo "We start measuring time..."
    local start_time=$(date +%s%N)
    $command 2> $error_file
    if [ -s "$error_file" ]
    then
    echo "Error occured:"
    cat $error_file
    exit 1
    fi
    local end_time=$(date +%s%N)
    local duration=$((end_time - start_time))
    echo "Execution time: $((duration / 1000000)) ms"
}
