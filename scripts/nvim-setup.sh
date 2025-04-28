#!/usr/bin/env bash

# Function to handle Ctrl+C
cleanup() {
    echo -e "\nOperation aborted by user"
    exit 1
}

# Set up trap for Ctrl+C
trap cleanup SIGINT SIGTERM

# Check if running as root, and prompt for password if not
if [ "$EUID" -ne 0 ]; then
    echo "Elevated permissions are required to adjust system settings."
    echo "Please enter your password..."
    sudo -v
    if [ $? -eq 1 ]; then
        echo "Exiting, as not being run as sudo"
        exit 1
    fi
fi

# Check pacman is installed
if ! hash pacman 2> /dev/null; then
    echo "Pacman doesn't seem to be present on your system. Exiting..."
    exit 1
fi

# Update package database
echo "Updating package database..."
sudo pacman -Syy

# Install NeoVim and required packages
echo "Installing NeoVim and development tools..."
sudo pacman -S --needed \
    neovim \
    lazygit \
    bottom \
    nodejs \
    python3 \
    python-pip \
    npm \
    ripgrep \
    fd \
    fzf \
    tree-sitter

# Create .config directory if it doesn't exist
echo "Setting up NeoVim configuration..."
mkdir -p ~/.config

# Initialize and update git submodules
echo "Initializing git submodules..."
git submodule update --init --recursive

# Apply configurations
echo "Applying configurations..."
cd packages
stow --target=$HOME --restow dev

echo "NeoVim setup complete!" 