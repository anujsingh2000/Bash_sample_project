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


### 2. ✅ Log Analyzer
A script to analyze and extract useful information from server logs.

**Features:**
- Count occurrences of error/warning messages

Run Example:

./log_analyzer.sh /var/log/syslog


### 3. ✅🌐 Health Check script
A script that checks the health of multiple URLs.

**Features:**
- Reads list of URLs
- Uses curl to check HTTP status codes  
- Prints status (working if 200, otherwise logs failed URLs)  

Run Example:

./health_script