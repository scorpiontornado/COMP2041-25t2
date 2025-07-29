#!/usr/bin/env python3

import sys, subprocess, re

if len(sys.argv) != 2:
    print(f"Usage: {sys.argv[0]} <URL>")
    exit(1)

url = sys.argv[1]

contents = subprocess.run(["wget", "-O", "-", url], capture_output=True).stdout
# print(contents)

nums = re.findall(r"((\d[ -]*){8,15})", str(contents))

# print(nums)

for num in nums:
    print(num[0])
# 