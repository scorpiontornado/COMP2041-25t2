#!/usr/bin/env python3

import sys, re, subprocess
from collections import Counter
from argparse import ArgumentParser


def main():
    parser = ArgumentParser()
    parser.add_argument("url", help="url to fetch")  # positional argument
    parser.add_argument(
        "-f", "--frequency", action="store_true", help="print tags by frequency"
    )  # on/off flag
    args = parser.parse_args()

    process = subprocess.run(
        ["wget", "-q", "-O-", args.url], capture_output=True, text=True
    )
    webpage = process.stdout.lower()
    # x=$(echo hello)
    # print(webpage)

    webpage = re.sub(r"<!--.*?-->", "", webpage, flags=re.DOTALL)

    tags = re.findall(r"<\s*(\w+)", webpage)

    counts = Counter()
    for tag in tags:
        counts[tag] += 1

    if args.frequency:
        for tag, count in reversed(counts.most_common()):
            print(f"{tag} {count}")
    else:
        for tag, count in sorted(counts.items()):
            print(f"{tag} {count}")


if __name__ == "__main__":
    main()
