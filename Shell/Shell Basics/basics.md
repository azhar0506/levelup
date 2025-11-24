# Shell Scripting Notes

## 1. Creating and Making a Script Executable
- Create a new script file using `touch script.sh` or any text editor.
- Add the **shebang** at the top:
```bash
#!/bin/bash
```
- Make the script executable:
```bash
chmod +x script.sh
```
- Run the script:
```bash
./script.sh
```

## 2. Accessing Individual Arguments
- Use **positional parameters**:
  - `$1` → First argument
  - `$2` → Second argument
  - `$3` → Third argument, and so on.
- Example:
```bash
echo "First argument: $1"
echo "Second argument: $2"
```

## 3. Using `$#` to Determine Number of Arguments
- `$#` gives the **count of arguments** passed to the script.
- Example:
```bash
echo "Number of arguments: $#"
```

## 4. Conditional Logic for Argument Handling
- Use `if` statements to check argument count:
```bash
if [ $# -eq 0 ]; then
  echo "No arguments provided."
elif [ $# -eq 1 ]; then
  echo "One argument provided: $1"
else
  echo "Multiple arguments provided."
fi
```

## 5. Using `$@` to Loop Through All Arguments
- `$@` represents **all arguments** as separate words.
- Example:
```bash
for arg in "$@"; do
  echo "Argument: $arg"
done
```
