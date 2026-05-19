<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  
</head>
<body>

<h1>Scheduled Listener using Netcat</h1>

<h2>Project Overview</h2>
<p>
This project is a System Programming assignment that implements a Scheduled Network Listener using Bash scripting and Netcat.
The system allows a user to select a port number and delay time, then automatically starts a listener after the specified delay.
</p>

<h2>How It Works</h2>
<p>The project consists of two scripts:</p>
<ul>
    <li><b>project.sh</b> - Main script that handles user input and scheduling</li>
    <li><b>listen.sh</b> - Script that starts the Netcat listener</li>
</ul>

<p>The main script uses the Linux <b>at</b> command to schedule execution of the listener script.</p>

<h2>Tools Used</h2>
<ul>
    <li>Bash Scripting</li>
    <li>Netcat (nc)</li>
    <li>Linux (Ubuntu / Kali)</li>
    <li>at command (task scheduling)</li>
</ul>

<h2>Project Structure</h2>
<pre>
project.sh     Main script (user input + scheduling)
listen.sh      Netcat listener script
</pre>

<h2>Installation</h2>

<h3>Install Netcat</h3>
<pre>
sudo apt update
sudo apt install netcat
</pre>

<h3>Install at command</h3>
<pre>
sudo apt install at
sudo systemctl enable atd
sudo systemctl start atd
</pre>

<h3>Give execution permissions</h3>
<pre>
chmod +x project.sh
chmod +x listen.sh
</pre>

<h2>How to Run</h2>

<h3>Step 1: Run the main script</h3>
<pre>
./project.sh
</pre>

<h3>Step 2: Enter inputs</h3>
<p>
Enter port number (example: 4444)<br>
Enter delay in minutes (example: 1)
</p>

<h3>Step 3: Listener starts automatically after delay</h3>

<h2>Testing Connection</h2>
<p>Open another terminal and connect using:</p>

<pre>
nc localhost 4444
</pre>

<p>This allows communication between client and listener.</p>

<h2>Features</h2>
<ul>
    <li>User input handling</li>
    <li>Port validation</li>
    <li>Automated scheduling</li>
    <li>Modular script design</li>
    <li>Real-time network communication</li>
</ul>

<h2>Learning Outcomes</h2>
<ul>
    <li>Bash scripting fundamentals</li>
    <li>Linux process scheduling</li>
    <li>Networking basics using Netcat</li>
    <li>Client-server communication model</li>
</ul>

<h2>Team</h2>
<p>Theta Team - COSC-3411 System Programming</p>

</body>
</html>
