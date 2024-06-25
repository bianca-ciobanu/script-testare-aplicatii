measure_time() {
    local command=$@
    local start_time=$(date +%s%N)
    eval $command > /dev/null 2>&1
    local end_time=$(date +%s%N)
    local duration=$((end_time - start_time))
    echo "Execution time: $((duration / 1000000)) ms"
}
