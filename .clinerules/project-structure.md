# Project Structure

## Directory Layout
```
python-boilerplate/
├── src/                    # Source code
│   ├── __init__.py
│   ├── cli.py             # CLI interface entry point
│   └── core/              # Core business logic
│       ├── __init__.py
│       ├── config.py      # Configuration management
│       ├── logger.py      # Logging setup
│       └── main.py        # Main application logic
├── tests/                 # Test files
│   ├── __init__.py
│   ├── test_cli.py       # CLI tests
│   └── core/             # Core module tests
│       ├── __init__.py
│       ├── test_config.py
│       ├── test_logger.py
│       └── test_main.py
├── .clinerules/          # Cline AI rules
├── .claude/              # Claude AI knowledge base
├── Dockerfile            # Container definition
├── docker-compose.yml    # Multi-container setup
├── pyproject.toml        # Project configuration
├── ruff.toml            # Linter configuration
├── pyrightconfig.json    # Type checker config
└── uv.lock              # Dependency lock file
```

## File Organization Rules
- Keep source code in `src/` directory
- Mirror source structure in `tests/`
- Use `__init__.py` in all Python packages
- Group related functionality in subdirectories
- Keep configuration files in project root

## Naming Conventions
- Use lowercase with underscores for modules
- Use PascalCase for classes
- Use lowercase_with_underscores for functions
- Use UPPERCASE for constants