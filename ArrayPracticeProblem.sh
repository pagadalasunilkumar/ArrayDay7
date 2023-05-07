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
        if (( number < m
