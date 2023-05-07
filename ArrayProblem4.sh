#!/bin/bash

find_triplet_sum_zero() {
    local arr=("$@")
    local found=0
    local n=${#arr[@]}

    for ((i=0; i<n-2; i++)); do
        for ((j=i+1; j<n-1; j++)); do
            for ((k=j+1; k<n; k++)); do
                if (( arr[i] + arr[j] + arr[k] == 0 )); then
                    echo "Triplet found: ${arr[i]}, ${arr[j]}, ${arr[k]}"
                    found=1
                fi
            done
        done
    done

    if (( found == 0 )); then
        echo "No triplet found whose sum is zero."
    fi
}

read -p "Enter the number of elements: " count

numbers=()

for ((i=0; i<count; i++)); do
    read -p "Enter number $((i+1)): " num
    numbers+=($num)
done

find_triplet_sum_zero "${numbers[@]}"
