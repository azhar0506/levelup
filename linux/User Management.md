# Linux User Management
_Date:_ 2025-11-10  
_Topic:_ Creating and Managing Users in Linux

---

## Commands Used

### 1. Create a User

**What:** Add a new user to the system  
**Why:** To create a separate account with distinct permissions  
**How:**
```zsh
sudo useradd <username>
```

### 2. Verify User Exists

**What:** Check if the user entry is recorded
**Why:** To confirm the user was successfully created
**How:**
```zsh
grep <username> /etc/passwd
id <username>
```

### 3. Create Home Directory
**What:** Created a user with a home directory
**Why:** Users typically need their own directory to store files and configuration
**How:** 
```zsh
sudo useradd -m <username>
```

### 4. Delete a User
**What:** Removed a user from the system
**Why:** To revoke access or remove unused accounts
**How:** 
```zsh
sudo userdel <username>
```


### 5. Set a Password
**What:** Added the user's password
**Why:** Required so the user can authenticate
**How:** 
```zsh
sudo passwd <username>
```

### 6. Add User to a Group
**What:** Added the user to a supplementary group.
**Why:** Groups manage permissions and resource access.
**How:** 
```zsh
sudo usermod -aG <groupname> <username>
```

### 7.1. Lock a User Account
**What:** Locked the account to prevent login
**Why:** Used when you want to disable access without deleting the user
**How:** 
```zsh
sudo usermod -L <username>
```

### 7.2. Verify

**How:** 
```zsh
grep "^<username>:" /etc/shadow
```
