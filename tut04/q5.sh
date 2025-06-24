#!/bin/dash

for file in $@; do
    if [ -d "$file" ]; then
        # Recurse (would normally use a function)
        # ./"$0" "$file"/* "$file"/.*
        ./"$0" "$file"/* "$file"/.[!.]* "$file"/..?*
    fi

    if [ ! -f "$file" ]; then
        # Not a file, skip
        continue
    fi

    # Change (substitute) all occurrences of COMP2041 with COMP2042, and
    # COMP9044 with COMP9042. -i for in-place (directly modify the file)
    sed -iE 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' "$file"
done
