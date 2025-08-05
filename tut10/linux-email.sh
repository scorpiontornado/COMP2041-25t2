#!/usr/bin/env sh

# COMP2041 25T2, T11A Tutorial 10, Q5

directory=/usr/src/linux

# for file in "$directory"/*.c; do

# if whitespace, bad :(
for file $(find "$directory" -type f -name '*.c'); do
    echo "TODO - email Andrew the file"
done

# find "$directory" -type f -name '*.c' -exec echo hello, file {} \;

