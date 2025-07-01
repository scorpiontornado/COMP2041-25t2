#!/bin/dash

# Here's a script provided by a student for resetting your assignment directory.
# Not endorsed by course staff, use at your discretion.

# Quickly adds stuff like tar files and that to current directory
# i use this in conjunction with rm dir/* to reset the environment
# Written by Genrick Sison for Assignment 1 of COMP2041 25T2

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <assignment name>"
    exit 1
fi

ass_name="$1"

mkdir "tests"
touch "tests/test01.txt"

# look up what the flags mean (this is my preference)
tar -cvf "test.tar" "tests"

# mygive-add: <name> <tar file>
2041 mygive-add "${ass_name}" "test.tar"
