# Exit Codes & set -euo pipefail

## What are exit codes?

Every command in Unix returns an exit code:

- 0 -> success
- non-zero -> failure

You can check the exit code of the previous command  with:

```sh
echo $?
```

**Examples:**

```sh
false
echo $?         # 1 (fail)


true
echo $?         # 0 (success)   
```

Exit codes are how Bash tells you whether something worked or not.


## Why exit codes matter

- Scripts must stop when something goes wrong
- Prevents corrupted data or half-completed tasks
- Essential for CI/CD, cronjobs, automation, deployments
- Helps detect silent failures early

If you ignore exit codes, your script might keep running in a broken state.


## set -euo pipefail

Add this at the top of every safe Bash script:

```bash

set -eou pipefail

```

This makes your script fail fast instead of continuing after errors.

**Breakdown:**


| Flag          | Meaning                                             |
|---------------|-----------------------------------------------------|
| -e            | exit immediately if any command fails               |
| -u            | exit when using an undefined variable               |
| -o pipefail   | a pipeline fails if **any** command fails inside it |


## die() helper function

A clean pattern for printing an error and exiting:

```sh

die() { echo "ERROR: $*" >&2; exit 1;}
```

Useful for validating input:

```sh
[ -d "$DIR" ] || die "Directory not found: $DIR"
[ -n "$DAYS" ] || die "Missing DAYS value"
```

## Example 1 - Checking exit codes manually

**Question:**
Write a script that runs a failing command, checks $?, and prints "OK" or "FAIL"


**Answer:**

```sh
#!/bin/bash

false   # failing command

if [[ $? -eq 0 ]]; then
    echo "OK"
else
    echo "FAIL"
fi
```

## Example 2 - Adding set -euo pipefail

**Question:**
Add strict-mode safety to a script and observe what happens when a command fails.


**Answer:**

```sh
#!/bin/bash
set -euo pipefail

echo "Start"
false         # script stops here
echo "This will never run"
```


## Example 3 — Using die() for validation

**Question:**
Use the die() helper to validate arguments.


**Answer:**

```sh
#!/bin/bash
set -euo pipefail

die() { echo "ERROR: $*" >&2; exit 1; }

DIR=${1:-}   || die "DIR missing"
DAYS=${2:-}  || die "DAYS missing"

[ -d "$DIR" ] || die "Directory does not exist: $DIR"

echo "Arguments OK"
```

**Explanation**

`die()` gives clean error messages and exits immediately
