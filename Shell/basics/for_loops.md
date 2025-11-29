# For loop
### Syntax
**Looping through an array**
```bash
for var in "${ARRAY[@]}"; do
    commands
done
```

**Looping through a numeric range**
```bash
for var in {start..end}; do
    commands
done
```

### Example 1: Looping through an array

```bash
echo "Looping through an array:"
NAMES=("Alice" "Bob" "Charlie" "David")

for name in "${NAMES[@]}"; do
  echo "Hello, $name!"
done
```

- NAMES=(...) defines an array.
- "${NAMES[@]}" expands to every element of the array
- Each value is stored in name for one loop iteration


### Example 2: Looping through a range of numbers
```bash
echo "Looping through a range of numbers:"
for i in {1..5}; do
  echo "Number: $i"
done
```

- `{1..5}` generates the sequence: `1 2 3 4 5`
- Each iteration assigns the next number to `i`

