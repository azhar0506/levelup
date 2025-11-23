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


## Example - errors logs

```bash
ls /not_a_real_dir 2> errors.log
```

**What happens**

- `ls` tries to list a directory
- The directory does not exist
- It produces **stderr**
- `2>` sends stderr into `errors.log`
- Nothing appears in your terminal because the error was redirected 

**Effect**

- `errors.logs` now contains the "No such file or directory" message
- stdout (regular output) is not touched


## Example 2 - combining logs

```bash
command > combined.log 2>&1
```

- Included this example since this is the only command in this topic where it goes after the output you're producing