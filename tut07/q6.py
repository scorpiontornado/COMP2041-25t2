#! /usr/bin/env python3

# COMP2041 25T2, T11A Tutorial 7, Q6
#
# "Modify the head program from the previous question so that, as well
# as handling an optional -n argument to specify how many lines, it also
# handles multiple files on the command line and displays the first n
# lines from each file, separating them by a line of the form ==>
# FileName <===."

# ./q6.py
# ./q6.py -5
# ./q6.py filename filename2
# ./q6.py -5 filename filename2
# ./q6.py -5 filename -

import sys

n_lines = 10
if len(sys.argv) > 1 and sys.argv[1].startswith("-"):
    # TODO: error handling - invalid command line arg
    arg = sys.argv.pop(1)
    n_lines = int(arg[1:])

if len(sys.argv) == 1:
    files = ["-"]
else:
    files = sys.argv[1:]

# files = ["-"] if len(sys.argv) == 1 else sys.argv[1:]

for filename in files:
    print(f"==> {filename} <==")

    if filename == "-":
        stream = sys.stdin
    else:
        stream = open(filename) # TODO: error handling

    for i, line in enumerate(stream):
        if i >= n_lines:
            break
        sys.stdout.write(line)

    if stream != sys.stdin:
            stream.close()