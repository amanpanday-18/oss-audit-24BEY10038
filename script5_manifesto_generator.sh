#!/bin/bash
# ============================================================
# Script 5: The Open Source Manifesto Generator
# Author: Aman Panday | Reg No: 24BEY10038
# Course: Open Source Software | Chosen Software: Firefox
# Description: Asks the user three questions interactively,
#              then generates a personalised open-source
#              philosophy statement and saves it to a .txt file.
# Concepts: read, string concatenation, >, >>, date, aliases
# ============================================================

# --- Alias demonstration ---
# Aliases let you create shortcuts for longer commands.
# In a script, we use 'alias' to show the concept, though they
# are more commonly used interactively in .bashrc
# alias today='date +%d-%B-%Y'   # Example: typing 'today' gives the date

# --- Get current date and username for the output file ---
DATE=$(date '+%d %B %Y')
TIME=$(date '+%H:%M:%S')
AUTHOR=$(whoami)

# --- Output file name: personalised to the user ---
OUTPUT="manifesto_${AUTHOR}.txt"

# --- Welcome Banner ---
echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "       Inspired by Firefox & the Free Software Movement"
echo "============================================================"
echo ""
echo "  Answer three questions to create your personal"
echo "  open-source philosophy statement."
echo ""
echo "------------------------------------------------------------"

# --- Question 1: An open-source tool they use daily ---
# 'read -p' prints a prompt and waits for user input
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

# --- Question 2: What freedom means to them ---
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

# --- Question 3: Something they would build and share ---
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Compose the manifesto paragraph using string concatenation ---
# We build the manifesto by combining the user's answers with
# connecting sentences to form a coherent philosophy statement.

LINE1="Open Source Manifesto"
LINE2="Written by: $AUTHOR | Date: $DATE | Time: $TIME"
LINE3="Chosen Software Studied: Mozilla Firefox"
LINE4=""
LINE5="Every day, I rely on $TOOL — a tool built openly by a global"
LINE6="community of contributors who chose to share their work rather"
LINE7="than lock it behind a paywall or proprietary license."
LINE8=""
LINE9="To me, 'freedom' in software means $FREEDOM. It means having"
LINE10="the right to see the code that runs on my machine, to question it,"
LINE11="to fix it, and to share it. This is not just a technical preference —"
LINE12="it is a belief about how knowledge should work in the world."
LINE13=""
LINE14="If I were to build something, I would create $BUILD and release it"
LINE15="under an open-source license — because standing on the shoulders of"
LINE16="giants obligates us to lift others in return."
LINE17=""
LINE18="Firefox taught me that a community — not a corporation — can build"
LINE19="something millions of people trust. That is the power of open source."
LINE20=""
LINE21="--- End of Manifesto ---"

# --- Write manifesto to file using > (overwrite) ---
# The first write uses > to create/overwrite the file
echo "$LINE1" > "$OUTPUT"

# --- Append remaining lines using >> ---
# >> adds to the file without erasing what's already there
echo "$LINE2" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "$LINE3" >> "$OUTPUT"
echo "$LINE4" >> "$OUTPUT"
echo "$LINE5" >> "$OUTPUT"
echo "$LINE6" >> "$OUTPUT"
echo "$LINE7" >> "$OUTPUT"
echo "$LINE8" >> "$OUTPUT"
echo "$LINE9" >> "$OUTPUT"
echo "$LINE10" >> "$OUTPUT"
echo "$LINE11" >> "$OUTPUT"
echo "$LINE12" >> "$OUTPUT"
echo "$LINE13" >> "$OUTPUT"
echo "$LINE14" >> "$OUTPUT"
echo "$LINE15" >> "$OUTPUT"
echo "$LINE16" >> "$OUTPUT"
echo "$LINE17" >> "$OUTPUT"
echo "$LINE18" >> "$OUTPUT"
echo "$LINE19" >> "$OUTPUT"
echo "$LINE20" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "$LINE21" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "============================================================"
echo "  YOUR MANIFESTO:"
echo "============================================================"
echo ""

# --- Display the manifesto using cat ---
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  Done! Keep building. Keep sharing. Keep it open."
echo "============================================================"
