#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./script4.sh /var/log/apache2/error.log [keyword]
# Purpose: Reads a log file, counts occurrences of a keyword, and shows the latest matches.

# Take log file path from 1st command line argument
LOGFILE=$1
# Take keyword from 2nd argument, default to "error" if not provided
KEYWORD=${2:-"error"}
COUNT=0

# --- Do-While style retry loop ---
# This simulates a do-while loop in bash to ensure we have a valid file
while true; do
    # Check if the file exists AND has a size greater than zero (-s flag)
    if [ -s "$LOGFILE" ]; then
        echo "Valid log file detected: $LOGFILE"
        break # Exit the loop, file is good
    else
        echo "Error: File '$LOGFILE' is either empty, not found, or no file was provided."
        # Prompt user to try again
        read -p "Please enter a valid log file path (e.g., /var/log/syslog): " LOGFILE
    fi
done

echo "Scanning $LOGFILE for the keyword: '$KEYWORD'..."

# --- While-Read loop ---
# Reads the file line by line
while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment the counter
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# Print the summary
echo "================================================="
echo "SUMMARY: Keyword '$KEYWORD' found $COUNT times."
echo "================================================="

# --- Print the last 5 matching lines ---
if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 Matching Lines ---"
    # grep finds the words, tail -n 5 limits it to the bottom 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi
