# Contributing to docker-run-action

Thank you for your interest in contributing to this project! We welcome contributions from the community.

## How to Contribute

### Reporting Bugs

If you find a bug, please report it by opening an issue on [GitHub Issues](https://github.com/tenstorrent/docker-run-action/issues). Include:

- A clear description of the issue
- Steps to reproduce the problem
- Expected behavior vs. actual behavior
- Your environment (OS, Docker version, GitHub Actions runner version)
- Any relevant logs or error messages

### Suggesting Features

Feature requests are welcome! Please open an issue on [GitHub Issues](https://github.com/tenstorrent/docker-run-action/issues) and describe:

- The problem you're trying to solve
- Your proposed solution
- Any alternatives you've considered

### Submitting Pull Requests

We follow a standard pull request process:

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** with clear, descriptive commit messages
3. **Test your changes** thoroughly
4. **Submit a pull request** with a clear description of the changes

#### Pull Request Guidelines

- Pull requests are reviewed on a **weekly basis**
- Ensure your code follows the existing style and conventions
- Update documentation if you're changing functionality
- Add or update tests as appropriate
- Keep pull requests focused - one feature or fix per PR

#### Commit Message Format

- Use clear, descriptive commit messages
- Start with a verb in present tense (e.g., "Add", "Fix", "Update")
- Reference related issues (e.g., "Fixes #123")

### Upstream Contributions

This is a Tenstorrent fork of [addnab/docker-run-action](https://github.com/addnab/docker-run-action). 

- Changes specific to Tenstorrent's use case should be contributed here
- General improvements may be considered for contribution back to the upstream project
- When in doubt, open an issue to discuss whether a change should go upstream

## Code of Conduct

This project adheres to the Contributor Covenant [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to ospo@tenstorrent.com.

## Development Setup

### Prerequisites

- Docker installed locally
- Access to a GitHub Actions environment for testing

### Testing Changes

To test changes to this action:

1. Make your modifications to `Dockerfile`, `entrypoint.sh`, or `action.yml`
2. In a test repository, reference your fork and branch:
   ```yaml
   - uses: your-username/docker-run-action@your-branch
   ```
3. Run the workflow and verify the action behaves as expected

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project:

- Original code: MIT License (see LICENSE file)
- Tenstorrent modifications: Apache License 2.0 (see NOTICE file)

Your contributions to Tenstorrent modifications will be licensed under Apache 2.0.

## Questions?

If you have questions about contributing, please open an issue or contact ospo@tenstorrent.com.

Thank you for contributing!
