#!/bin/bash

##Script directory and task file should be in same directory

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
task_file="${script_dir}/task.txt"

usage() {
  cat <<EOF
Usage:
  $0 add "task text"   # add a new task
  $0 list              # list tasks with numbers
  $0 done <number>     # mark task <number> as done (removes it)
EOF
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

cmd="$1"
shift || true

#case statement
case "$cmd" in
    add)
        if [[ $# -lt 1 ]]; then
        echo "Provide task text to add."
        usage
        exit 1
        fi
    task="$*"
    ## Check if file exists
    mkdir -p "$script_dir"
    printf '%s\n' "$task" >> "$task_file"
    echo "Task added: $task"
    ;;

    list)
        if [[ ! -s "$task_file" ]]; then
            echo "No tasks present"
            exit 0
        fi
        ##Show numbered list in output
        nl -w1 -s '.' -ba "$task_file"  # Command to print numbered lines with index, (nl=numbered line, -w=width)
        ;;

    done)
        if [[ $# -ne 1 ]]; then
            echo "Usage: $0 done <number>"
            exit 1
        fi
        num="$1"
        if ! [[ "$num" =~ ^[0-9]+$ ]] || [[ "$num" -le 0 ]]; then   #Check if given task number is valid or not(must be positive)
        echo "Invalid task number $num "
        exit 1
        fi
        if [[ ! -s "$task_file" ]]; then
            echo "No tasks to mark done."
            exit 1
        fi

        #Count line in task file
        total=$(wc -l < "$task_file")
        if [[ "$num" -gt "$total" ]]; then
            echo "Task number $num out of range (1.. $total). "
            exit 1
        fi

        #takes the $num-th line from the tasks file and saves its full text into task_test variable 
        task_test=$(sed -n "${num}p" "$task_file")

        #remove line safely using temp file
        tmp=$(mktemp) || { echo "Could not create temp file"; exit 1; }

        awk -v n="$num" 'NR!=n { print }' "$task_file" > "$tmp"     ##all tasks except the one we’re removing.
        mv "$tmp" "$task_file"

        echo "Task '$task_test' marked as done."
        ;;

  *)
    usage
    exit 1
    ;;
esac
