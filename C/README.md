# C Programming Examples

This directory contains C programs for the Computational Physics Laboratory course.

## Compilation

Compile a C program with:
```bash
gcc -o output_name source_file.c -lm
```

The `-lm` flag links the math library, which is needed for functions like `sin()`, `cos()`, `exp()`, etc.

## Example Programs

- `template.c` - Basic template for C programs

## Tips

1. Always include necessary headers (`stdio.h`, `stdlib.h`, `math.h`)
2. Use `double` precision for numerical calculations
3. Free allocated memory to avoid memory leaks
4. Check for errors (e.g., file operations, memory allocation)
5. Compile with warnings enabled: `gcc -Wall -Wextra`

## Common Libraries

- `stdio.h` - Standard input/output
- `stdlib.h` - Memory allocation, random numbers
- `math.h` - Mathematical functions
- `time.h` - Time-related functions
