#!/usr/bin/env bash

armstrong() {
    local number="$1"
    local length=${#number}
    local new=$number
    while ((new >= 1)); do
        digit=$((new%10))
        number=$((number - digit**length))
        new=$((new / 10))
    done
    if ((number==0)); then
        echo "true"
    else
        echo "false"
    fi
}

armstrong "$1"