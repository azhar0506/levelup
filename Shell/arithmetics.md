# Arithmetic Operations in Shell

## Main command:
```sh
$(( ))
```

- This is Bash's syntax for arithmetic operations.
- Anything inside these double brackets is treated as an arithmetic expression


## Example
- Cost of a fruit basket containing 1 apple, 2 banana and 3 mango

```sh
#!/bin/bash

# Define costs
COST_APPLE=2
COST_BANANA=1
COST_MANGO=5

# Calculate total cost
TOTAL=$((COST_APPLE + (COST_BANANA * 2) + (COST_MANGO * 3) ))
```

- **Important:** No need to use `$` before variable names
