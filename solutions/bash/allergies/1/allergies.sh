#!/usr/bin/env bash

allergies=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

allergic_to() {
    local score="$1"
    local allergy="$2"
    for i in "${!allergies[@]}"; do
        [[ ${allergies[i]} == "$allergy" ]] && (( (score >> i) & 1 )) && echo "true" && return
    done
    echo "false"
}

list() {
    local score="$1"
    local real=()
    for i in "${!allergies[@]}"; do
        (( (score >> i) & 1 )) && real+=("${allergies[i]}")
    done
    echo "${real[*]}"
}

case "$2" in
    allergic_to) allergic_to "$1" "$3" ;;
    list) list "$1" ;;
esac