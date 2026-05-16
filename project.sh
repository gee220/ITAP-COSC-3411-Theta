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

    echo "nc -lvnp $port" | at now + $delay minutes

    echo "Done! Listener scheduled."
else
    echo "Invalid port number"
fi

# Part 2:
PORT=$1

# Ensure a port was passed as an argument
if [ -z "$PORT" ]; then
    echo "Error: No port provided to the listener script."
    exit 1
fi

echo "[$(date)] Initializing Netcat listener on port $PORT..."

# FUNCTIONALITY DETAILS:
# -l: tells netcat to listen for a connection
# -v: enables verbose mode so we can see when a connection is made
# -n: prevents DNS lookups to keep the script fast and stable
# -p: specifies the exact port number we are opening
# -k:  keeps the listener open after a connection closes ( optional)

nc -lvnp $PORT

# Check if Netcat started successfully
if [ $? -eq 0 ]; then
    echo "[$(date)] Listener closed successfully."
else
    echo "[$(date)] Error: Failed to start Netcat on port $PORT."
    exit 1
fi

# Part 3: Crontab Command for Sunday 10:00 AM
# 0 10 * * 0 /home/kali/project.sh 4444 >> /tmp/nc_sunday_listener.log 2>&1
