#!/usr/bin/env python3

import sys, re, subprocess
from collections import Counter


def main():
    # TODO: look up argparse
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <url>", file=sys.stderr)
        sys.exit(1)

    url = sys.argv[1]

    process = subprocess.run(["wget", "-q", "-O-", url], capture_output=True, text=True)
    webpage = process.stdout.lower()
    # x=$(echo hello)
    # print(webpage)

    # TODO - ignore HTML comments, e.g. <!-- blah  -->

    tags = re.findall(r"<\s*(\w+)", webpage)
    # print(tags)

    # counts = {}

    # for tag in tags:
    #     if tag in counts:
    #         counts[tag] += 1
    #     else:
    #         counts[tag] = 1

    counts = Counter()
    for tag in tags:
        counts[tag] += 1

    # for tag in sorted(counts):
    #     counts[tag]

    for tag, count in sorted(counts.items()):
        print(f"{tag} {count}")


if __name__ == "__main__":
    main()
