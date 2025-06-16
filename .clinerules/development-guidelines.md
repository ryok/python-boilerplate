# Development Guidelines

## Code Style
- Follow PEP 8 standards (automatically checked by Ruff)
- Use meaningful variable and function names
- Keep functions small and focused
- Avoid deep nesting

## Type Hints
- ALL functions must have type hints
- Use proper type annotations for parameters and return values
- Import types from typing module when needed
- Pyright runs in strict mode - fix all type errors

## Testing
- Write unit tests for all new features
- Test files go in the tests/ directory
- Mirror the source structure in tests
- Run tests with `uv run pytest`
- Aim for high test coverage

## Documentation
- Use docstrings for all functions and classes
- Follow Google or NumPy docstring style
- Keep docstrings concise but informative
- Update documentation when changing functionality

## Code Quality
- No commented-out code in commits
- Remove debug print statements
- Handle exceptions appropriately
- Use logging instead of print statements