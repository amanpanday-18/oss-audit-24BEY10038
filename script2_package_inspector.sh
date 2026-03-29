#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Aman Panday | Reg No: 24BEY10038
# Course: Open Source Software | Chosen Software: Firefox
# Description: Checks if Firefox (and other FOSS tools) are
#              installed, shows version/license, and prints
#              a philosophy note about each using case.
# ============================================================

# --- List of packages to inspect ---
# We check Firefox plus 3 other notable open-source packages
PACKAGES=("firefox" "git" "python3" "vlc")

echo "============================================================"
echo "          FOSS PACKAGE INSPECTOR"
echo "============================================================"
echo ""

# --- Loop through each package and inspect it ---
for PACKAGE in "${PACKAGES[@]}"; do

    echo "------------------------------------------------------------"
    echo "  Package: $PACKAGE"
    echo "------------------------------------------------------------"

    # --- Check if the package is installed ---
    # 'dpkg -l' lists installed packages on Debian/Ubuntu
    # We redirect stderr to /dev/null to suppress error messages
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        # Package IS installed — show version and license info
        echo "  Status  : INSTALLED"

        # Get the version using dpkg-query
        VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
        echo "  Version : $VERSION"

        # Get the license info from package metadata
        LICENSE=$(apt-cache show "$PACKAGE" 2>/dev/null | grep -i "^License" | head -1)
        if [ -n "$LICENSE" ]; then
            echo "  $LICENSE"
        fi

        # Get a one-line summary of what the package does
        SUMMARY=$(apt-cache show "$PACKAGE" 2>/dev/null | grep "^Description:" | head -1 | cut -d: -f2-)
        echo "  Summary :$SUMMARY"

    else
        # Package is NOT installed
        echo "  Status  : NOT INSTALLED"
        echo "  Tip     : Install with: sudo apt install $PACKAGE"
    fi

    # --- Case statement: print a philosophy note about each package ---
    # This connects the technical tool to the open-source philosophy
    case $PACKAGE in
        firefox)
            echo ""
            echo "  [Philosophy] Firefox is Mozilla's answer to a closed web."
            echo "  When Internet Explorer monopolized browsing, the open-source"
            echo "  community built Firefox to keep the web free and standards-based."
            echo "  Licensed under MPL 2.0 — you can read every line of code."
            ;;
        git)
            echo ""
            echo "  [Philosophy] Git was born from necessity. Linus Torvalds built it"
            echo "  in 2005 after the proprietary BitKeeper revoked Linux's free license."
            echo "  It became the world's most used version control system — GPL v2."
            ;;
        python3)
            echo ""
            echo "  [Philosophy] Python's PSF License is one of the most permissive."
            echo "  The language is governed by the Python Software Foundation — a"
            echo "  nonprofit — ensuring it stays free and community-driven forever."
            ;;
        vlc)
            echo ""
            echo "  [Philosophy] VLC was built by students at École Centrale Paris"
            echo "  to stream video over their campus network. No proprietary tool"
            echo "  could do it freely. Today it plays virtually any format — LGPL."
            ;;
        *)
            echo ""
            echo "  [Philosophy] This is an open-source tool. Its source code is"
            echo "  publicly available for anyone to read, audit, and improve."
            ;;
    esac

    echo ""
done

echo "============================================================"
echo "  Inspection complete. All software above is open-source."
echo "============================================================"
