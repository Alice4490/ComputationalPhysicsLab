# labComputazionale

## Getting Started with Jupyter Notebooks for C/C++

This repository contains materials for computational laboratory work using C/C++ in Jupyter notebooks.

### Prerequisites

To use Jupyter notebooks with C/C++, you need to install:
1. **Jupyter Notebook** or **JupyterLab**
2. **xeus-cling** - A Jupyter kernel for C++

### Installation Instructions

#### Option 1: Using Conda (Recommended)

```bash
# Create a new conda environment
conda create -n lab-cpp python=3.9

# Activate the environment
conda activate lab-cpp

# Install Jupyter and the C++ kernel
conda install -c conda-forge notebook
conda install -c conda-forge xeus-cling

# Start Jupyter Notebook
jupyter notebook
```

#### Option 2: Using pip (for Jupyter only, then conda for kernel)

```bash
# Install Jupyter
pip install notebook

# Install xeus-cling using conda
conda install -c conda-forge xeus-cling

# Start Jupyter Notebook
jupyter notebook
```

### How to Start

1. **Starting Jupyter Notebook**: Run `jupyter notebook` in your terminal
2. **Opening the starter notebook**: In the Jupyter interface, click on `starter_notebook.ipynb`
3. **Creating a new C++ notebook**: Click "New" → Select one of:
   - **C++11** - For C++11 standard
   - **C++14** - For C++14 standard (recommended)
   - **C++17** - For C++17 standard

### Files in this Repository

- **starter_notebook.ipynb** - A starter Jupyter notebook with C++ examples to help you get started
- **README.md** - This file with setup instructions

### Quick Start Example

Once you have Jupyter running with xeus-cling:

```cpp
#include <iostream>

int main() {
    std::cout << "Hello, Computational Laboratory!" << std::endl;
    return 0;
}
```

### Troubleshooting

- If you don't see C++ kernels in Jupyter, make sure xeus-cling is installed: `conda list xeus-cling`
- If Jupyter doesn't start, check that it's installed: `pip list | grep notebook` or `conda list jupyter`
- Make sure you're in the correct conda environment if using conda

### Additional Resources

- [xeus-cling Documentation](https://xeus-cling.readthedocs.io/)
- [Jupyter Notebook Documentation](https://jupyter-notebook.readthedocs.io/)
- [C++ Reference](https://en.cppreference.com/)