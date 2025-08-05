#!/usr/bin/env python3

# COMP2041 25T2, T11A Tutorial 10, Q3

import sys

VOWELS = "aeiou"


def main():
    tr = str.maketrans(VOWELS.upper() + VOWELS.lower(), VOWELS.lower() + VOWELS.upper())

    for line in sys.stdin:
        print(line.translate(tr), end="")


if __name__ == "__main__":
    main()
