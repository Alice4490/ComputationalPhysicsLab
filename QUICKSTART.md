# Quick Start Guide: C Programming in Jupyter

This guide will help you get started with C programming using Jupyter Notebook.

## Prerequisites

- Python 3.x installed on your system
- GCC compiler (usually pre-installed on Linux/Mac, needs MinGW on Windows)

## Step-by-Step Setup

### 1. Install Jupyter Notebook

Open your terminal/command prompt and run:

```bash
pip install jupyter
```

### 2. Install the C Kernel

```bash
pip install jupyter-c-kernel
install_c_kernel --user
```

### 3. Verify Installation

Check that the C kernel is installed:

```bash
jupyter kernelspec list
```

You should see "c" in the list of available kernels.

### 4. Start Jupyter Notebook

Navigate to this repository directory and run:

```bash
jupyter notebook
```

This will open Jupyter in your web browser.

### 5. Open the Notebook

In the Jupyter interface:
1. Click on `c_programming.ipynb`
2. The notebook will open with the C kernel automatically selected

### 6. Run Your First C Program

- Click on a code cell
- Press `Shift+Enter` to execute the code
- The output will appear below the cell

## Writing C Code

Each code cell should contain a complete C program:

```c
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```

## Tips

- Each cell runs independently - include all necessary headers in each cell
- Use `Shift+Enter` to run a cell and move to the next one
- Use `Ctrl+Enter` to run a cell and stay on it
- The C kernel compiles and runs your code using GCC

## Troubleshooting

### Error: "jupyter: command not found"

Make sure Python's bin directory is in your PATH, or use:

```bash
python -m jupyter notebook
```

### Error: "gcc: command not found"

Install GCC:
- **Linux**: `sudo apt-get install gcc` (Ubuntu/Debian) or `sudo yum install gcc` (RedHat/CentOS)
- **Mac**: Install Xcode Command Line Tools: `xcode-select --install`
- **Windows**: Install MinGW or use WSL

### Kernel not appearing

Try reinstalling the C kernel:

```bash
pip uninstall jupyter-c-kernel
pip install jupyter-c-kernel
install_c_kernel --user
```

## Additional Resources

- [Jupyter Documentation](https://jupyter.org/documentation)
- [jupyter-c-kernel on PyPI](https://pypi.org/project/jupyter-c-kernel/)
- [C Programming Tutorial](https://www.learn-c.org/)

## Next Steps

Once you have the setup working:
1. Try running the example programs in `c_programming.ipynb`
2. Modify them to experiment with C concepts
3. Write your own C programs in the empty cells provided

Happy coding!
