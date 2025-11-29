# Log Processing
## What is it?
These commands are used to search, filter, extract, sort, and summarise text - especially log files.

They help you proecss logs by:
- Finding specific patterns (using `grep`)
- Extracting fields (using `cut`)
- Sorting data (`sort`)
- Removing duplicates (`uniq`)
- Counting things (`wc -l` or `uniq -c`)
- Combining commands with pipes (`|`)

This is the foundation of logs analysis, scripting, and automation

## Why it's needed
- Debugging system and application issues
- Extracting useful data from large logs
- Counting events (errors, warning, logins, IPs)
- Buiding monitoring and alerting tools
- Preparing data for scripts or reports

## Useful Commands Table

| Command        | Purpose                          | Example                   |
|----------------|----------------------------------|---------------------------|
| grep           | Search for text patterns         | grep "ERROR" sample.log   |
| grep -i        | Case-insensitive search          | grep -i "error"           |
| grep -v        | Invert match (exclude pattern)   | grep -v "200"             |
| cut -d " " -f N| Extract Nth field using delimiter| cut -d " " -f 8           |
| sort           | Sort alphabetically              | sort                      |
| sort -nr       | Sort numerically, descending     | sort -nr                  |
| uniq           | Remove duplicate lines           | uniq                      |
| uniq -c        | Count duplicates                 | uniq -c                   |
| wc -l          | Count lines                      | wc -l                     |


## Example 1 - Case-insensitive search

**Question:**
Show all lines in `sample.log` that contain the word `error` (case-insensitive)

**Answer:**
```bash

grep -i "error" sample.log

```

**Explanation:**

`-i` matches `error`, `Error`, `ERROR`, etc

## Example 2 - Exclude lines containing 200

**Question:**
Show all lines that do not contain 200

**Answer:**
```bash

grep -v "200" sample.log

```

**Explanation:**

`-v` inverts tha match, hiding lines with the pattern

## Example 3 - Extract only the IP field

**Question:**
Extract the IP address column for the log.

**Answer:**
```bash

cut -d " " -f 8 sample.log

```

**Explanation:**

Splits by spaces and prints field 8 (the IP field in this example) for lines that contain one.

## Example 4 - Count WARN occurences

**Question:**
Count how many log entries contain the word `WARN`

**Answer:**
```bash

grep "WARN" sample.log | wc -l

```

**Explanation:**

`grep` finds matches; `wc -l` counts them.


## Example 5 - List unique IP addresses

**Question:**
Show only unique IPs in alphabetical order.

**Answer:**
```bash

cut -d " " -f 8 sample.log | sort | uniq

```

**Explanation:**

Sort groups duplicates; `uniq` removes them.


## Example 6 - Count occurrences of each IP (descending)

**Question:**
Count how many times each IP appears and show highest first

**Answer:**
```bash

cut -d " " -f 8 sample.log | sort | uniq -c | sort -nr

```

**Explanation:**

- `sort` groups identical IPs
- `uniq -c` counts them
- `sort -nr` sorts by highest count


## Example 7 - Match timestamps between 12:02:00 and 12:02:30

**Question:**
CShow log entries between 12:02:00 and 12:02:30

**Answer:**
```bash

grep -E "12:02:(0[0-9]|1[0-9]|2[0-9]|30)" sample.log

```

**Explanation:**

Extended regex matches seconds from `00` to `30`

## Example 8 - Extract unique URL paths
**Question:** 
Extract all unique URLs accessed in GET/POST requests

**Answer:**

```sh
grep -E "GET|POST" sample.log | cut -d " " -f 6 | sort | uniq
```

**Explanation**

Filter request lines, extract hte URL field, sort, remove duplicates.



## Example 9 - Show only IPs in the 10.x.x.x range
**Question:** 
Show lines where the IP starts with 10..

**Answer:**

```sh
grep -E "10\.[0-9]+\.[0-9]+\.[0-9]+"
```

**Explanation**

Matches IPs beginning with `10.` followed by valid number groups
