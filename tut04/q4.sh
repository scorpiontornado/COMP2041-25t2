#!/bin/dash

# Command-line arguments, number of arguments, and the first argument,
# respectively ($0, the program name, isn't included in $@ or $#)
# echo $@
# echo $#
# echo $1

for file in $@; do
    if [ ! -f "$file" ]; then
        # Not a file, skip
        continue
    fi

    # temporary_file="$(mktemp)"
    # sed 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' "$file" > "$temporary_file" \
    #     && mv "$temporary_file" "$file"
    #     # && to short-circuit if something goes wrong
    # rm -f "$temporary_file"

    # Change (substitute) all occurrences of COMP2041 with COMP2042, and
    # COMP9044 with COMP9042. -i for in-place (directly modify the file)
    sed -iE 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' "$file"
done
