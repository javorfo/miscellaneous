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
