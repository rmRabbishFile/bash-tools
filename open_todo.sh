#!/bin/bash
# Get the current hour in 24-hour format
current_hour=$(date +%H)

# Check if the current hour is between 20:00 and 6:00
if [ "$current_hour" -ge 20 ] || [ "$current_hour" -lt 6 ]; then
    echo "Script execution is skipped between 20:00 and 6:00"
else
    firefox https://app.todoist.com/app/
    firefox https://calendar.google.com/calendar/u/0/r/day
fi

# sudo loginctl enable-linger <your_username>
# systemctl --user enable open_webpage.timer
# systemctl --user start open_webpage.timer
# sudo loginctl show-user <your_username> --property=Linger
# systemctl --user status open_webpage.timer

