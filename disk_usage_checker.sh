#!/bin/bash

Threshold=80



disk_usage() {
    df -hP | tail -n +2 | while read -r line; do
        # Extract mount point (last column)
        mount_part=$(echo "$line" | awk '{print $NF}')
        # Extract usage (second last column)
        usage=$(echo "$line" | awk '{print $(NF-1)}' | tr -d '%')
        # Extract filesystem name (everything except last 5 columns: Used, Avail, Use%, Mounted)
        fs=$(echo "$line" | awk '{$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print $0}' | sed 's/^[ \t]*//;s/[ \t]*$//')

        if [ "$usage" -gt "$Threshold" ]; then
            message="WARNING: Filesystem '$fs' mounted on '$mount_part' is at $usage% usage."
            echo "$message"
            # Windows popup alert using PowerShell
            powershell.exe -Command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show([string]'${message//\'/ }','Disk Usage Alert')"
        else
            echo "OK: Filesystem '$fs' mounted on '$mount_part' is at $usage% usage."
        fi
    done
}

disk_usage