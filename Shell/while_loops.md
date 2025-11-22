# While loop
### Syntax
**Basic while loop**
```bash
while condition; do
  commands
done
```


### Example Countdown Using a while Loop

```bash
count=5
echo "Countdown:"
while [ $count -gt 0 ]; do
  echo $count
  count=$((count - 1))
  sleep 1 # Wait for 1 second
done
echo "Blast off!"
```

- count=5 initializes the counter.
- The condition [ $count -gt 0 ] checks if count is greater than 0.
- The loop continues as long as the condition is true.
- Each iteration prints the current count, decrements it, and waits 1 second.
- When count reaches 0, the condition becomes false and the loop exits.