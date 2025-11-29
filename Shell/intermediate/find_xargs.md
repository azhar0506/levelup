# find + xargs - File Search & Bulk Operations

## What is find?
`find` is a powerful command-line tool used to search for files and directories based on conditions like:
- filename
- file type
- size
- age (modification time)
- depth

You can also perform **actions** on files you find, such as printing, deleting, or passing them into other commands.

## What is find?

- Automatically clean up old log files
- Search deeply nested directories
- Bulk delete / compress / move files
- Find oversized files eating disk space

## Useful find Conditions

| Flag         | Meaning                                  | Example                          |
|--------------|------------------------------------------|----------------------------------|
| -type f      | match only **files**                     | find . -type f                   |
| -type d      | match only **directories**               | find . -type d                   |
| -name "*.log"| match filename patterns                  | find . -name "*.log"             |
| -maxdepth N  | restrict search depth                    | find . -maxdepth 1 -type f       |
| -mtime +7    | modified **more than 7 days** ago        | find /var/log -mtime +7          |
| -mtime -1    | modified **in the last 24 hours**        | find . -mtime -1                 |
| -size +10M   | size larger than 10 MB                   | find . -size +10M                |
| -size -500k  | size smaller than 500 KB                 | find . -size -500k               |


## Useful find Actions

| Flag           | Meaning                                  | Example                             |
|----------------|------------------------------------------|-------------------------------------|
| -print         | print matched files (default)            | find . -type f -print               |
| -delete        | delete matched files                     | find . -name "*.tmp" -delete        |
| -exec CMD {} ()| run a command on each file               | find . -name "*.log" -exec rm {} \; |



## What is xargs?

`xargs` takes input (usually from `find`) and runs a command on each item.

### Example:
```
find . -name "*.log" | xargs gzip
```

Meaning:
- find all `.log` files
- pass them to gzip
- compress all logs

`xargs` is extremely useful for bulk operations


## Example 1 - Find all .log files


**Question:**
List all `.log` files under the current directory.

**Answer:**

```bash
find . - type f -name "*.log"
```

**Explanation:**
- `- type f` = files
- `-name` "*.log" = files ending in `.log`



## Example 2 - Find files larger than 1 MB

**Question:**
List all files > 1 MB

**Answer:**

```bash
find . -type f -size +1M
```

**Explanation:**
- `1M` means "greater than 1 megabyte"


## Example 3 - Delete all .tmp files

**Question:**
Delete all files ending in `.tmp` under the current directory and all subdirectories

**Answer:**

```bash
find . -type f -name "*.tmp" -delete
```

**Explanation:**
- `-type f` = only files
- `-name` "*.tmp" = match filenames ending with `.tmp`
- `-delete` = remove them


## Example 4 - Find files older than 7 days

**Question:**
Find all files in /var/log that were modified more than 7 days ago.

**Answer:**

```bash
find /var/log -type f -mtime +7
```

**Explanation:**
- `-mtime +7` = modified more than 7 days ago
- Useful for cleanup logic (e.g. old logs).


## Example 5 - Compress all .log files using xargs

**Question:**
Find all `.log` files under the current directory and compress them with `gzip`.

**Answer:**

```bash
find . -type f -name "*.log" | xargs gzip
```

**Explanation:**
- `find` locates all `.log` files.
- `| xargs gzip` runs gzip <file> for each one.


## Example 6 — Find .log files only in the current folder (no subdirectories)

**Question:**
List `.log` files only in the current directory (do not search subdirectories).

**Answer:**

```bash
find . -maxdepth 1 -type f -name "*.log"
```

**Explanation:**
- `-maxdepth 1` = don’t go deeper than the current directory
