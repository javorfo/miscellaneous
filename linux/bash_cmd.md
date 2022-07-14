# Arguments
| Arg identifier | Description                       |
| -------------- | --------------------------------- |
| $0             | The name of the script itself, which is often used in usage statements.       |
| $1             | A positional argument, which is the first argument passed to the script.       | 
| ${10}          | Where two or more digits are needed to represent the argument position. Brace brackets are used to delimit the variable name from anyother content. Single value digits are expected. |
| $#             | The argument count is especially useful when we need to set the amount of arguments needed for correct script execution. |
| $*             | Refers to all arguments. |

# Interpolation and Literals
- Interpolation: `"Hello $1"` -> Hello ...
- Literals: `'Hello $1'` -> Hello $1
- Mixed: `"Hello $USER \$1"` -> Hello javier $1

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