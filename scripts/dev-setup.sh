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

# Function to install packages with confirmation
install_packages() {
    local description=$1
    shift
    local packages=("$@")
    
    read -p "Would you like to install $description? [y/N] " choice
    if [[ $choice =~ ^[Yy]$ ]]; then
        echo "Installing $description..."
        sudo pacman -S --needed --noconfirm "${packages[@]}"
        return 0
    fi
    return 1
}

# NeoVim setup
install_packages "NeoVim and its dependencies" \
    neovim \
    tree-sitter \
    ripgrep \
    python3 \
    lazygit \
    bottom \
    fzf

# C++ development
install_packages "C++ development tools" \
    gcc \
    clang \
    lldb \
    cmake \
    ninja \
    meson \
    gdb \
    valgrind

# Rust development
if install_packages "Rust development tools" rustup; then
    echo "Setting up Rust..."
    rustup default stable
    rustup component add rust-analyzer
    cargo install cargo-edit cargo-watch cargo-audit
fi

# JavaScript/TypeScript development
install_packages "JavaScript/TypeScript development tools" \
    nodejs \
    npm

# Docker and container tools
install_packages "Docker and container tools" \
    docker \
    docker-compose \
    podman \
    buildah \
    skopeo \
    distrobox

# Python development
install_packages "Python development tools" \
    python3 \
    python-pip

# ZShell setup
if install_packages "ZShell and its enhancements" \
    zsh \
    starship \
    zellij; then
    # Set ZShell as default shell if it's not already
    if [ "$SHELL" != "$(which zsh)" ]; then
        read -p "Would you like to set ZShell as your default shell? [y/N] " choice
        if [[ $choice =~ ^[Yy]$ ]]; then
            chsh -s "$(which zsh)"
        fi
    fi
fi

# File manager
install_packages "Yazi file manager" yazi

# Create .config directory if it doesn't exist
echo "Setting up development environment..."
mkdir -p ~/.config

# Initialize and update git submodules
echo "Initializing git submodules..."
git submodule update --init --recursive

# Apply configurations
echo "Applying configurations..."
cd packages
stow --target=$HOME --restow dev

echo "Development environment setup complete!" 