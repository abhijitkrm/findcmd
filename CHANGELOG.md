# Changelog

All notable changes to the findcmd project will be documented in this file.

## [1.0.1] - 2024-11-12

### Fixed
- **Improved shell detection in installer**: Added multiple fallback methods to detect the user's shell
  - Now tries `$SHELL` variable first
  - Falls back to checking parent process if `$SHELL` is unreliable
  - Falls back to detecting which config files exist (.zshrc, .bashrc)
  - Prevents "Unknown shell: sh" error when installer is run in different contexts

### Improved
- **Better error messages**: Installer now provides exact commands to manually add PATH if auto-detection fails
- **Installation documentation**: Added clearer instructions emphasizing the use of `./install.sh` instead of `sh install.sh`
- **Troubleshooting guide**: Added dedicated section for "Unknown shell" and PATH configuration issues

### Changed
- Installer now shows specific copy-paste commands for adding PATH based on detected config files
- More informative messages when shell auto-detection fails

## [1.0.0] - 2024-11-12

### Added
- Initial release of findcmd
- Basic search functionality for command history
- Interactive mode with clipboard support
- Multi-term search capability
- Case-sensitive search option
- Duplicate filtering
- Color-coded output
- Support for Bash and Zsh shells
- Support for Linux and macOS
- Automatic installation script
- Uninstallation script
- Comprehensive documentation
  - README.md with full documentation
  - EXAMPLES.md with real-world usage examples
  - QUICKSTART.md for quick setup
  - LICENSE (MIT)
- Command-line options:
  - `-c, --case-sensitive`: Enable case-sensitive search
  - `-n, --max <number>`: Limit number of results
  - `-d, --duplicates`: Show duplicate commands
  - `-i, --interactive`: Interactive mode with selection
  - `-h, --help`: Display help message
  - `-v, --version`: Display version

### Features
- Automatically detects shell history file location
- Removes duplicate commands by default
- Shows most recent matches first
- Clean, numbered output format
- Clipboard integration (pbcopy, xclip, xsel)
- Cross-platform compatibility
