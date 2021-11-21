#!/bin/bash
# Copyright (C) 2021 Muhammad Athallah, Fawzan Fawzi

# This free document is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# REV03 Sun 21 Nov 2021 16:00:00 WIB
# REV02 Tue 19 Oct 2021 13:30:00 WIB
# REV01 Tue 19 Oct 2021 12:40:50 WIB
# START Tue 19 Oct 2021 11:02:45 WIB

# Error functions
errormsg() { echo "$1" 1>&2; exit 1; } # Print error messages to stderr and exit

# Printing Grades
printgrades() {
    echo "### GRADES OF DW$WEEK ###"
    echo "GRADE DETAILS   | MYGRADE          | BENCHMARK"
    echo "-----------------------------------------------------"
    for file in $LOCATE/mygrade/DW$WEEK/*
    do
        FILENAME="${file##*/}"
        FIRSTPART="$(printf '%-15s' "$FILENAME")"
        MYGRADE="$(cat $file)"
        SECONDPART="$(printf '%-16s' "$MYGRADE")"
        BENCHMARK="$(cat $LOCATE/benchmark/DW$WEEK/$FILENAME)"
        THIRDPART="$(printf '%-16s' "$BENCHMARK")"
        echo "$FIRSTPART | $SECONDPART | $THIRDPART"
    done
}

# Getting the options
while getopts ":n:l:o:w:r:h" op; do case "$op" in
    n) ACCNAME="$OPTARG";;
    l) LOCATE="$OPTARG" ;;
    o) OUTPUT="$OPTARG" ;;
    w) WEEK="$OPTARG" ;;
    r) REFRESH=1 ;;
    h) printf "Available Options:\\n%s\\n%s\\n%s\\n%s\\n" \
           "  -n: Github User (Default: determinedguy)" \
           "  -l: Extracted grade location (Default: ~/tarball-grade)" \
           "  -o: Output grade to file. Optional (usage: -o /path/to/file)" \
           "  -w: The desired week to be checked in two-digit format, optional (will ask if you don't add this option)" \
           "  -r: Redownload tarballs for updating your grades for all weeks" \
           "  -h: Show this help and exit"
       exit 0;;
esac done

# Basic variables
[ -z "$ACCNAME" ] && ACCNAME="determinedguy"
[ -z "$LOCATE" ] && LOCATE="$HOME/tarball-grade"
[ -z "$WEEK" ] && read -p "Please enter the desired week to be checked: " WEEK

# Error handling
[ "${#WEEK}" -eq 1 ] && WEEK="0$WEEK" # In case the user inputs one digit number
[ "$WEEK" -lt 0 ] || [ "$WEEK" -gt 11 ] || [ "${#WEEK}" -gt 2 ] && errormsg "The entered week number is invalid (must be between 00 - 11)"

# If LOCATE dir exists, check if it is a directory.
if [ -e "$LOCATE" ]; then
    [ -d "$LOCATE" ] || errormsg "$LOCATE already exists and is not a directory"
    # Remove directories if either mygrade or benchmark directories are empty or doesn't exist or when -r flag is given
    [ -z "$(ls -A $LOCATE/mygrade 2>/dev/null)" ] || [ -z "$(ls -A $LOCATE/benchmark 2>/dev/null)" ] && REFRESH=1
    [ -n "$REFRESH" ] && rm -rf "$LOCATE/mygrade" "$LOCATE/benchmark" 
else
    REFRESH=1
fi

# Make directories.
mkdir -p "$LOCATE/mygrade" "$LOCATE/benchmark"

# Download mygrade and benchmark
if [ -n "$REFRESH" ]; then
    echo "Downloading tarballs..."
    [ -e "/tmp/decrypt-fail" ] || wget -q https://os.vlsm.org/Log/$ACCNAME.tar.bz2.txt -O /tmp/$ACCNAME.tar.bz2.txt || errormsg "$ACCNAME doesn't exist in the log"
    [ -e "/tmp/decrypt-fail" ] || wget -q https://cbkadal.github.io/os212/SandBox/TARBALL.tar.bz2 -O /tmp/TARBALL.tar.bz2
    gpg --decrypt /tmp/$ACCNAME.tar.bz2.txt > /tmp/$ACCNAME.tar.bz2 || { touch /tmp/decrypt-fail; errormsg "Failed to decrypt tarball"; }
    tar -xf /tmp/$ACCNAME.tar.bz2 -C $LOCATE/mygrade
    tar -xf /tmp/TARBALL.tar.bz2 -C $LOCATE/benchmark
    rm -rf /tmp/decrypt-fail
fi

# Print grades
if [ -z "$OUTPUT" ]; then
    printgrades
else
    printgrades | tee $OUTPUT
    echo "Grades has been output into $OUTPUT"
fi
