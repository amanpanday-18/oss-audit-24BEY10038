#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Aman Panday | Reg No: 24BEY10038
# Course: Open Source Software | Chosen Software: Firefox
# Description: Displays a welcome screen with system info
#              and details about the open-source OS license.
# ============================================================

# --- Variables ---
STUDENT_NAME="Aman Panday"
REG_NO="24BEY10038"
SOFTWARE_CHOICE="Mozilla Firefox"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                          # Linux kernel version
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)                         # Current logged-in user
HOME_DIR=$HOME                              # Home directory of current user
UPTIME=$(uptime -p)                         # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')        # e.g. Monday, 01 January 2025
CURRENT_TIME=$(date '+%H:%M:%S')            # e.g. 14:30:00

# --- OS License Information ---
# Linux (the OS running this script) is licensed under GPL v2
# The GNU General Public License v2 guarantees users the freedom to
# run, study, share, and modify the software.
OS_LICENSE="GNU General Public License version 2 (GPL v2)"

# --- Display the report ---
echo "============================================================"
echo "       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "============================================================"
echo ""
echo "  Student  : $STUDENT_NAME ($REG_NO)"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  OS LICENSE"
echo "------------------------------------------------------------"
echo "  This Linux system is covered by:"
echo "  $OS_LICENSE"
echo ""
echo "  The GPL v2 gives every user four core freedoms:"
echo "    [0] Freedom to RUN the program for any purpose"
echo "    [1] Freedom to STUDY and change how it works"
echo "    [2] Freedom to REDISTRIBUTE copies"
echo "    [3] Freedom to DISTRIBUTE modified versions"
echo ""
echo "  Unlike proprietary OS (e.g. Windows), GPL ensures"
echo "  no single company can lock the source code away."
echo "============================================================"
