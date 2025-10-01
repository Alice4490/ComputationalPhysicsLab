# labComputazionale

## C Programming with Jupyter Notebook

This repository contains a Jupyter notebook for C programming.

### Setup Instructions

1. **Install Jupyter Notebook**
   ```bash
   pip install jupyter
   ```

2. **Install the C Kernel for Jupyter**
   ```bash
   pip install jupyter-c-kernel
   install_c_kernel --user
   ```

3. **Launch Jupyter Notebook**
   ```bash
   jupyter notebook
   ```

4. **Open the notebook**
   - Open `c_programming.ipynb` in the Jupyter interface

### Using the Notebook

The notebook (`c_programming.ipynb`) includes:
- Instructions for setting up the C kernel
- Example C programs (Hello World, variables, loops)
- Empty cells for writing your own C code

Each code cell should contain a complete C program with `#include` directives and a `main()` function.

### Alternative: Using Google Colab

If you prefer not to install Jupyter locally, you can also use the notebook with Google Colab, though you'll need to set up the C kernel there as well.

### Requirements

- Python 3.x
- GCC compiler (for executing C code)
- Jupyter Notebook
- jupyter-c-kernel