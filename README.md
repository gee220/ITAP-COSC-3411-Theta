# Netcat Scheduled Listener
## Overview
This project demonstrates how to automate a Netcat listener using Bash scripting and Linux scheduling tools (cron and at).

Instead of manually starting a listener every time, the system allows the user to:

Enter a port number

Set a delay time

Automatically schedule and run the listener

This project combines Linux scripting, task automation, and networking concepts into one practical application.

## Features
Dynamic user input for custom port selection and execution delay.

Robust port validation supporting standard networking ranges (1–65535).

Automated Netcat listener instantiation.

Dual-mode scheduling management via:

at command (for immediate, delayed one-time execution).

cron service (for recurring automated execution).

Centralized logging support for persistence and debugging.

## Requirements
Ensure the following utilities are installed and configured on your system:

Linux operating system (Recommended: Kali Linux inside VMware environment)

Bash shell

Netcat (nc)

cron daemon service

at automation utility

## Installation & Setup
### 1. Clone the Repository

Bash
git clone https://github.com/gee220/Netcat-Scheduled-Listener.git
cd Netcat-Scheduled-Listener
### 2. Make Scripts Executable

Bash
chmod +x project.sh
chmod +x listener.sh
### 3. Install Required Tools (If missing)

Bash
sudo apt update
sudo apt install netcat at cron -y
### 4. Start Required Automation Services

Bash
sudo service cron start
sudo service atd start
## Configuration
### 1. Update Script Paths

Ensure that the execution path inside project.sh accurately matches your local system configuration:

Bash
echo "/home/kali/listener.sh $port" | at now + $delay minutes
### 2. Configure Cron Jobs (Optional Recurring Mode)

To configure the listener to trigger automatically at specific intervals, access the crontab configuration interface:

Bash
crontab -e
#### Example Entry:

<img width="898" height="199" alt="PHOTO-2026-05-17-23-44-02" src="https://github.com/user-attachments/assets/b0bcf1fa-b839-43cf-a826-ee11e9e4c2cf" />

0 10 * * 0 /home/kali/project.sh 4444 >> /tmp/nc_sunday_listener.log 2>&1
Execution Breakdown:

0 10: Triggers exactly at 10:00 AM.

* * 0: Runs every Sunday regardless of the day or month.

/home/kali/project.sh 4444: Executes the script pointing to port 4444.



## How to Run & Usage Example
### 1. Running the Main Script

Execute the master orchestration script from your terminal:

Bash
./project.sh
### 2. Interactive Execution Steps

The script initializes and prompts the user: Enter port number: 

Enter a valid port (e.g., 4444).

The script prompts for timing: Enter delay in minutes: 

Enter the desired wait time (e.g., 1).

### 3. Behind-the-Scenes Automation Process

The script validates the structural integrity of the input port.

It offloads the delayed execution request to the at daemon pipeline.

After 1 minute, listener.sh is triggered automatically, spinning up the Netcat background process.

#### Expected Listener Output:

Plaintext
Starting Netcat listener on port 4444...
listening on [any] 4444 ...
## Project Structure
Plaintext
├── project.sh      # Main orchestration script (Handles user input, validation & scheduling)
├── listener.sh     # Core execution script (Initializes Netcat instance)
└── README.md       # Comprehensive project documentation
### Process Workflow Diagram

User runs project.sh → Prompted for Port & Delay.

Input Validation Check → Verifies range is within 1≤Port≤65535.

Task Offloading → at command hooks task scheduling.

Listener Trigger → listener.sh instantiates Netcat background environment:

Bash
nc -lvnp <PORT>
## Project Testing & Debugging
### 1. Static Code Analysis & Debugging

The full code structure was thoroughly checked and verified using static analysis practices to guarantee seamless runtime execution:

Result: 0 syntax errors. The control loops, conditionals, and shell parameters are clean, secure, and fully optimized.

### 2. Environment Verification

All operational states were successfully tested inside the target Linux environment (Kali Linux/VMware):

Input Scenarios: Verified that the verification subroutines catch negative numbers, letters, and out-of-bounds ports cleanly.

Volatile Scheduling (at): Verified that the atd daemon accurately holds and executes commands on time.

Persistent Scheduling (cron): Active crontab profiles successfully output and maintain operational tracking logs in /tmp/.

## Conclusion
This project successfully demonstrates how native Bash scripts can eliminate manual networking workflows through scheduling integrations. By pairing functional tools like Netcat with foundational Linux system daemons (atd and crond), we built a highly automated, error-resistant utility ideal for system administrators and network security environments.




<img width="681" height="445" alt="f71ae87a-f676-41bf-9fe8-ee14d0562f68" src="https://github.com/user-attachments/assets/1e8b52fb-b6ef-4aa7-9b1b-b211a24393ac" />

<img width="1113" height="650" alt="IMG_0889" src="https://github.com/user-attachments/assets/78712d4a-2f01-4f44-9ca9-1321aa70a56b" />

<img width="796" height="814" alt="4d131485-bd86-4b7c-83a0-49cdc0ff1e4a" src="https://github.com/user-attachments/assets/4a0b90f7-d1e8-40ca-b09e-08313288a2f8" />


