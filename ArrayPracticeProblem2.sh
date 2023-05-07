#!/bin/bash

generate_random_numbers() {
    local arr=()

    for ((i=0; i<10; i++)); do
        number=$((100 + RANDOM % 900))
        arr+=($number)
    done

    echo "${arr[@]}"
}

find_second_largest() {
    local arr=("$@")
    local max1=0
    local max2=0

    for number in "${arr[@]}"; do
        if (( number > max1 )); then
            max2=$max1
            max1=$number
        elif (( number > max2 && number < max1 )); then
            max2=$number
        fi
    done

    echo "$max2"
}

find_second_smallest() {
    local arr=("$@")
    local min1=1000
    local min2=1000

    for number in "${arr[@]}"; do
        if (( number < min1 )); then
            min2=$min1
            min1=$number
        elif (( number < min2 && number > min1 )); then
            min2=$number
        fi
    done

    echo "$min2"
}

random_numbers=$(generate_random_numbers)
numbers_array=($random_numbers)

echo "Generated numbers: ${numbers_array[*]}"

# Sort the array in ascending order
sorted_array=($(printf "%s\n" "${numbers_array[@]}" | sort -n))

second_largest=$(find_second_largest "${sorted_array[@]}")
second_smallest=$(find_second_smallest "${sorted_array[@]}")

echo "Sorted numbers: ${sorted_array[*]}"
echo "Second largest number: $second_largest"
echo "Second smallest number: $second_smallest"
