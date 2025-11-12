# findcmd

A powerful command-line tool to quickly search and retrieve commands from your shell history. Never scroll through your history again!

## Quick Start

```bash
# Install
git clone https://github.com/abhijitkrm/findcmd.git ~/find-cmd && cd ~/find-cmd && ./install.sh

# Use
findcmd docker              # Find docker commands
findcmd -i git              # Interactive mode
```

## Features

- **Fast Search**: Quickly find commands by keywords
- **Multi-term Search**: Search for commands containing multiple keywords
- **Interactive Mode**: Select and copy commands to clipboard
- **Smart Filtering**: Automatically removes duplicate commands
- **Case-Insensitive**: Default case-insensitive search (with case-sensitive option)
- **Color Output**: Easy-to-read colored output
- **Cross-Platform**: Works on Linux and macOS
- **Multi-Shell Support**: Compatible with Bash and Zsh

## Table of Contents

- [Installation](#installation)
  - [Quick Install](#quick-install)
  - [Manual Install](#manual-install)
  - [Verify Installation](#verify-installation)
- [Usage](#usage)
  - [Basic Search](#basic-search)
  - [Advanced Options](#advanced-options)
  - [Interactive Mode](#interactive-mode)
- [Examples](#examples)
- [Configuration](#configuration)
- [Uninstallation](#uninstallation)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)

## Installation

### Prerequisites

- **Operating System**: Linux or macOS
- **Shell**: Bash or Zsh
- **Tools**: Standard Unix tools (grep, sed)

### Quick Install

1. **Clone or download this repository**:
   ```bash
   cd ~
   git clone https://github.com/abhijitkrm/findcmd.git find-cmd
   # OR download and extract the ZIP file
   ```

2. **Run the installation script** (IMPORTANT: use `./` prefix):
   ```bash
   cd find-cmd
   chmod +x install.sh
   ./install.sh
   ```

   **Note**: Always use `./install.sh`, NOT `sh install.sh` or `bash install.sh`

3. **Reload your shell configuration** (or open a new terminal):
   ```bash
   # For Bash
   source ~/.bashrc

   # For Zsh
   source ~/.zshrc
   ```

4. **Verify installation**:
   ```bash
   findcmd --version
   ```

   If you see "findcmd version 1.0.1", you're all set!

### Manual Install

If you prefer to install manually:

1. **Copy the script to a directory in your PATH**:
   ```bash
   mkdir -p ~/.local/bin
   cp findcmd ~/.local/bin/
   chmod +x ~/.local/bin/findcmd
   ```

2. **Add `~/.local/bin` to your PATH** (if not already):

   **For Bash** - Add to `~/.bashrc`:
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

   **For Zsh** - Add to `~/.zshrc`:
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

3. **Reload your shell configuration**:
   ```bash
   source ~/.bashrc  # or source ~/.zshrc
   ```

### Verify Installation

After installation, verify that `findcmd` is working:

```bash
findcmd --version
findcmd --help
```

## Usage

### Basic Syntax

```bash
findcmd [OPTIONS] <search_term> [additional_terms...]
```

### Basic Search

Search for commands containing a specific keyword:

```bash
findcmd docker
```

This will display all commands from your history that contain "docker".

### Advanced Options

| Option | Description | Example |
|--------|-------------|---------|
| `-c, --case-sensitive` | Enable case-sensitive search | `findcmd -c Redis` |
| `-n, --max <number>` | Limit number of results | `findcmd -n 10 git` |
| `-d, --duplicates` | Show duplicate commands | `findcmd -d npm install` |
| `-i, --interactive` | Interactive mode (select and copy) | `findcmd -i docker` |
| `-h, --help` | Show help message | `findcmd --help` |
| `-v, --version` | Show version | `findcmd --version` |

### Interactive Mode

Interactive mode allows you to select a command and copy it to your clipboard:

```bash
findcmd -i docker
```

Output:
```
Found 15 command(s) matching: docker

[1] docker ps -a
[2] docker build -t myapp .
[3] docker-compose up -d
...

Enter number to copy to clipboard (or press Enter to cancel): 2
✓ Copied to clipboard: docker build -t myapp .
```

## Examples

### Example 1: Simple Search

Find all Git commands:
```bash
findcmd git
```

### Example 2: Multi-term Search

Find commands with both "docker" AND "compose":
```bash
findcmd docker compose
```

### Example 3: Case-Sensitive Search

Search for exact case matches:
```bash
findcmd -c Dockerfile
```

### Example 4: Limit Results

Show only the 5 most recent npm commands:
```bash
findcmd -n 5 npm
```

### Example 5: Interactive Selection

Browse and copy a command:
```bash
findcmd -i kubectl
```

### Example 6: Show Duplicates

Include duplicate commands in results:
```bash
findcmd -d cd
```

### Example 7: Complex Search

Find recent Redis commands, limit to 10:
```bash
findcmd -n 10 redis-cli
```

## Common Use Cases

### Find Database Commands

```bash
findcmd postgres
findcmd mysql
findcmd mongodb
```

### Find Docker Commands

```bash
findcmd docker
findcmd docker-compose
findcmd docker build
```

### Find Git Commands

```bash
findcmd git commit
findcmd git push
findcmd git rebase
```

### Find SSH/Server Commands

```bash
findcmd ssh
findcmd scp
findcmd rsync
```

### Find Package Manager Commands

```bash
findcmd npm install
findcmd pip install
findcmd brew install
```

## Configuration

### History File Location

`findcmd` automatically detects your shell's history file:

- **Bash**: `~/.bash_history`
- **Zsh**: `~/.zsh_history` or `~/.histfile`

### Increasing History Size

To get more results, increase your shell's history size:

**For Bash** - Add to `~/.bashrc`:
```bash
export HISTSIZE=10000
export HISTFILESIZE=20000
```

**For Zsh** - Add to `~/.zshrc`:
```bash
export HISTSIZE=10000
export SAVEHIST=10000
```

### Clipboard Support

For interactive mode clipboard functionality:

- **macOS**: Uses `pbcopy` (built-in)
- **Linux**: Requires `xclip` or `xsel`

Install clipboard tools on Linux:
```bash
# Ubuntu/Debian
sudo apt-get install xclip

# Fedora/RHEL
sudo dnf install xclip

# Arch
sudo pacman -S xclip
```

## Uninstallation

To remove `findcmd` from your system:

```bash
cd find-cmd
./uninstall.sh
```

The uninstall script will:
1. Remove the `findcmd` binary
2. Optionally remove PATH configuration from shell config files
3. Create backups of modified files

## Troubleshooting

### Issue: Command not found after installation

**Solution 1**: Reload your shell configuration
```bash
source ~/.bashrc  # or source ~/.zshrc
```

**Solution 2**: Open a new terminal window

**Solution 3**: Manually verify installation
```bash
# Check if findcmd exists
ls -lh ~/.local/bin/findcmd

# Check if .local/bin is in PATH
echo $PATH | grep ".local/bin"
```

**Solution 4**: Manually add to PATH

If `~/.local/bin` is not in your PATH, add it manually:

For **Zsh** users:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

For **Bash** users:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Then verify:
```bash
findcmd --version
```

### Issue: Installer says "Unknown shell" or PATH not configured

This happens when the installer cannot auto-detect your shell. This is not a problem - just follow the manual PATH setup above.

**Why it happens**:
- Running installer with `sh install.sh` instead of `./install.sh`
- Using a non-standard shell
- Shell environment variables not properly set

**Solution**: Follow Solution 4 above to manually add to PATH.

### Issue: No results found

**Possible causes**:
1. Command doesn't exist in history
2. History file is empty or not found
3. Search term is too specific

**Solutions**:
- Check your history file: `cat ~/.bash_history` or `cat ~/.zsh_history`
- Try a broader search term
- Make sure commands are being saved to history

### Issue: History file not found

**Solution**: Verify your shell's history configuration
```bash
# Check HISTFILE variable
echo $HISTFILE

# For Bash, ensure this is set
echo $HISTFILE
# Should output: /home/username/.bash_history

# For Zsh, ensure history is enabled
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
```

### Issue: Interactive mode clipboard not working

**On Linux**: Install clipboard utility
```bash
sudo apt-get install xclip
# or
sudo apt-get install xsel
```

**On macOS**: Should work out of the box with `pbcopy`

### Issue: Permission denied

**Solution**: Ensure the script is executable
```bash
chmod +x ~/.local/bin/findcmd
```

## FAQ

### Q: Does this modify my command history?
**A**: No, `findcmd` only reads your history file. It never modifies or deletes anything.

### Q: Can I search for commands with special characters?
**A**: Yes, but some special characters may need escaping. Try using quotes:
```bash
findcmd "docker run -p 8080:80"
```

### Q: How many results are shown by default?
**A**: By default, `findcmd` shows up to 50 results. Use `-n` to change this:
```bash
findcmd -n 100 git
```

### Q: Are searches case-sensitive?
**A**: By default, searches are case-insensitive. Use `-c` for case-sensitive search:
```bash
findcmd -c Redis
```

### Q: Can I use regular expressions?
**A**: Currently, `findcmd` uses simple substring matching. Regular expression support may be added in future versions.

### Q: Does it work with Fish shell?
**A**: Currently, `findcmd` supports Bash and Zsh. Fish shell support may be added in the future.

### Q: How do I search for multiple terms?
**A**: Just add multiple terms separated by spaces:
```bash
findcmd docker nginx proxy
```
This finds commands containing all three terms.

### Q: Can I create an alias for common searches?
**A**: Yes! Add aliases to your shell configuration:
```bash
alias fgit="findcmd -i git"
alias fdocker="findcmd -i docker"
alias fnpm="findcmd -i npm"
```

## Advanced Tips

### Create Useful Aliases

Add these to your `~/.bashrc` or `~/.zshrc`:

```bash
# Interactive search aliases
alias fcd="findcmd -i cd"
alias fgit="findcmd -i git"
alias fdocker="findcmd -i docker"
alias fssh="findcmd -i ssh"

# Quick searches
alias fcmd="findcmd -i"  # Generic interactive search
alias flast="findcmd -n 20"  # Last 20 matching commands
```

### Combine with Other Tools

Use `findcmd` output with other commands:

```bash
# Count matching commands
findcmd docker | wc -l

# Save results to a file
findcmd git > my-git-commands.txt
```

### Integration with fzf

For even more powerful searching, combine with `fzf`:

```bash
findcmd git | fzf
```

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

## License

MIT License - feel free to use and modify as needed.

## Author

Created to make command-line history searching easier and more efficient.



