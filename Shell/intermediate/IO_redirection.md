# I/O Redirection (stdin, stdout, stderr)

## What is it?

- I/O redirection control where command input and output go.
- Every command has three "streams":
  - **stdin (0)** - input *into* the command
  - **stdin (1)** - normal *output* from the command
  - **stderr (2)** - error messages from the command

- Redirection lets you send these streams to files, from files, or into other commands.

## Why its needed

- logging output
- seperating errors from normal output
- scripting
- automating tasks
- sending command results into other commands

| Operator | Meaning                      | Example                  |
|----------|------------------------------|--------------------------|
| `>`      | Redirect stdout (overwrite)  | `ls > out.txt`           |
| `>>`     | Redirect stdout (append)     | `echo hi >> out.txt`     |
| `2>`     | Redirect stderr              | `ls /nope 2> errors.log` |
| `2>>`    | Append stderr                | `cmd 2>> err.log`        |
| `<`      | Redirect stdin from a file   | `cat < file.txt`         |
| `2>&1`   | Merge stderr into stdout     | `cmd > all.log 2>&1`     |


## Example 1 - Basic Redirection

**Question:**
List `/etc` and send only stdout to `list.txt`

**Answer:**

```bash
ls /etc > list.txt
```

**Explanation:**
`>` redirects **stdout** to a file. Errors (**stderr**) to `list.txt`


## Example 2 - Redirect ONLY stderr

**Question:**
Run a failing command and send only stderr to `oops.log`.

**Answer:**

```bash
ls nonexistent_directory 2> oops.log
```

**Explanation:**
`2>` redirects **stderr** into a file.

## Example 3 - Append stdout

**Question:**
Append stdout to `output.log` without overwriting it.

**Answer:**

```bash
echo "yoyo" >> output.log
```

**Explanation:**
`>>` appends stdout, preserving existing log entries.


## Example 4 - Split stdout and stderr to different files

**Question:**
Use one command that outputs both stdout and stderr, sending stdout to `good.log` and stderr to `bad.log`.

**Answer:**

```bash
ls existing_directory nonexisting_directory 1> good.log 2> bad.log
```

**Explanation:**
- `1>` redirects stdout
- `2>` redirects stderr — both go to different files.

## Example 5 - Merge stderr into stdout

**Question:**
Merge stderr into stdout and send the combined output to `combined.log`.

**Answer:**

```bash
ls directory_exists nondirectory_exist > combined.log 2>&1
```

**Explanation:**
- `>` sets the destination for stdout
- `2>&1` then sends stderr to the same place
- **Order matters**: stdout must be redirected before merging.


## Example 6 — Pipe stdout into another command

**Question:**
Pipe the output of `ls /etc` into head and show only 3 lines.

**Answer:**

```bash
ls /etc | head -n3
```

**Explanation:**

- `|` sends **stdout** into the next command.


## Example 7 — Show that stderr does NOT go through a pipe

**Question:**
Run a failing command and pipe it — but show that stderr does not enter the pipe.

**Answer:**

```bash
cat non_existing_file | grep "yo"
```

**Explanation:**

- The error “No such file…” is stderr, which does not pass through the pipe unless merged.

## Example 8 — Merge stderr into stdout, THEN pipe the combined stream

**Question:**
List `/etc`, merge stdout + stderr, and pipe the combined stream into `wc -l`.

**Answer:**

```bash
ls /etc 2>&1 | wc -l
```

**Explanation:**

- `2>&1` merges stderr into stdout
- The merged stream flows through the pipe into `wc -l`
- No file redirection is used

## Example 9 — Pipe stdout, redirect stderr

**Question:**
Pipe stdout into another command while sending stderr into a file.

**Answer:**

```bash
ls /etc 2> errors_only.log | grep "windows"
```

**Explanation:**

- `2>` errors_only.log captures stderr
- stdout continues into the pipe normally
