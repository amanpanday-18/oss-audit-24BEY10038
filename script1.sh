#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name - FILL THIS IN]
# Course: Open Source Software
# Purpose: Introduces the Linux system, displaying OS info, user info, and license.

# --- Variables ---
STUDENT_NAME=Aman Panday
SOFTWARE_CHOICE="Apache HTTP Server"

# --- System Info Gathering (Command Substitution) ---
# Extracts the kernel release version
KERNEL=$(uname -r)
# Gets the current logged-in user
USER_NAME=$(whoami)
# Gets the user's home directory from the environment variable
HOME_DIR=$HOME
# Gets the human-readable uptime of the system
UPTIME=$(uptime -p)
# Extracts the OS distribution name from the os-release file
DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
# Gets the current date and time
CURRENT_DATE=$(date +"%A, %d %B %Y %T")
# The license governing the Linux kernel
LICENSE_MSG="The Linux Kernel is proudly covered by the GNU General Public License v2 (GPL)."

# --- Display Output ---
echo "==================================================="
echo "   The Open Source Audit | Welcome Screen"
echo "==================================================="
echo "Student Name    : $STUDENT_NAME"
echo "Chosen Software : $SOFTWARE_CHOICE"
echo "---------------------------------------------------"
echo "Current Date    : $CURRENT_DATE"
echo "Distribution    : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "---------------------------------------------------"
echo "Logged-in User  : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME"
echo "---------------------------------------------------"
echo "$LICENSE_MSG"
echo "==================================================="
