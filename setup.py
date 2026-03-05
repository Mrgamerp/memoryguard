"""
Fallback setup.py for older pip versions.
Modern pip uses pyproject.toml.
"""

from setuptools import setup, find_packages

setup(
    name="memoryguard",
    use_scm_version=True,
    setup_requires=['setuptools_scm'],
    packages=find_packages(),
    python_requires=">=3.8",
)
