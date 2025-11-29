#!/usr/bin/env bash

square_of_sum() {
    local limit="$1"
    local sum=$(( limit*(limit+1)/2 ))
    local squared=$((sum**2))
    echo $squared
}

sum_of_squares() {
    local limit="$1"
    local sum_of_squares=$((limit*(limit+1)*(2*limit+1)/6))
    echo $sum_of_squares
}

difference_of_squares() {
    local limit="$1"
    local sum=$(( limit*(limit+1)/2 ))
    local sum_of_squares=$(( limit*(limit+1)*(2*limit+1)/6 ))
    local difference=$((sum**2 - sum_of_squares))
    echo $difference
}

case "$1" in
    square_of_sum) square_of_sum "$2" ;;
    sum_of_squares) sum_of_squares "$2" ;;
    difference) difference_of_squares "$2" ;;
esac