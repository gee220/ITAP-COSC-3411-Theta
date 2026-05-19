#!/bin/bash

PORT=$1

echo "==================================="
echo " Netcat Listener Started "
echo "==================================="

echo "Date: $(date)"
echo "Listening on port: $PORT"
echo "Waiting for incoming connection..."
echo ""

# Start Netcat listener
nc -lvnp $PORT

echo ""
echo "Listener stopped."
echo "Closing program..."
