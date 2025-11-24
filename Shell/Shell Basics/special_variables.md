# Special Variables - Syntax and Examples

## 1. $0 - Script Name

### Syntax
```bash
echo "$0"
```

### Example
```bash
echo "This script is called: $0" # Output: This script is called: ./myscript.sh
```

## 2. $1, $2, ... - Positional Parameters

### Syntax
```bash
echo "$1"   # first argument
echo "$2"   # second argument
```

### Example
```bash
echo "First argument: $1"
echo "Second argument: $2"
```

- Run:

```bash
./myscript.sh apple banana
```

- Output:
```bash
First argument: apple
Second argument: banana
```


## 3. $@ - All Arguments (as seperate words)

### Syntax
```bash
for arg in "$@"; do
    echo "$arg";
done
```

### Example
```bash
echo "All arguments individually:"
for arg in "$@"; do
    echo "$arg"
done
```

- Run:

```bash
./myscript.sh "hello world" test
```

- Output:
```bash
hello world
test
```


## 4. $* - All Arguments (as one string when quoted)

### Syntax
```bash
echo "$*"
```

### Example
```bash
echo "All arguments as one string:"
echo "$*"
```

- Run:

```bash
./myscript.sh "hello world" test
```

- Output:
```bash
hello world test
```

## 5. $# - Number of Arguments

### Syntax
```bash
echo "$#"
```

### Example
```bash
echo "You passed $# arguments"
```

- Run:

```bash
./myscript.sh a b c
```

- Output:
```bash
You passed 3 arguments
```


## 6. $$ - Current Script's Process ID (PID)

### Syntax
```bash
echo "$#"
```

### Example
```bash
tmpfile="/tmp/tmpfile_$$"
echo "Creating temp file: $tmpfile"
touch "$tmpfile"
```

- Output:
```bash
Creating temp file: /tmp/tmpfile_12345
```

## 7. $? - Exit Status of Last Command

### Syntax
```bash
echo "$?"
```

### Example
```bash
ls /does/not/exist
echo "Exit status of previous command: $?"
```

- Output:
```bash
ls: cannot access '/does/not/exist': No such file or directory
Exit status of previous command: 2
```
- (0 = success, non-zero = failure)

## 8. $! - PID of Last Background Process

### Syntax
```bash
command &
echo "$!"
```

### Example
```bash
sleep 20 &
echo "Background process PID: $!"
```

- Output:
```bash
Background process PID: 54321
```