# 🌐 OSS Capstone Project: The Open Source Audit

## 📋 Student Information

| Role | Details |
| :--- | :--- |
| **Student Name** | Aman Panday |
| **Registration Number** | 24BEY10038 |
| **Chosen Software** | Apache HTTP Server (`apache2`) |
| **Environment** | Ubuntu 24.04 LTS |

---

## 🎯 Repository Purpose

This repository contains the practical shell scripting component of the Open Source Audit project. The scripts within demonstrate core Linux command-line capabilities, system administration, and automation principles as they relate to the Apache HTTP Server. 

---

## 📂 Script Inventory

| Script File | Name | Description & Concepts Utilized |
| :--- | :--- | :--- |
| `script1.sh` | **System Identity Report** | Generates a system welcome screen detailing the OS distribution, active kernel, logged-in user, and GPL licensing. <br>*(Concepts: Variables, Command Substitution, Output Formatting)* |
| `script2.sh` | **FOSS Package Inspector** | Scans the local system using `dpkg` to verify if the `apache2` server is installed, outputting a custom philosophical summary. <br>*(Concepts: if-then-else, Case Statements, Grep Piping)* |
| `script3.sh` | **Disk & Permission Auditor** | Iterates through an array of critical system directories (including Apache's config) to audit storage size, ownership, and permissions. <br>*(Concepts: For Loops, Arrays, Awk text processing)* |
| `script4.sh` | **Log File Analyzer** | Parses the Apache `error.log` file to count specific warning/error keywords and outputs the most recent occurrences. <br>*(Concepts: While-Read Loops, Command-line Arguments, Integer Math)* |
| `script5.sh` | **Manifesto Generator** | An interactive script that prompts the user for input regarding their FOSS philosophy and generates a personalized `.txt` manifesto. <br>*(Concepts: User Input (read), File Redirection, String Concatenation)* |

---

## ⚙️ System Dependencies

To successfully execute this script suite, ensure the target environment meets the following prerequisites:
* **Base OS:** A Debian-based Linux distribution (Tested on Ubuntu 24.04).
* **Target Package:** The `apache2` package must be installed for Scripts 2 and 3 to evaluate its footprint.
* **Core Utilities:** Standard GNU tools (`awk`, `grep`, `du`, `systemctl`) must be present.

---

## 🚀 Execution Instructions

Follow these steps to deploy and run the scripts on your local Linux terminal.

**1. Clone the repository:**
    git clone https://github.com/amanpanday-18/oss-audit-24BEY10038.git
    cd oss-audit-24BEY10038

**2. Make the scripts executable:**
    chmod +x *.sh

**3. Run the scripts individually:**
    ./script1.sh
    ./script2.sh
    sudo ./script3.sh
    sudo ./script4.sh /var/log/apache2/error.log
    ./script5.sh

---
