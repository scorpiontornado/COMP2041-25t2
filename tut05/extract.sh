#! /usr/bin/env dash

# COMP2041 25T2, T11A
# Tutorial 5, Q6
#
# "Write a shell script extract.sh that, when given one or more archive files as
# command line arguments, will use the correct program to extract the files."

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file> [<file> ...]"
    exit 2;
fi

status=0

for archive in "$@"; do
    if [ ! -f "$archive" ]; then
        echo "$0: error: '$archive' isn't a file!" >&2
        status=1
        continue
    fi

    case "$archive" in
        *.tar) tar xf "$archive" ;;
        *.zip) unzip "$archive" ;;
        *.rar) rar x "$archive" ;;
        *)
            echo "$0: '$archive' can't be extracted - invalid file type!" >&2
            status=1
        ;;
    esac
done

exit $status
