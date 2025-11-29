# AWK (Stream Processing & Text Extraction)

## What is it?

`awk` is a powerful text-processing language used to scan files line-by-line and extract or manipulate fields.
It's especially used for logs, CSVs, and structured text

It automatically splits each line into `fields`:
- $1 = first field
- $2 = second field
- $0 = the entire line
- Fields are split by whitespace by default

You can apply conditions, print fields, and perform calculations - all in one command.

## Why it's needed
- Extracting specific solumns from logs
- Filtering lines based on conditions
- Summing or averaging numeric fields
- Generating quick summaries
- Clearning up data before processing
- Rapid on-the-fly analytics

`awk` is used everywhere in DevOps because it's lightweight and built into every Unix system

## Useful awk patterns

| Pattern             | Meaning                                   | Example                       |
|---------------------|--------------------------------------------|-------------------------------|
| $N                  | Print field N                              | awk '{print $1}' file         |
| condition { action }| Run action only when condition is true     | awk '$9 >= 400 {print}'       |
| BEGIN               | Run before reading file                    | awk 'BEGIN{print "Start"}'    |
| END                 | Run after reading file                     | awk 'END{print sum}'          |
| sum += $N           | Accumulate a field                         | awk '{sum+=$10}'              |
| count++             | Count lines                                | awk '{count++}'               |
| print $1, $2        | Print fields with a space                  | awk '{print $1, $7}'          |
|    -f " / "         | / is the seperator instead of default " "  | awk -f "/"                    |              




## Example 1 - Basic Redirection

**Question:**
Print the IP address (field 1) from every line.

**Answer:**

```bash
awk '{print $1}' web.log
```

**Explanation:**
`$1` is the first field. print outputs that field for each line.



## Example 2 - Print lines where status code ≥ 400

**Question:**
Print all lines where the HTTP status code (field 9) is 400 or greater.

**Answer:**

```bash
awk '$9 >= 400 {print}' web.log
```

**Explanation:**
If the condition is true `($9 ≥ 400)`, awk runs the {print} action.


## Example 3 - Print specific fields

**Question:**
Print the IP, URL path, and status code.

**Answer:**

```bash
awk '{print $1, $7, $9}' web.log
```

**Explanation:**
Commas insert spaces between fields.


## Example 4 — Sum values across the file

**Question:**
Calculate total bytes returned (field 10).

**Answer:**

```bash
awk '{sum += $10} END {print sum}' web.log
```

**Explanation:**
`sum += $10` runs for every line.
`END {print sum}` prints the final result.


## Example 5 — Filter by response size

**Question:**
Print lines where the response size (field 10) is greater than 1000.

**Answer:**

```bash
awk '{if ($10 > 1000) print}' web.log
```

**Explanation:**
Basic condition + print command.


## Example 6 — Average calculation

**Question:**
Compute the average response size.

**Answer:**

```bash
awk '{sum += $10; count++} END {print sum / count}' web.log
```

**Explanation:**
Tracks total + count per line, prints average at the end.


## Example 7 — Print URL + size only for GET requests

**Question:**
Print the URL (field 7) and size (field 10) for GET requests.

**Answer:**

```bash
awk '$6 == "\"GET" { print $1 }' web.log
```

**Explanation:**
Field 6 contains "GET in typical access logs, including the quote.





