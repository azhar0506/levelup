# Process & Job Control

## What is it?

Every command you run creates a process.

Job control is how you:
- run tasks in the background
- bring them to the foreground
- pause them
- resume them
- inspect running processes
- kill them

This is essential for real DevOps work, especially when dealing with:
- long-running scripts
- daemons
- monitoring tools
- servers
- background automation


## Why its needed

- Manage long-running tasks without blocking your terminal
- Debug systems using `ps`, `pgrep`, and `kill`
- Start scripts that keep running after you log out 
- Monitor process during deployment
- Handle jobs that hang or consume too much CPU

## Process & Job Control Commands

| Command        | Meaning                               |
|----------------|----------------------------------------|
| &              | Run command in the background          |
| jobs           | List background jobs                   |
| fg             | Bring job to foreground                |
| bg             | Resume paused job in background        |
| Ctrl+Z         | Pause a running foreground job         |
| ps aux         | Show all running processes             |
| pgrep <name>   | Find PIDs by name                      |
| kill <pid>     | Terminate a process                    |
| nohup cmd &    | Run command even after logout          |



## Example 1 - Run a command in the background 

**Question:**
Start a long command without blocking the terminal.

**Answer:**

```sh
sleep 100 &
```

**Explanation:**

& puts the process in the background and gives you a job number + PID.


## Example 2 — List background jobs

**Question:**
Show all background jobs.

**Answer:**

```sh
jobs
```

**Explanation:**

Displays job numbers, statuses, and commands.


## Example 3 — Bring a job to the foreground

**Question:**
Resume the most recent background job in the foreground.

**Answer:**

```sh
fg
```

**Explanation:**

Brings the selected job back to active terminal control.


## Example 4 — Pause a running job

**Question:**
Pause the current foreground process.

**Answer:**

```sh
Ctrl + Z
```

**Explanation:**

Sends a SIGSTOP signal (pause process), suspending the job

## Example 5 — Resume job in background

**Question:**
After pausing with Ctrl+Z, send it to the background.

**Answer:**

```sh
bg
```

**Explanation:**

Resumes execution without blocking your terminal.

## Example 6 — Inspect running processes

**Question:**
Show the current processes on the system.

**Answer:**

```sh
ps aux | head
```

**Explanation:**

Lists PID, CPU, memory, commands, etc.



## Example 7 — Find a process by name

**Question:**
Get PIDs of all sleep processes.

**Answer:**

```sh
pgrep sleep
```

**Explanation:**

Searches for processes by name and prints their PIDs.


## Example 8 — Kill a process

**Question:**
Kill a process using its PID.

**Answer:**

```sh
kill <pid>
```

**Explanation:**

Sends SIGTERM (Signal 15 - Stops process gracefully).




## Example 9 — Keep a script running after logout

**Question:**
Run a script in the background even after closing the terminal.

**Answer:**

```sh
nohup ./myscript.sh &
```

**Explanation:**

- nohup prevents termination when the shell session ends.
- Output goes to nohup.out unless redirected.