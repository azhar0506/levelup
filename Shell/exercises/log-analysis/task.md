# Log Analysis

## What this log covers (and why it’s realistic)
- SSH login attempts (successful and failed), both via password and public-key — common in server access logs.  ￼
- System cron jobs running (daily tasks, backups, cleanups) — a typical part of a server’s routine logs.
- Kernel messages for filesystem mounting — reflects real OS events.  ￼
- Application logs (in this case from a web server like Apache) with errors, warnings, info and missing-file incidents — very common in production.  ￼

This gives a mix of system, security, application, and operations logs — which is what a DevOps or sysadmin often deals with.

##  Suggested Shell-Scripting Tasks / Exercises with This Log

- Here are some ideas for what you could do with this sample log file, matching your current learning stage:
- Count how many successful SSH logins versus failed attempts.
- List all unique IPs that attempted SSH access (successful or failed), and how many attempts per IP.
- Extract and count how many cron jobs ran, and list their commands.
- Find all lines with errors or warnings (e.g. from Apache), and summarise them (which files missing, from which IPs, etc.).
- Generate a summary report: e.g. “On Dec 05: X logins, Y failed logins, Z cron jobs, N web errors/warnings.”
- Sort log entries by hour and count events per hour — good exercise for awk / cut / sort / uniq.