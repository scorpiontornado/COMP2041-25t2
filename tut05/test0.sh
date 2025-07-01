#! /usr/bin/env/ dash

# ==============================================================================
# test0.sh
# Test the mygive-add & mygive-submit commands - basic assignment creation.
#
# Written by: Nicholas Langford <z5487536@ad.unsw.edu.au>
# Date: 2025-07-01
# For COMP2041/9044 Assignment 1
# ==============================================================================

# add the current directory to the PATH so scripts
# can still be executed from it after we cd

PATH="$PATH:$(pwd)"

# Create temp dir for test
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1 # True OR ???, False OR True
2041 fetch mygive

# Temp dir for refence files
ref_dir="$(mktemp -d)"
cd "$ref_dir" || exit 1
2041 fetch mygive

# Make temporary files
expected_stdout="$(mktemp)"
expected_stderr="$(mktemp)"
actual_stdout="$(mktemp)"
actual_stderr="$(mktemp)"

# Remove temp dir when test is done
trap 'rm "$expected_stdout" "$expected_stderr" "$actual_stdout" "$actual_stderr" -r "$test_dir"' \
    INT HUP QUIT TERM EXIT

# Create mygive assessment
cd "$ref_dir" || exit 1
2041 mygive-add lab03_scraping_courses scraping_courses.tests \
    > "$expected_stdout" 2> "$expected_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
mygive-add lab03_scraping_courses scraping_courses.tests \
    > "$actual_stdout" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

# if test "$exit_code" -ne "$ref_exit_code"; then
if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# Run mygive-summary to check assignment was created
cd "$ref_dir" || exit 1
2041 mygive-summary > "$expected_stdout" 2> "$expected_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
mygive-summary > "$actual_stdout" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

# if test "$exit_code" -ne "$ref_exit_code"; then
if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi
