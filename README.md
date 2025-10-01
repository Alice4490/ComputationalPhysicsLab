# Computational Physics Laboratory

This repository contains code and exercises for the Computational Physics Laboratory course.

## Repository Structure

```
labComputazionale/
├── C/              # C programming projects and exercises
├── Python/         # Python programming projects and exercises
└── docs/           # Documentation and notes
```

## Programming Languages

This course uses both C and Python for computational physics simulations and analysis:

- **C**: For performance-critical numerical simulations
- **Python**: For data analysis, visualization, and rapid prototyping

## Getting Started

### C Development

#### Prerequisites
- GCC compiler (or any C compiler)
- Make (optional, for build automation)

#### Compiling C Programs
```bash
cd C
gcc -o program_name source_file.c -lm
./program_name
```

For programs with mathematical functions, use the `-lm` flag to link the math library.

### Python Development

#### Prerequisites
- Python 3.7 or higher
- pip (Python package manager)

#### Setting Up Python Environment
```bash
# Create a virtual environment (recommended)
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install common scientific packages
pip install numpy scipy matplotlib
```

#### Running Python Programs
```bash
cd Python
python script_name.py
```

## Common Tasks

### Numerical Integration
- Trapezoidal rule
- Simpson's rule
- Monte Carlo methods

### Differential Equations
- Euler method
- Runge-Kutta methods
- Finite difference methods

### Data Analysis
- Statistical analysis
- Curve fitting
- Error analysis

### Visualization
- Plotting data with matplotlib (Python)
- Gnuplot integration (C)

## Best Practices

1. **Version Control**: Commit regularly with meaningful messages
2. **Documentation**: Comment your code and document algorithms
3. **Testing**: Validate numerical results against known solutions
4. **Performance**: Profile code and optimize bottlenecks
5. **Reproducibility**: Set random seeds for Monte Carlo simulations

## Resources

- Course materials and lecture notes in `docs/`
- Example code in respective language directories
- External resources: NumPy documentation, C reference guides

## License

This repository is for educational purposes.