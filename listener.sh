#!/bin/bash

PORT=$1

echo "Starting Netcat listener on port $PORT..."

# Netcat listener
nc -lvnp $PORT

echo "Listener closed."
