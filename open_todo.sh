#!/bin/bash
# Path to the log file
log_file="/tmp/daily_command.log"

# Get the current date
current_date=$(date +%Y-%m-%d)

# Get the current hour in 24-hour format
current_hour=$(date +%H)

# Check if the current hour is between 20:00 and 6:00
if [ "$current_hour" -ge 20 ] || [ "$current_hour" -lt 6 ]; then
    echo "Script execution is skipped between 20:00 and 6:00"
else
    # Check if the log file exists and contains today's date
    if [ -f "$log_file" ]; then
        last_run_date=$(cat "$log_file")
    else
        last_run_date=""
    fi
    # If the command has not been run today, run it and update the log file
    if [ "$last_run_date" != "$current_date" ]; then
        #firefox "/home/xz/Videos/All About Style (AAS).html"
        Wsummary -w
        echo "$current_date" > "$log_file"
    fi
    chromium https://app.todoist.com/app/today
    chromium https://calendar.google.com/calendar/u/0/r/day
fi

# sudo loginctl enable-linger <your_username>
# systemctl --user enable open_webpage.timer
# systemctl --user start open_webpage.timer
# sudo loginctl show-user <your_username> --property=Linger
# systemctl --user status open_webpage.timer

