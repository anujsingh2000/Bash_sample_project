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
```bash
./todo.sh add "Learn Linux fundamentals"
./todo.sh list
./todo.sh done 1

