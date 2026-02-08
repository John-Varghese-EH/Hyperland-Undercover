# Contributing to Hyprland Undercover

Thank you for your interest in contributing to Hyprland Undercover! 🎉

## How to Contribute

### Reporting Bugs

1. Search existing issues to avoid duplicates
2. Use a clear, descriptive title
3. Include:
   - Your Linux distribution and version
   - Hyprland version (`hyprctl version`)
   - Steps to reproduce
   - Expected vs actual behavior
   - Relevant logs or screenshots

### Suggesting Features

1. Check if the feature is already requested
2. Describe the use case clearly
3. Explain why this would benefit other users

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test thoroughly on your Hyprland setup
5. Commit with clear messages
6. Push and create a Pull Request

### Code Style

- **Bash scripts**: Use `[[ ]]` for conditionals, `set -euo pipefail`
- **Python**: Follow PEP 8, use type hints where appropriate
- **CSS/Rasi**: Use consistent indentation (4 spaces)

### Testing

Before submitting:
- Run `shellcheck scripts/*` for shell script linting
- Run `python3 -m py_compile scripts/hyprland-undercover-settings`
- Test toggle functionality on a real Hyprland setup

## Development Setup

```bash
git clone https://github.com/John-Varghese-EH/Hyprland-Undercover.git
cd Hyprland-Undercover
./scripts/hyprland-undercover-setup
```

## Questions?

Open an issue or reach out to the maintainer:
- GitHub: [@John-Varghese-EH](https://github.com/John-Varghese-EH)
- Instagram: [@cyber__trinity](https://instagram.com/cyber__trinity)

---

Thank you for contributing! ❤️
