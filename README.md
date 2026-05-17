Overview

This project demonstrates how to automate a Netcat listener using Bash scripting and Linux scheduling tools (cron and at).

Instead of manually starting a listener every time, the system allows the user to:

* Enter a port number
* Set a delay time
* Automatically schedule and run the listener

This project combines Linux scripting, task automation, and networking concepts into one practical application.

⸻

Features

* User input for port number and delay
* Port validation (1–65535)
* Automated Netcat listener
* Scheduling using:
    * at (delayed execution)
    * cron (recurring execution)
* Logging support

⸻

Requirements

Make sure you have the following installed:

* Linux system (recommended: Kali Linux)
* Bash shell
* Netcat
* cron service
* at command

⸻

Installation

1. Clone the repository:

git clone https://github.com/gee220/Netcat-Scheduled-Listener.git
cd Netcat-Scheduled-Listener

2. Make scripts executable:

chmod +x project.sh
chmod +x listener.sh

3. Install required tools (if not installed):

sudo apt update
sudo apt install netcat at cron

4. Start required services:

sudo service cron start
sudo service atd start

⸻

Configuration

1. Update Script Paths

Make sure the path inside project.sh matches your system:

echo "/home/kali/listener.sh $port" | at now + $delay minutes

Replace /home/kali/ with your actual directory if needed.

⸻

2. (Optional) Configure Cron Job

To run the listener automatically at a specific time:

crontab -e

Example:

0 10 * * 0 /home/kali/project.sh 4444 >> /tmp/nc_sunday_listener.log 2>&1

This means:

* Runs every Sunday
* At 10:00 AM
* On port 4444
* Saves output to a log file

⸻

How to Run

Run the main script:

./project.sh

You will be prompted to enter:

* Port number
* Delay (in minutes)

⸻

Usage Example

Example Input:

Enter port number: 4444
Enter delay in minutes: 1

What Happens:

* Script validates the port
* Schedules the listener
* After 1 minute, Netcat starts automatically

Listener Output:

Starting Netcat listener on port 4444...
listening on [any] 4444 ...

Project Testing & Debugging
1. Code Debugging
The script syntax was fully checked and tested to ensure it is free of errors.
• Result: 0 syntax errors. The code structure is clean and ready for execution.
2. System Testing & Execution
The execution testing was successfully verified inside the Linux (Kali) environment:
• The script handles user input and port validation seamlessly.
• Immediate scheduling was verified successfully using the at command.
• Long-term periodic scheduling via crontab was successfully installed and active in the system.

Project Structure

├── project.sh      # Main script (user input + scheduling)
├── listener.sh     # Netcat listener script
├── README.md       # Project documentation

⸻

How It Works

1. User runs project.sh
2. Script asks for:
    * Port
    * Delay
3. Input is validated
4. at schedules execution
5. listener.sh runs Netcat:

nc -lvnp <PORT>

⸻

Results

* Listener successfully starts at scheduled time
* Input validation prevents errors
* Scheduling works using both at and cron
* Logs are generated correctly

⸻

Conclusion

This project demonstrates how Bash scripting can automate networking tasks using Netcat. It highlights the integration of:

* Linux scripting
* Task scheduling
* Network communication tools

It provides a strong foundation for understanding automation in cybersecurity and system administration.

<img width="1174" height="836" alt="Screenshot 2026-05-16 at 6 48 26 pm" src="https://github.com/user-attachments/assets/ea3139a8-935e-48b4-90f3-a80428c34aac" />



<img width="968" height="489" alt="Screenshot 2026-05-16 at 6 50 06 pm" src="https://github.com/user-attachments/assets/8484dea3-269c-4e3b-bfed-7018d5aef200" />



<img width="681" height="445" alt="f71ae87a-f676-41bf-9fe8-ee14d0562f68" src="https://github.com/user-attachments/assets/1e8b52fb-b6ef-4aa7-9b1b-b211a24393ac" />

<img width="898" height="199" alt="e146d445-0d09-495d-8ed1-0c236c3a3533" src="https://github.com/user-attachments/assets/9681c6e7-f1a9-4b48-bccf-440c5bea5afb" />

<img width="796" height="814" alt="4d131485-bd86-4b7c-83a0-49cdc0ff1e4a" src="https://github.com/user-attachments/assets/4a0b90f7-d1e8-40ca-b09e-08313288a2f8" />


