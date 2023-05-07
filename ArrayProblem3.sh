#!/bin/bash

get_prime_factors() {
    local num=$1
    local factors=()

    for ((i=2; i<=num; i++)); do
        while (( num % i == 0 )); do
            factors+=($i)
            num=$((num / i))
        done
    done

    echo "${factors[@]}"
}

read -p "Enter a number: " number

prime_factors=$(get_prime_factors "$number")
factors_array=($prime_factors)

echo "Prime factors of $number: ${factors_array[*]}"
