# Case

- A case statement lets you compare a single value against multiple patterns-similar to `switch` in other languages
- Can be cleaner and more readable instead of many `if/elif` conditions

### Basic Syntax
```bash
case WORD in
    PATTERN_1)
        commands
        ;;
    PATTERN_2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

- `WORD`: The variable or value you're testing
- `PATTERN`: A glob-syle pattern (*, ?, character ranges, etc.).
- `;;` ends a pattern block
- `*)` is the *catch-all* default case.

### Example

```bash
read -p "Enter a letter: " letter

case "$letter" in
    a)
        echo "You typed 'a'"
        ;;
    b|B)
        echo "YOu typed 'b' or 'B'"
    [0-9])
        echo "That's a number"
        ;;
    *)
        echo "Something else"
        ;;
```

- `a` matches exactly a.
- `b|B` means match **either** b or B
- [0-9] matches any digit
- `*` matches anything ont caught by previous cases


## Pattern Matching Feartures

- Patterns in case use shell globs, not regex:

| Pattern            | Matches                                  |
|--------------------|------------------------------------------|
| `*`                | Anything (any length)                    |
| `?`                | Any single character                     |
| `[abc]`            | One of `a`, `b`, or `c`                  |
| `[a-z]`            | Any lowercase letter                     |
| `*.txt`            | Anything ending in `.txt`                |
| `foo*`             | Anything starting with `foo`             |