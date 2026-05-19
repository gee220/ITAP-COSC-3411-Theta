#!/bin/bash

echo "==================================="
echo " Scheduled Listener using Netcat "
echo "==================================="
echo ""
echo "Welcome!"
echo "This tool allows you to schedule a Netcat listener"
echo "on a specific port after a selected delay."
echo ""


while true
do
    echo ""
    echo "1. Schedule a Listener"
    echo "2. Exit"
    read -p "Choose an option: " choice

    # Exit option
    if [ $choice -eq 2 ]
    then
        echo "Exiting program..."
        break
    fi

    # Schedule listener option
    if [ $choice -eq 1 ]
    then

        # Keep asking until port is valid
        while true
        do
            read -p "Enter port number (1-65535): " port

            if [ $port -ge 1 ] && [ $port -le 65535 ]
            then
                echo "Valid port number."
                break
            else
                echo "Invalid port number. Try again."
            fi
        done

        # Delay validation
        while true
        do
            read -p "Enter delay in minutes: " delay

            if [ $delay -ge 0 ]
            then
                break
            else
                echo "Invalid delay. Try again."
            fi
        done

        echo ""
        echo "Port selected: $port"
        echo "Delay selected: $delay minute(s)"
        echo "Scheduling listener..."

        # Schedule listen.sh
        ./listen.sh $port

        echo "Listener scheduled successfully!"
    else
        echo "Invalid choice. Please choose 1 or 2."
    fi
done
