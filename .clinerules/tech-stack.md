# Technology Stack Rules

## Core Technologies
- **Python**: Use version 3.11 or higher
- **Package Manager**: Always use `uv` for dependency management
- **Linter/Formatter**: Use Ruff for both linting and formatting
- **Type Checker**: Use Pyright in strict mode
- **Test Framework**: Use pytest for all testing
- **Containerization**: Docker and Docker Compose for deployment

## Tool Usage Rules
- Never use pip directly, always use uv commands
- Run `uv sync` to install dependencies
- Use `uv add` to add new packages
- Always run type checking with `uv run pyright`
- Format code with `uv run ruff format .`
- Check code quality with `uv run ruff check .`

## Virtual Environment
- Virtual environment is located in `myenv/` directory
- Do not commit the virtual environment to git