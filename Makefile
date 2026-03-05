.PHONY: help install install-dev test test-coverage lint format clean build publish

help:
	@echo "MemoryGuard - Available Commands:"
	@echo ""
	@echo "  install        Install package"
	@echo "  install-dev    Install with dev dependencies"
	@echo "  test           Run tests"
	@echo "  test-coverage  Run tests with coverage"
	@echo "  lint           Run linters"
	@echo "  format         Format code with black"
	@echo "  clean          Clean build artifacts"
	@echo "  build          Build package"
	@echo "  publish        Publish to PyPI"
	@echo "  demo           Run demo"

install:
	pip install -e .

install-dev:
	pip install -e ".[dev]"
	pip install -e ".[dashboard]"

test:
	pytest tests/ -v

test-coverage:
	pytest tests/ --cov=memoryguard --cov-report=term-missing

lint:
	flake8 memoryguard/ tests/
	mypy memoryguard/

format:
	black memoryguard/ tests/ examples/
	isort memoryguard/ tests/ examples/

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

build: clean
	python -m build

publish: build
	twine check dist/*
	twine upload dist/*

demo:
	python examples/demo.py
