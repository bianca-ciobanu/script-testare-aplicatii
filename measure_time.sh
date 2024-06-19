measure_time() {
    local command=$1
    local start_time=$(date +%s%N)
    eval $command
    local end_time=$(date +%s%N)
    local duration=$((end_time - start_time))
    echo "Execution time: $((duration / 1000000)) ms"
}
