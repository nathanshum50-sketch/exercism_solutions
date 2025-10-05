#!/usr/bin/env bash
reverse() {
    local string=""
    local length=${#1}
    for((i=0; i<length; i++)) {
        local d=${1:$i:1}
        string="${d}${string}"
    }
    echo "$string"
}

reverse "$1"