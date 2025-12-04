# Regex

## What is Regex 

Regex is a pattern matching language used to:
- search text
- filter logs
- extract information
- validate strings
- match patterns instead of exact text

## Core Regex Building Blocks

### 1. Literal text

```sh
error
login
api
```

matches exact characters

###  2. Dot (.) -> match ANY single character

```sh
a.b
```

Matches: acb, a-b, a7b, not ab

###  3. Star(*) -> 0 or more of the previous character

```sh
ab*
```

Matches a,ab,abb,abbbbbbb, not abc

###  4. Plus (+) -> 1 or more

```sh
ab+
```

Matches: ab, abb, not a, abc


###  5. Character classes [ ]

```sh
[abc]
```

Matches any of a,b,c


```sh
[0-9]
```

Matches any digit

```sh
[A-Za-z]
```

Matches any letter


## Anchors

Anchors match positions in a line, not characters

### 6. ^ -> start of line

```sh
^ERROR
```

Matches only of line starts with ERROR

### 7. $ → end of line

```sh
txt$
```

Matches line ending with txt

## Groups and Alternation

### 8. | → OR

```sh
ERROR|WARN
```

Matches either word


### 10. {m,n} → repeat

```sh
[0-9]{3}
```

Matches exactly 3 digits. Not 12, 7, a21, 2a0



## Examples


## Example 1 - Match any 4xx or 5xx HTTP code

```sh
[45][0-9]{2}
```

**Explanation:**
- [45] -> first digit must be 4 or 5
- [0-9] -> second digit is any digit
- {2} -> repeat the previous class exactly twice (so total 3 digits)
- Matches:
    - 404
    - 500
    - 403
    - 502


## Example 2 - Match an IPv4 address

```sh
[0-9]{1,3}(\.[0-9]{1,3}){3}
```

**Explanation:**
- [0-9]{1,3} -> a number from 1 to 3 digits (0-999)
- \. -> a literal dot (escaped, because . normally means "any char")
- (...){3} -> repeat "dot + number" three times
- matches:
    - 192.168.1.5
    - 10.0.0.1
    - 172.16.254.3


## Example 3 - Match timestamps like 12:45:33

```sh
[0-9]{2}:[0-9]{2}:[0-9]{2}
```

**Explanation:**
- [0-9]{2} → exactly two digits
- : -> literal colon
- Pattern is repeated 3x for HH:MM:SS
- Matches:
    - 00:01:59
    - 12:34:56
    - 17:31:32