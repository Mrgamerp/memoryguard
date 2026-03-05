# Contributing to MemoryGuard

Thank you for your interest in contributing to MemoryGuard! 🎉

## Getting Started

1. Fork the repository
2. Clone your fork
3. Install in development mode:
   ```bash
   pip install -e ".[dev]"
   ```

## Development Workflow

### Running Tests

```bash
# All tests
make test

# With coverage
make test-coverage

# Specific test
pytest tests/test_memoryguard.py::TestMemoryGuard::test_memory_check -v
```

### Code Style

We use:
- **black** for formatting
- **flake8** for linting
- **mypy** for type checking

```bash
# Format code
make format

# Check style
make lint
```

### Before Submitting

1. Run all tests
2. Run linters
3. Update documentation if needed
4. Add tests for new features

## Pull Request Process

1. Create a feature branch
2. Make your changes
3. Add tests
4. Update README if needed
5. Submit PR with clear description

## Code Guidelines

- Follow PEP 8
- Add type hints
- Write docstrings
- Keep functions focused
- Add tests for new features

## Reporting Issues

When reporting bugs, please include:
- Python version
- Operating system
- Steps to reproduce
- Expected vs actual behavior

## Questions?

Open an issue or discussion - we're happy to help!
