# String Operations

## 1. Calculating the Length of a string
**Syntax:**
```sh
${#string}
```
**Example:**
```sh
string='HelloWorld'
echo $(#string) #Output: 10
```

Returns the number of characters in `string`

## 2. Finding the Position of a Character
**Syntax:**
```sh
$(expr index "$string" "$char")
```

**Example:**
```sh
string="HelloWorld"
char="o"
echo $(expr index "$string" "$char")   # Output: 5
```

## 3. Extracting a Substring
**Syntax:**
```sh
${string:start:length}
```

**Example:**
```sh
string="HelloWorld"
echo ${string:0:5}   # Output: Hello
echo ${string:5:5}   # Output: World
```

## 4.1 String Replacement Operations - Replace first occurence
**Syntax:**
```sh
${string/pattern/replacement}
```

**Example:**
```sh
string="apple apple"
echo ${string/apple/orange}   # Output: orange apple
```

## 4.2 String Replacement Operations - Replace all occurence
**Syntax:**
```sh
${string//pattern/replacement}
```

**Example:**
```sh
string="apple apple"
echo ${string//apple/orange}  # Output: orange orange
```

## 4.3 String Replacement Operations - Replace at beginning of string
**Syntax:**
```sh
${string/#pattern/replacement}
```

**Example:**
```sh
string="apple pie"
echo ${string/#apple/orange}  # Output: orange pie
```

## 4.4 String Replacement Operations - Replace at end of string
**Syntax:**
```sh
${string/%pattern/replacement}
```

**Example:**
```sh
string="apple pie"
echo ${string/%pie/cake}      # Output: apple cake
```
