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
    echo "/home/kali/project.sh $port" | at now + $delay minutes

    echo "Done! Listener scheduled."

else
    echo "Invalid port number"
fi


# --- Part 3: (Netcat Listener Execution) ---
PORT=$1

# Check if the script was triggered with a port argument
if [ -n "$PORT" ]; then
    echo "[$(date)] Initializing Netcat listener on port $PORT..."
    
    # Executing the Netcat listener
    nc -lvnp $PORT

    # Checking if Netcat closed successfully or failed
    if [ $? -eq 0 ]; then
        echo "[$(date)] Listener closed successfully."
    else
        echo "[$(date)] Error: Failed to start Netcat on port $PORT."
        exit 1
    fi
fi
