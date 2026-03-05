# Quick Start Guide

## Installation

### From PyPI (when published)
```bash
pip install memoryguard
```

### From Source
```bash
git clone https://github.com/YOUR_USERNAME/memoryguard.git
cd memoryguard
pip install -e .
```

### Development Mode
```bash
git clone https://github.com/YOUR_USERNAME/memoryguard.git
cd memoryguard
make install-dev
```

## Usage Examples

### 1. Basic Monitoring
```python
from memoryguard import MemoryGuard

guard = MemoryGuard()
alert = guard.check_memory("my_operation")

if alert:
    print(f"Memory alert: {alert.message}")
```

### 2. Function Tracking
```python
from memoryguard import track_memory

guard = MemoryGuard()

@track_memory("heavy_function", guard)
def heavy_function():
    return sum(i**2 for i in range(1000000))

result = heavy_function()
```

### 3. Context Manager
```python
from memoryguard import memory_context

with memory_context("database_query", guard):
    data = fetch_large_dataset()
    process(data)
```

### 4. Live Dashboard
```python
from memoryguard import MemoryDashboard

dashboard = MemoryDashboard(guard)

with dashboard.live_display():
    run_long_operation()
```

## Running Tests

```bash
make test
```

## Running Demo

```bash
make demo
```

## Next Steps

- Read the full documentation: [README.md](README.md)
- Check examples: [examples/demo.py](examples/demo.py)
- See API reference in source code docstrings
