#!/bin/bash
# Script 2: FOSS Package Inspector
# Purpose: Checks if the chosen software is installed and prints a philosophical note.
# Note: Modified from the RPM starter code to use 'dpkg', which is the standard for Ubuntu 24.04.

PACKAGE="apache2" # 'apache2' is the package name for Apache on Ubuntu

echo "Checking system for $PACKAGE..."

# --- Check if package is installed ---
# dpkg -l lists packages. grep -q runs quietly and returns success if found.
if dpkg -l | grep -qw "^ii.*$PACKAGE"; then
    echo -e "\n[SUCCESS] $PACKAGE is installed on this system."
    echo "--- Package Details ---"
    # Extract just the Version and Description lines for clean output
    dpkg -s $PACKAGE | grep -E '^Version|^Description'
else
    echo -e "\n[WARNING] $PACKAGE is NOT installed."
    echo "You can install it by running: sudo apt install $PACKAGE"
fi

echo -e "\n--- Open Source Philosophy Note ---"
# --- Case statement to evaluate the package name ---
case $PACKAGE in
    apache2|httpd) 
        echo "Apache: The web server that built the open internet and powers the LAMP stack." 
        ;;
    mysql) 
        echo "MySQL: Open source at the heart of millions of dynamic web apps." 
        ;;
    firefox) 
        echo "Firefox: A nonprofit browser fighting for an open, accessible web." 
        ;;
    vlc) 
        echo "VLC: Plays anything - built by students in Paris, completely free." 
        ;;
    *) 
        echo "Philosophy unknown for this package. Research its FOSS origins!" 
        ;;
esac
echo "-----------------------------------"
