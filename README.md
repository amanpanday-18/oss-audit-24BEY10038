# OSS Audit — Mozilla Firefox
**Student Name:** Aman Panday  
**Registration Number:** 24BEY10038  
**Course:** Open Source Software (OSS NGMC)  
**Chosen Software:** Mozilla Firefox  
**Repository:** `oss-audit-24BEY10038`

---

## About This Project

This repository is part of the **Open Source Audit Capstone Project** for the OSS NGMC course. The project involves a structured audit of Mozilla Firefox — one of the world's most widely used open-source web browsers — covering its origin, license, ethics, Linux footprint, and FOSS ecosystem.

This repository contains **5 shell scripts** that demonstrate practical Linux skills connected to the philosophy of open-source software.

---

## Chosen Software: Mozilla Firefox

| Field | Details |
|---|---|
| **Name** | Mozilla Firefox |
| **Category** | Web Browser |
| **License** | Mozilla Public License 2.0 (MPL 2.0) |
| **Developer** | Mozilla Foundation (nonprofit) |
| **First Release** | November 9, 2004 |
| **Source Code** | https://hg.mozilla.org/mozilla-central |
| **Website** | https://www.mozilla.org/en-US/firefox |

---

## Shell Scripts

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`  
**Description:** Displays a system welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, uptime, date/time, and a message about the GPL v2 license covering the OS.  
**Concepts used:** Variables, `echo`, command substitution (`$()`), output formatting.

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`  
**Description:** Checks whether Firefox and 3 other FOSS packages (git, python3, vlc) are installed, displays version and summary info, and uses a `case` statement to print a philosophy note about each package.  
**Concepts used:** `if-then-else`, `case` statement, `dpkg -l`, `apt-cache show`, `for` loop, pipes with `grep`.

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_permission_auditor.sh`  
**Description:** Loops through key system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/var/cache`) and reports permissions, owner, group, and disk usage. Also audits Firefox's config directory.  
**Concepts used:** `for` loop, `ls -ld`, `awk`, `du -sh`, `which`, conditional checks.

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`  
**Description:** Reads a log file line by line, counts lines matching a keyword (default: `error`), shows the last 5 matching lines, and reports match statistics. Includes retry logic if the file is not found.  
**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`), `grep`, `tail`, `wc`.

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`  
**Description:** Interactively asks the user 3 questions and generates a personalised open-source philosophy statement, saving it to a `.txt` file named after the current user.  
**Concepts used:** `read` for user input, string concatenation, `>` and `>>` for file writing, `date`, `cat`, `alias` concept demonstration.

---

## How to Run the Scripts on Linux

### Prerequisites

These scripts run on any Linux system (Ubuntu/Debian recommended). If you don't have Linux:
- **Windows users:** Install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) and choose Ubuntu
- **Browser-based:** Use [JSLinux](https://jslinux.org/) or [Replit](https://replit.com) (choose a Bash repl)

### Step-by-Step Instructions

**1. Clone this repository**
```bash
git clone https://github.com/amanpanday-18/oss-audit-24BEY10038.git
cd oss-audit-24BEY10038
```

**2. Make all scripts executable**
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

**3. Run the scripts**

```bash
# Script 1 — System Identity Report
./script1_system_identity.sh

# Script 2 — FOSS Package Inspector
./script2_package_inspector.sh

# Script 3 — Disk and Permission Auditor
./script3_disk_permission_auditor.sh

# Script 4 — Log File Analyzer (provide a log file path)
./script4_log_analyzer.sh /var/log/syslog error

# Script 5 — Manifesto Generator (interactive)
./script5_manifesto_generator.sh
```

### Dependencies

| Script | Dependencies | Install Command |
|---|---|---|
| Script 1 | `lsb_release` (usually pre-installed) | `sudo apt install lsb-release` |
| Script 2 | `dpkg`, `apt-cache` (pre-installed on Ubuntu) | Pre-installed |
| Script 3 | `ls`, `du`, `awk` (GNU coreutils) | Pre-installed |
| Script 4 | `grep`, `tail`, `wc` (GNU coreutils) | Pre-installed |
| Script 5 | `date`, `cat` (GNU coreutils) | Pre-installed |

All scripts are tested on **Ubuntu 22.04 LTS**.

---

## Project Report

The full 12–16 page project report is submitted separately via the VITyarthi portal as a PDF. It covers:
- **Part A:** Origin story, license analysis, and ethical reflection (Firefox & MPL 2.0)
- **Part B:** Firefox's Linux footprint — directories, users, service management
- **Part C:** The FOSS ecosystem around Firefox
- **Part D:** Open source vs proprietary comparison (Firefox vs Chrome/Edge)

---

## References

- Mozilla Firefox Source Code: https://hg.mozilla.org/mozilla-central
- MPL 2.0 License Text: https://www.mozilla.org/en-US/MPL/2.0/
- GNU Free Software Definition: https://gnu.org/philosophy/free-sw.html
- Open Source Initiative: https://opensource.org/osd
- The Linux Command Line (free book): https://linuxcommand.org
