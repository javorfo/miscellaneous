# Heading
```bash
#!/bin/bash
# Author: ...
# Web: ...
# Description...
# within $HOME
# Last Edited: Month Day Year
```

# Arguments
| Arg identifier | Description                       |
| -------------- | --------------------------------- |
| $0             | The name of the script itself, which is often used in usage statements.       |
| $1             | A positional argument, which is the first argument passed to the script.       | 
| ${10}          | Where two or more digits are needed to represent the argument position. Brace brackets are used to delimit the variable name from anyother content. Single value digits are expected. |
| $#             | The argument count is especially useful when we need to set the amount of arguments needed for correct script execution. |
| $*             | Refers to all arguments. |
| $?             | Get the return status.   |

# Parameter Substitution
- ${parameter-default}
- Substituing a possible empty parameter:
```bash
#!/bin/bash
#Use parameter substitution to provide default value
name=${1-"Anonymous"}
echo "Hello $name"
exit 0
```

# Standard Options
- **-a** List all items
- **-c** Get a count of all items
- **-d** Output directory
- **-e** Expand items
- **-f** Specify a file
- **-h** Show the help page
- **-i** Ignore the character case
- **-l** List a text
- **-o** Send output to a file
- **-q** Keep silent; don't ask the user
- **-r** Process something recursively
- **-s** Use stealth mode
- **-v** Use verbose mode
- **-x** Specify an executable
- **-y** Accept without prompting me

# Print
- Interpolation: `echo "Hello $1"` -> Hello ...
- Literals: `echo 'Hello $1'` -> Hello $1
- Mixed: `echo "Hello $USER \$1"` -> Hello javier $1
- Echo with escape sequence: `echo -e "hello \c"`
- Echo without new line: `echo -n "hello"`

# Files
- Display file name only: `basename file`

# Variables
- `name="fdfas"`, `name=12`

### Arrays
- Declare: `myarray=(one two three four)`
- Print: `echo ${myarray[0]}; echo ${myarray[*]} #prints all`
- Remove: `unset array[1]; unset array #remove all elements`

### Environment variables
- Show: `printenv`

### Set commands in a variable
- `myvar=$(pwd)`

### Execute arithmetic 
```bash
count=0
(( count++ ))
echo $count
```

# Debug
- Verbose: `bash -v script.sh`
- Executed: `bash -x script.sh`

# Input
- Read: `read; echo "result: $REPLY"`
- Read: `read -p "name: " var_name` 
- Read: `read -n1 -p "Press any key to exit" # n1 number of chars accepted or -sn1 to not seeing the entered text` 

# Conditionals
- Command **test**: `test expression`, `test ! expression #negation`, `test expression -o expression2 #or`, `test expression -a expression2 #and`
- Bracket conditional: `[ $HOME = /home/javier ]`, `[ ! $HOME = /home/javier ]`, 
- Others: `[ -n $SSH_TTY ] #If this is true, then the connection is made with SSH`, `[ -z $1 ] #A true result for this query means that no input parameters have been supplied to the script`
- Test Integers: `[ number1 -gt number2] #-eq -ge -le -lt -ne`

### Test files
- **-d** This shows that it's a directory
- **-e** This shows that the file exists in any form
- **-x** This shows that the file is executable
- **-f** This shows that the file is a regular file
- **-r** This shows that the file is readable
- **-p** This shows that the file is a named pipe
- **-b** This shows that the file is a block device
- **file1 -nt file2** This checks if file1 is newer than file2
- **file1 -ot file2** This checks if file1 is older than file2
- **-O file** This checks if the logged-in user is the owner of the file
- **-c** This shows that the file is a character device
- **-o** or clause **test -f file -o -e file**
- **-a** and clause **test -f file -a -e file**

### If else
```bash
if condition; then
  statement
else
  statement
fi
```

### Check Strings
- `if [ string1 \< string2 ] #if string1 is less than string2` 
- `if [ string1 \> string2 ] #if string1 is greater than string2` 
- `if [ -n string1 ] #if string1 is longer than zero` 
- `if [ -z string1 ] #if string1 has zero length` 

# Text colors
- \033 is the escaped character and 31/32 the color
```bash
RED="\033[31m"
GREEN="\033[32m"
echo -e ${RED}Error
```

# Loops
- Classic loop
```bash
for loopVar in values; do
echo $loopVar
done
```
- C-Style loop redirecting the output
```bash
for (( var = 1; var < 3; var++ )); do
echo $var
done > file.txt
```
- While to read a file
```bash
while read server; do
echo $server
done < servers.txt
```

# IFS
- Change IFS to be a new line: **IFS=$'\n'**

# Functions
- To check functions: **declare -F**
```bash
testing() {
  local myvar=10
  return $var
}
testing
```
