#!/bin/bash
                                                                  
echo "Scheduled Listener using Netcat"

read -p "Enter port number: " port

#port validation
if [ $port -ge 1 ] && [ $port -le 65535 ]
then
    echo "Valid port number"

    read -p "Enter delay in minutes: " delay

    echo "Port selected: $port"
    echo "Delay selected: $delay minute(s)" 

    echo "Scheduling listener..."

    echo "nc -lvnp $port" | tee -a listener_log.txt" | at now + $delay minutes

    echo "Done! Listener scheduled."
    echo ""
echo "=================================="
echo " Netcat Listener Configuration"
echo "=================================="
echo "Port Number : $port"
echo "Log File    : listener_log.txt"
echo "Listener    : Scheduled Successfully"
echo "=================================="

# FUNCTIONALITY DETAILS:
# -l: tells netcat to listen for a connection
# -v: enables verbose mode so we can see when a connection is made
# -n: prevents DNS lookups to keep the script fast and stable
# -p: specifies the exact port number we are opening

# Creates log file automatically
touch listener_log.txt
else
    echo "Invalid port number"
fi


# Part 3: Crontab Command for Sunday 10:00 AM
# 0 10 * * 0 /home/kali/project.sh 4444 >> /tmp/nc_sunday_listener.log 2>&1
