#!/usr/bin/env bash

# findcmd Uninstallation Script
# Removes findcmd command-line tool

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

echo -e "${BOLD}findcmd Uninstallation Script${NC}\n"

# Check if findcmd is installed
if [[ ! -f "$INSTALL_DIR/$SCRIPT_NAME" ]]; then
    echo -e "${YELLOW}$SCRIPT_NAME is not installed in $INSTALL_DIR${NC}"
    echo -e "Nothing to uninstall."
    exit 0
fi

# Remove the script
echo -e "${BLUE}Removing $SCRIPT_NAME from $INSTALL_DIR${NC}"
rm -f "$INSTALL_DIR/$SCRIPT_NAME"

if [[ ! -f "$INSTALL_DIR/$SCRIPT_NAME" ]]; then
    echo -e "${GREEN}✓ $SCRIPT_NAME successfully removed${NC}"
else
    echo -e "${RED}Failed to remove $SCRIPT_NAME${NC}"
    exit 1
fi

# Ask about removing PATH configuration
echo ""
echo -e "${YELLOW}Do you want to remove the PATH configuration from your shell config files?${NC}"
echo -e "This will remove the line: ${BOLD}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
echo -e "(y/N): "
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    # Function to remove PATH configuration
    remove_from_config() {
        local config_file="$1"

        if [[ -f "$config_file" ]]; then
            if grep -q "Added by findcmd installer" "$config_file"; then
                echo -e "${BLUE}Removing PATH configuration from $config_file${NC}"

                # Create backup
                cp "$config_file" "${config_file}.backup"

                # Remove the lines (the comment and the export)
                sed -i.tmp '/# Added by findcmd installer/,+1d' "$config_file"
                rm -f "${config_file}.tmp"

                echo -e "${GREEN}✓ Removed from $config_file (backup created at ${config_file}.backup)${NC}"
            fi
        fi
    }

    # Detect shell and clean configuration
    SHELL_NAME=$(basename "$SHELL")

    case "$SHELL_NAME" in
        bash)
            remove_from_config "$HOME/.bashrc"
            remove_from_config "$HOME/.bash_profile"
            ;;
        zsh)
            remove_from_config "$HOME/.zshrc"
            ;;
        *)
            echo -e "${YELLOW}Unknown shell: $SHELL_NAME${NC}"
            echo -e "${YELLOW}Please manually remove PATH configuration if needed${NC}"
            ;;
    esac
else
    echo -e "${BLUE}Keeping PATH configuration${NC}"
fi

echo ""
echo -e "${GREEN}${BOLD}Uninstallation complete!${NC}"
echo ""
echo -e "Thank you for using findcmd!"
