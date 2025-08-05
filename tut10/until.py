#!/usr/bin/env python3

# COMP2041 25T2, T11A Tutorial 10, Q2


from argparse import ArgumentParser
from re import compile
import sys


def main():
    parser = ArgumentParser()
    parser.add_argument("stop")
    args = parser.parse_args()

    # if args.stop.isnumeric():
    #     stop = int(args.stop)
    # else:
    #     pass

    try:
        stop = int(args.stop)
    except ValueError:
        # stop = compile(args.stop[1:-1])
        stop = compile(args.stop.strip("/"))

    for i, line in enumerate(sys.stdin, start=1):
        # line = line.strip()

        # if line[-1:] == "\n":
        #     line = line[:-1]

        line = line.rstrip("\n")

        print(line)

        if isinstance(stop, int):
            if stop == i:
                break
        else:
            # print(f"{line=}")
            # print(f"line: {line}")
            if stop.search(line):
                break


if __name__ == "__main__":
    main()
