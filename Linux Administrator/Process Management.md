# Linux Process Management 
_Date:_ 2025-11-10  
_Topic:_ Viewing and Managing Processes

---

## Commands Used

### 1. List Running Processes
**What:** Display running processes  
**Why:** To see what is currently executing on the system  
**How:**
```bash
ps aux
```

### 2. Monitor System Resources (Real-Time)
**What:** View live CPU, memory, and process activity
**Why:** Useful for diagnosing performance or resource issues
**How:**
```bash
top
```

### 3. Identify a Specific Process
**What:** Search for processes by name
**Why:** Quick way to find PIDs without scanning the whole process list
**How:**
```bash
pgrep -f sshd
```

### 4. Terminate a Process Cleanly
**What:**  Kill processes by name rather than PID
**Why:** Faster and avoids needing to manually look up PIDs
**How:**
```bash
pkill <process-name>
```


### 5. Run Jobs in the Background (Even After Logout)
**What:** Run commands that continue after the session ends
**Why:** Useful for long-running tasks (backups, scripts, servers)
**How:**
```bash
nohup python3 script.py &
```


