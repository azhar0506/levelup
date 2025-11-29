# SED (Stream Editor)

## What is it?

`sed` is a powerful text-processing tool used to edit, transform, filter, and manipulate text line by line. It does not open the file interactively, instead processes input and prints modified output.

You can use `sed` to:
- substitute text
- delete lines
- insert or append lines
- select specific line ranges
- modify logs on the fly
- automate cleanup tasks

## Why it's needed

- Cleaning and transforming logs
- Adjusting configuration files during automation
- Extracting meaningful data from text
- Quickly editing files in scripts
- Applying changes without manually opening files

## Useful `sed` Commands table

| Command        | Meaning                           | Example                 |
|----------------|-----------------------------------|-------------------------|
| `s/old/new/`   | Substitute text                   | `sed 's/error/ERROR/'`  |
| `s/old/new/g`  | Global substitute (replace all)   | `sed 's/error/ERROR/g'` |
| `d`            | Delete matching lines             | `sed '/DEBUG/d'`        |
| `i`            | Insert *before* line              | `sed '1i text'`         |
| `a`            | Append *after* line               | `sed '$a text'`         |
| `c`            | Change (replace entire line)      | `sed '3c new line'`     |
| `-n 'X,Yp'`    | Print a line range                | `sed -n '5,10p'`        |
| `/regex/`      | Match using regex                 | `sed '/ERROR/d'`        |


## Example 1 - Replace text globally

**Question:** 
Replace all occurences of `ERROR` (case-sensitive) and show only the first 10 lines.

**Answer:**

```sh
sed 's/error/ERROR/g' sample.log | head
```

**Explanation**

- `s/error/ERROR/g` replaces all matches on each line
- `g` is what does it for all (global)
- `head` shows the first 10 modified lines

## Example 2 - Delete all DEBUG lines

**Question:** 
Delete every line that contains the word `DEBUG` and show the first 5 lines.

**Answer:**

```sh
sed '/DEBUG/d' sample.log | head -n5
```

**Explanation**

- `/DEBUG/` matches lines containing `DEBUG`
- `d` deletes those lines
- `head` -n5 shows the first 5 remaining lines


## Example 3 - Print a range of lines

**Question:** 
Print lines 5 through 10 from the file.

**Answer:**

```sh
sed -n '5,10p' sample.log
```

**Explanation**

- `-n` stop `sed` from printing everything; '5,10p' prints only the lines 5-10


## Example 4 - Insert line before first line

**Question:** 
Insert ----- LOG START ----- before the first line in the file.

**Answer:**

```sh
sed '1i ----- LOG START -----' sample.log
```

**Explanation**

- `1i` inserts text before line 1.



## Example 5 — Replace entire line

**Question:** 
Replace the entire contents of line 3.

**Answer:**

```sh
sed '3c *** THIRD LINE OVERRIDDEN ***' sample.log
```

**Explanation**

- `3c` changes the whole line with the provided text.


## Example 6 — Delete a range of lines

**Question:** 
Delete lines 10 though 20 (inclusive).

**Answer:**

```sh
sed '10,20d' sample.log
```

**Explanation**

- `10,20d` deletes lines 10 → 20.


## Example 7 — Append line at the end

**Question:** 
Append ----- END OF LOG ----- after the last line.

**Answer:**

```sh
sed '$a ----- END OF LOG -----' sample.log
```

**Explanation**

- `$` = last line, `a` = append after it.


## Example 8 — Remove timestamp from each line

**Question:** 
Remove the first two fields (the timestamp) from every line.

**Answer:**

```sh
sed 's/^[^ ]* [^ ]* //' sample.log
```

**Explanation**

- `^[^ ]*` = match first field (date)
- `=` space
- `[^ ]*` = match second field (time)
- `' '` removes them