# 🐚 Bash Automation Projects

This repository contains my hands-on **Bash scripting projects** created as part of my DevOps and automation learning journey.  
Each project focuses on solving a real-world problem and using concepts using **Linux commands, shell scripting best practices, and automation techniques**

## 📌 Projects Included

### 1. ✅ To-Do Task Manager (`todo.sh`)
A command-line task manager to add, list, and mark tasks as done.  

**Features:**
- Add new tasks with a single command  
- List all tasks with automatic numbering (`nl`)  
- Safely remove completed tasks using `awk` + `mktemp`  
- Error handling for invalid inputs  

Run Example:

./todo.sh add "Learn Linux fundamentals"
./todo.sh list
./todo.sh done 1

2. 📊 Log Analyzer (log_analyzer.sh)

A script to analyze and extract useful information from server logs.

Features:

Count occurrences of error/warning messages

Extract unique IPs accessing the server

Show top N most frequent requests

Run Example:

./log_analyzer.sh /var/log/syslog

3. 🌐 Health Check Script (health_script)

A script that checks the health of multiple URLs.

Features:

Reads list of URLs

Uses curl to check HTTP status codes

Prints status (working if 200, otherwise logs failed URLs)

Run Example:

./health_script

4. 🌍 Environment Health Check (health_check_script)

Checks URLs for different environments (e.g., Dev, UAT, Prod).

Features:

Accepts environment as input (e.g., UAT)

Opens all environment-specific URLs to verify availability

Helps in QA/DevOps validation tasks

Run Example:

./health_check_script UAT

5. 📂 Script Generator (create_script.sh)

A helper script that automates creating new Bash scripts with proper headers and permissions.

Features:

Creates a new .sh file with executable permissions

Adds shebang (#!/bin/bash) and template structure automatically

Run Example:

./create_script.sh my_new_script.sh

