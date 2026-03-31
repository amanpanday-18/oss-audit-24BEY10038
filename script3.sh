#!/bin/bash
# Script 3: Disk and Permission Auditor
# Purpose: Loops through critical system directories to report their sizes, owners, and permissions.

# Array containing standard Linux directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "================================================="
echo "          Directory Audit Report"
echo "================================================="

# --- For loop to iterate through the array ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists
    if [ -d "$DIR" ]; then
        # Extract permissions, user owner, and group owner using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Extract human-readable size, suppressing permission denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # Display formatted results
        echo "[EXISTS] $DIR => Permissions/Owner: $PERMS | Size: $SIZE"
    else
        echo "[MISSING] $DIR does not exist on this system."
    fi
done

echo "-------------------------------------------------"
echo "          Specific Software Audit: Apache"
echo "-------------------------------------------------"

# --- Specific check for the Apache configuration directory ---
APACHE_DIR="/etc/apache2"

if [ -d "$APACHE_DIR" ]; then
    APACHE_PERMS=$(ls -ld "$APACHE_DIR" | awk '{print $1, $3, $4}')
    echo "[FOUND] $APACHE_DIR"
    echo "Permissions/Owner: $APACHE_PERMS"
else
    echo "[NOT FOUND] Apache config directory ($APACHE_DIR) does not exist."
fi
echo "================================================="
