#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Aman Panday | Reg No: 24BEY10038
# Course: Open Source Software | Chosen Software: Firefox
# Description: Loops through key system directories and
#              reports permissions, owner, and disk usage.
#              Also checks Firefox's config directory.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var/cache")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "============================================================"
echo ""
echo "  Column format: [Permissions] [Owner] [Group] | [Size]"
echo ""

# --- For loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory exists before trying to read it
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        # ls -ld gives: drwxr-xr-x 2 root root ... so awk fields 1,3,4
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get directory size, suppress permission-denied errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print the formatted report line
        echo "  $DIR"
        echo "    Permissions : $PERMS"
        echo "    Owner/Group : $OWNER / $GROUP"
        echo "    Size        : $SIZE"
        echo ""
    else
        # Directory doesn't exist on this system
        echo "  $DIR => Does NOT exist on this system"
        echo ""
    fi

done

echo "------------------------------------------------------------"
echo "  FIREFOX CONFIGURATION DIRECTORY CHECK"
echo "------------------------------------------------------------"
echo ""

# Firefox stores user profiles in ~/.mozilla/firefox/
# This is where bookmarks, preferences, and extensions live
FIREFOX_CONFIG="$HOME/.mozilla/firefox"

if [ -d "$FIREFOX_CONFIG" ]; then
    # Get permissions and size of Firefox config directory
    FF_PERMS=$(ls -ld "$FIREFOX_CONFIG" | awk '{print $1}')
    FF_OWNER=$(ls -ld "$FIREFOX_CONFIG" | awk '{print $3}')
    FF_SIZE=$(du -sh "$FIREFOX_CONFIG" 2>/dev/null | cut -f1)

    echo "  Firefox config found at: $FIREFOX_CONFIG"
    echo "    Permissions : $FF_PERMS"
    echo "    Owner       : $FF_OWNER"
    echo "    Size        : $FF_SIZE"
    echo ""
    echo "  Why this matters: Firefox stores profile data per-user."
    echo "  The directory is owned by the user (not root), meaning"
    echo "  Firefox runs with user-level privileges — a security"
    echo "  best practice. It cannot access system files directly."
else
    echo "  Firefox config directory NOT found at $FIREFOX_CONFIG"
    echo "  This means Firefox may not be installed, or has never"
    echo "  been launched to generate a profile."
fi

echo ""
echo "------------------------------------------------------------"
# Check the Firefox binary location as a bonus
FIREFOX_BIN=$(which firefox 2>/dev/null)
if [ -n "$FIREFOX_BIN" ]; then
    echo "  Firefox binary : $FIREFOX_BIN"
    BIN_PERMS=$(ls -l "$FIREFOX_BIN" | awk '{print $1, $3, $4}')
    echo "  Binary perms   : $BIN_PERMS"
else
    echo "  Firefox binary : Not found in PATH"
fi

echo ""
echo "============================================================"
echo "  Audit complete."
echo "============================================================"
