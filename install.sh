#!/usr/bin/env bash

# findcmd Installation Script
# Installs findcmd command-line tool for searching shell history

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

# Installation directory
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="findcmd"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BOLD}findcmd Installation Script${NC}\n"

# Check if script exists
if [[ ! -f "$SCRIPT_DIR/$SCRIPT_NAME" ]]; then
    echo -e "${RED}Error: $SCRIPT_NAME not found in $SCRIPT_DIR${NC}"
    exit 1
fi

# Create installation directory if it doesn't exist
if [[ ! -d "$INSTALL_DIR" ]]; then
    echo -e "${BLUE}Creating installation directory: $INSTALL_DIR${NC}"
    mkdir -p "$INSTALL_DIR"
fi

# Copy script to installation directory
echo -e "${BLUE}Installing $SCRIPT_NAME to $INSTALL_DIR${NC}"
cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Function to add to PATH in shell config
add_to_path() {
    local shell_config="$1"
    local export_line='export PATH="$HOME/.local/bin:$PATH"'

    if [[ -f "$shell_config" ]]; then
        # Check if already in PATH
        if grep -q "\.local/bin.*PATH" "$shell_config"; then
            echo -e "${YELLOW}PATH already configured in $shell_config${NC}"
            return 0
        fi

        echo -e "${BLUE}Adding $INSTALL_DIR to PATH in $shell_config${NC}"
        echo "" >> "$shell_config"
        echo "# Added by findcmd installer" >> "$shell_config"
        echo "$export_line" >> "$shell_config"
        return 0
    fi
    return 1
}

# Detect shell and update configuration
# Try multiple methods to detect the shell
SHELL_NAME=""
PATH_ADDED=false

# Method 1: Check $SHELL variable
if [[ -n "$SHELL" ]]; then
    SHELL_NAME=$(basename "$SHELL")
fi

# Method 2: Check parent process if $SHELL is unreliable
if [[ -z "$SHELL_NAME" ]] || [[ "$SHELL_NAME" == "sh" ]]; then
    PARENT_PROC=$(ps -p $PPID -o comm=)
    if [[ -n "$PARENT_PROC" ]]; then
        SHELL_NAME=$(basename "$PARENT_PROC")
    fi
fi

# Method 3: Check which config files exist
if [[ "$SHELL_NAME" == "sh" ]] || [[ -z "$SHELL_NAME" ]]; then
    if [[ -f "$HOME/.zshrc" ]]; then
        SHELL_NAME="zsh"
    elif [[ -f "$HOME/.bashrc" ]]; then
        SHELL_NAME="bash"
    fi
fi

# Apply configuration based on detected shell
case "$SHELL_NAME" in
    bash)
        echo -e "${BLUE}Detected Bash shell${NC}"
        if [[ -f "$HOME/.bashrc" ]]; then
            add_to_path "$HOME/.bashrc"
            PATH_ADDED=true
        elif [[ -f "$HOME/.bash_profile" ]]; then
            add_to_path "$HOME/.bash_profile"
            PATH_ADDED=true
        fi
        ;;
    zsh)
        echo -e "${BLUE}Detected Zsh shell${NC}"
        if [[ -f "$HOME/.zshrc" ]]; then
            add_to_path "$HOME/.zshrc"
            PATH_ADDED=true
        fi
        ;;
    *)
        echo -e "${YELLOW}Could not auto-detect shell (detected: ${SHELL_NAME})${NC}"
        echo -e "${YELLOW}Will provide manual instructions below.${NC}"
        ;;
esac

# Check if .local/bin is in PATH
if [[ ":$PATH:" == *":$HOME/.local/bin:"* ]] || [[ ":$PATH:" == *":$INSTALL_DIR:"* ]]; then
    echo -e "${GREEN}✓ $INSTALL_DIR is already in your PATH${NC}"
else
    if [[ "$PATH_ADDED" == false ]]; then
        echo -e "${YELLOW}⚠ Warning: $INSTALL_DIR is not in your PATH${NC}"
        echo -e "${YELLOW}Please manually add the following line to your shell configuration file:${NC}\n"
        echo -e "${BOLD}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}\n"

        # Suggest configuration files based on what exists
        if [[ -f "$HOME/.zshrc" ]]; then
            echo -e "For Zsh, run:"
            echo -e "  ${BOLD}echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc${NC}"
            echo -e "  ${BOLD}source ~/.zshrc${NC}\n"
        fi

        if [[ -f "$HOME/.bashrc" ]]; then
            echo -e "For Bash, run:"
            echo -e "  ${BOLD}echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc${NC}"
            echo -e "  ${BOLD}source ~/.bashrc${NC}\n"
        fi

        if [[ -f "$HOME/.bash_profile" ]]; then
            echo -e "Or for Bash Profile, run:"
            echo -e "  ${BOLD}echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bash_profile${NC}"
            echo -e "  ${BOLD}source ~/.bash_profile${NC}\n"
        fi
    fi
fi

echo ""
echo -e "${GREEN}${BOLD}Installation complete!${NC}\n"

# Test if findcmd is accessible
if command -v findcmd &> /dev/null; then
    echo -e "${GREEN}✓ findcmd is ready to use!${NC}"
    echo -e "Run ${CYAN}findcmd --help${NC} to get started\n"
else
    echo -e "${YELLOW}To use findcmd immediately, run:${NC}"
    echo -e "${BOLD}  source ~/.bashrc${NC}  (for Bash)"
    echo -e "${BOLD}  source ~/.zshrc${NC}  (for Zsh)"
    echo -e "\nOr open a new terminal session\n"
fi

# Show quick examples
echo -e "${BOLD}Quick Examples:${NC}"
echo -e "  ${CYAN}findcmd docker${NC}          - Find all commands with 'docker'"
echo -e "  ${CYAN}findcmd -i git${NC}          - Interactive mode to select a command"
echo -e "  ${CYAN}findcmd git commit${NC}      - Find commands with both 'git' and 'commit'"
echo -e "  ${CYAN}findcmd -n 10 npm${NC}       - Show only 10 most recent npm commands"
echo ""
echo -e "For more information, run: ${CYAN}findcmd --help${NC}"
