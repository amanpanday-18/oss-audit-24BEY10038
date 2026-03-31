#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Purpose: Interactively asks the user questions and generates a text file manifesto.

# --- Concept Demonstration: Aliases ---
# An alias is a shortcut for a command. If we uncommented the line below, 
# the user could type 'manifesto' in their terminal instead of './script5.sh'
# alias manifesto='./script5.sh'

echo "================================================="
echo "      The Open Source Manifesto Generator"
echo "================================================="
echo "Please answer these three questions:"
echo ""

# --- Interactive Prompts ---
# -p flag allows us to prompt the user and read their input into a variable on the same line
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one software tool you would like to build and share freely: " BUILD

# Get today's date in 'Day Month Year' format
DATE=$(date +'%d %B %Y')
# Generate a dynamic output filename based on the current user
OUTPUT="manifesto_$(whoami).txt"

echo "-------------------------------------------------"
echo "Drafting your personal manifesto..."

# --- Writing to a file ---
# Using > completely overwrites the file (or creates it) for the first line
echo "My Open Source Manifesto" > "$OUTPUT"
echo "Recorded on: $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Using >> appends to the file without destroying the previous lines
echo "On this day, I declare that my daily digital workflow relies heavily on the open-source tool $TOOL." >> "$OUTPUT"
echo "To me, software freedom is not just about cost; it ultimately means $FREEDOM." >> "$OUTPUT"
echo "Because I benefit immensely from the collective labor of the open-source community," >> "$OUTPUT"
echo "I promise that one day I will build a $BUILD and share its source code freely with the world." >> "$OUTPUT"

echo "[SUCCESS] Manifesto saved to $OUTPUT"
echo "================================================="
echo "          Here is what you wrote:"
echo "================================================="

# Display the final file to the user
cat "$OUTPUT"
echo "================================================="
