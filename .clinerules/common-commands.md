# Common Commands

## Dependency Management
```bash
# Install all dependencies
uv sync

# Add a new dependency
uv add <package-name>

# Add a development dependency
uv add --dev <package-name>
```

## Code Quality
```bash
# Run linter
uv run ruff check .

# Auto-fix linting issues
uv run ruff check . --fix

# Format code
uv run ruff format .

# Type checking
uv run pyright
```

## Testing
```bash
# Run all tests
uv run pytest

# Run tests with coverage
uv run pytest --cov=src

# Run specific test file
uv run pytest tests/test_specific.py

# Run tests with verbose output
uv run pytest -v
```

## Application
```bash
# Run the application
uv run python -m src.cli

# Run with environment variables
ENV_VAR=value uv run python -m src.cli
```

## Docker
```bash
# Build container
docker-compose build

# Run services
docker-compose up

# Run in background
docker-compose up -d

# View logs
docker-compose logs -f
```