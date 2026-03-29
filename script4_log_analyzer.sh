#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Aman Panday | Reg No: 24BEY10038
# Course: Open Source Software | Chosen Software: Firefox
# Description: Reads a log file line by line, counts how many
#              lines match a keyword, and shows matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Accept command-line arguments ---
# $1 = log file path (required)
# $2 = keyword to search for (optional, defaults to 'error')
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if not provided

# --- Counter variable for tracking matches ---
COUNT=0

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the specified file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo ""

    # --- Retry logic: suggest alternative log files ---
    echo "Trying common log file locations..."
    ALTERNATIVES=("/var/log/syslog" "/var/log/messages" "/var/log/kern.log")

    for ALT in "${ALTERNATIVES[@]}"; do
        if [ -f "$ALT" ]; then
            echo "Found: $ALT — switching to this file."
            LOGFILE="$ALT"
            break
        fi
    done

    # If still no valid file found, exit
    if [ ! -f "$LOGFILE" ]; then
        echo "No readable log file found. Exiting."
        exit 1
    fi
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: '$LOGFILE' is empty. Nothing to analyze."
    exit 0
fi

echo "============================================================"
echo "           LOG FILE ANALYZER"
echo "============================================================"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD' (case-insensitive)"
echo "------------------------------------------------------------"
echo ""

# --- While-read loop: read the log file line by line ---
# IFS= prevents stripping leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # --- If-then check: does this line contain our keyword? ---
    # grep -iq = case-insensitive, quiet (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))  # Increment counter
    fi

done < "$LOGFILE"   # Feed file into while loop via input redirection

# --- Print the count summary ---
echo "  RESULT: Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "  $LOGFILE"
echo ""

# --- Show the last 5 matching lines for context ---
if [ "$COUNT" -gt 0 ]; then
    echo "------------------------------------------------------------"
    echo "  LAST 5 MATCHING LINES:"
    echo "------------------------------------------------------------"
    # Use grep and tail together to find last 5 matches
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "  No lines matched '$KEYWORD' in this log file."
fi

echo ""
echo "------------------------------------------------------------"
# --- Bonus: show total line count of the file ---
TOTAL_LINES=$(wc -l < "$LOGFILE")
echo "  Total lines in file : $TOTAL_LINES"
echo "  Matching lines      : $COUNT"

# Calculate percentage if total > 0 using integer arithmetic
if [ "$TOTAL_LINES" -gt 0 ]; then
    PERCENT=$(( COUNT * 100 / TOTAL_LINES ))
    echo "  Match percentage    : ~${PERCENT}%"
fi

echo "============================================================"
