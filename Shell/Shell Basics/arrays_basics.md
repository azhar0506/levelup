# Shell Scripting Notes: Working with Arrays

## 1. Initializing Arrays
- Arrays can be initialized in multiple ways:
```bash
# Method 1: Initialize with values
data=(apple orange banana)

# Method 2: Empty array
items=()
```

## 2. Adding Elements to an Array
- Add elements using index or append:
```bash
# Append an element
items+=(grape)

# Add at specific index
items[3]=mango
```

## 3. Accessing Specific Elements
- Access elements by index:
```bash
echo "First element: ${data[0]}"
echo "Third element: ${data[2]}"
```

## 4. Determining the Number of Elements
- Use `${#array[@]}` to get the length:
```bash
echo "Number of elements: ${#data[@]}"
```

## 5. Looping Through Arrays
- Iterate over all elements:
```bash
for item in "${data[@]}"; do
    echo "Item: $item"
done
```
