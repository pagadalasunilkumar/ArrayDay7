#!/bin/bash

find_repeated_digits() {
    local repeated_digits=()

    for ((i=0; i<=100; i++)); do
        num=$i
        last_digit=-1
        is_repeated=0

        while (( num > 0 )); do
            digit=$(( num % 10 ))
            num=$(( num / 10 ))

            if (( last_digit == digit )); then
                is_repeated=1
                break
            fi

            last_digit=$digit
        done

        if (( is_repeated == 1 )); then
            repeated_digits+=($i)
        fi
    done

    echo "${repeated_digits[@]}"
}

repeated_digits=$(find_repeated_digits)
digits_array=($repeated_digits)

echo "Digits repeated twice: ${digits_array[*]}"
