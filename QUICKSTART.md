# findcmd Quick Start Guide

Get up and running with `findcmd` in 2 minutes!

## Installation (30 seconds)

```bash
# 1. Clone the repository
git clone https://github.com/abhijitkrm/findcmd.git ~/find-cmd
cd ~/find-cmd

# 2. Run the installer
chmod +x install.sh
./install.sh

# IMPORTANT: Use ./install.sh (NOT sh install.sh)

# 3. Reload your shell (or open a new terminal)
source ~/.bashrc   # For Bash users
source ~/.zshrc    # For Zsh users
```

**If you see "Unknown shell" warning**: No problem! Just manually add to PATH:
```bash
# For Zsh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc

# For Bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

## First Commands (1 minute)

### 1. Verify it works
```bash
findcmd --version
```

### 2. Search for a command
```bash
findcmd docker
```

### 3. Try interactive mode (copy to clipboard)
```bash
findcmd -i git
```

Then enter a number to copy that command!

### 4. Search for multiple terms
```bash
findcmd docker nginx
```

## Most Useful Commands

```bash
# Find any command
findcmd <keyword>

# Interactive mode (select and copy)
findcmd -i <keyword>

# Limit results to 10
findcmd -n 10 <keyword>

# Search for multiple terms
findcmd <term1> <term2>

# Get help
findcmd --help
```

## Create Useful Aliases

Add these to your `~/.bashrc` or `~/.zshrc`:

```bash
alias f="findcmd -i"           # Quick interactive search
alias fgit="findcmd -i git"    # Git commands
alias fdocker="findcmd -i docker"  # Docker commands
```

Then use:
```bash
f redis        # Interactive search for redis
fgit           # Interactive git command search
fdocker        # Interactive docker command search
```

## Common Use Cases

### Find that Docker command you ran last week
```bash
findcmd -i docker build
```

### Find your SSH commands
```bash
findcmd -i ssh
```

### Find database commands
```bash
findcmd -i redis-cli
findcmd -i psql
findcmd -i mysql
```

### Find Git commands
```bash
findcmd -i "git commit"
findcmd -i "git push"
```

## Next Steps

- Read the full [README.md](README.md) for detailed documentation
- Check out [EXAMPLES.md](EXAMPLES.md) for real-world usage examples
- Customize with aliases and shell functions

**That's it! You're ready to never scroll through history again! 🚀**
