# Python Programming Examples

This directory contains Python programs for the Computational Physics Laboratory course.

## Setup

1. Create a virtual environment (recommended):
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install required packages:
```bash
pip install numpy scipy matplotlib
```

## Running Programs

```bash
python script_name.py
```

## Example Programs

- `template.py` - Basic template for Python scripts

## Tips

1. Use NumPy for numerical computations (vectorized operations are faster)
2. Use Matplotlib for plotting and visualization
3. Document functions with docstrings
4. Follow PEP 8 style guidelines
5. Use meaningful variable names

## Common Libraries

- `numpy` - Numerical computing (arrays, linear algebra, FFT)
- `scipy` - Scientific computing (optimization, integration, interpolation)
- `matplotlib` - Plotting and visualization
- `pandas` - Data analysis (optional)

## Example: Quick Plot

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2*np.pi, 100)
y = np.sin(x)

plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('sin(x)')
plt.title('Sine Function')
plt.grid(True)
plt.show()
```
