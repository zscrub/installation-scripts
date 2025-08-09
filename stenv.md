# Python Virtual Environment Manager

This bash script provides convenient functions for managing Python virtual environments in your projects.

## Usage

### Direct execution:
```bash
source your_script.sh
start_env
```

### Recommended: Add as bash alias
Add this line to your `~/.bashrc` or `~/.bash_profile`:
```bash
alias venv='source /path/to/your/script.sh && start_env'
```

Then reload your shell or run `source ~/.bashrc`, and you can simply use:
```bash
venv
```

## What it does
1. Checks current directory for existing virtual environments (`.venv` or `venv`)
2. Activates found environments automatically
3. If none exist, offers to create a new `.venv` environment
4. Provides clear feedback with emojis for better UX
5. Handles user input validation for environment creation prompts

Perfect for Python developers who work across multiple projects and want a single command to handle virtual environment management.
