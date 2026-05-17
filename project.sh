#!/bin/bash

# --- Part 1:(User Input & Scheduling) ---
echo "Scheduled Listener using Netcat"

read -p "Enter port number: " port

# Port validation
if [ $port -ge 1 ] && [ $port -le 65535 ]
then
    echo "Valid port number"

    read -p "Enter delay in minutes: " delay

    echo "Port selected: $port"
    echo "Delay selected: $delay minute(s)"

    echo "Scheduling listener..."

    # Call this same script with the port as an argument after the delay
    echo "/home/kali/listener.sh $port" | at now + $delay minutes

    echo "Done! Listener scheduled."

else
    echo "Invalid port number"
fi


# Part 3: Crontab Command for Sunday 10:00 AM
# 0 10 * * 0 /home/kali/project.sh 4444 >> /tmp/nc_sunday_listener.log 2>&1
