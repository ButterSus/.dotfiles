#!/usr/bin/env bash

# This script by design should be able to be run multiple times
# without issue. It also doesn't uninstall any existing packages,
# it only installs what is missing.

#####################################
# Arch Linux Package Install Script #
#####################################

# Function to handle Ctrl+C
cleanup() {
    echo -e "\nInstallation aborted by user"
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

# Basic CLI utilities that are essential for comfortable system usage
ESSENTIAL_PACKAGES=(
    # Core utilities
    'man-db' 'man-pages' 'texinfo' 'vi' 'vim' 'nano' 'git' 'sudo' 'tree' 'less'
    'curl' 'openssh' 'rsync' 'grub' 'arch-install-scripts' 'fastfetch' 'zsh'
    'fzf' 'zip' 'unzip' 'wget' 'which' 'sed' 'gzip' 'archlinux-keyring' 'stow'
    
    # Additional useful tools
    'tmux' 'ripgrep' 'btop'
)

echo "Installing essential CLI utilities..."
sudo pacman -S --needed "${ESSENTIAL_PACKAGES[@]}"

# Ask about base-devel
read -p "Do you need base-devel? [Y/n] " base_devel
if [[ $base_devel =~ ^[Nn]$ ]]; then
    echo "Skipping base-devel installation"
else
    echo "Installing base-devel..."
    sudo pacman -S --needed base-devel
fi

# Ask about cmake
read -p "Do you need cmake? [y/N] " cmake
if [[ $cmake =~ ^[Yy]$ ]]; then
    echo "Installing cmake..."
    sudo pacman -S --needed cmake
fi

# Clear unused package caches
read -p "Would you like to clear unused package caches? [y/N] " clear_cache
if [[ $clear_cache =~ ^[Yy]$ ]]; then
    echo "Clearing package caches..."
    sudo pacman -Sc --noconfirm
    if command -v paccache &> /dev/null; then
        paccache -r
    fi
fi

# Ask about adding the 'archlinuxcn' repository
echo "Please make sure you have archlinuxcn installed if you want to have yay installed."
read -p "Would you like to add the 'archlinuxcn' repository? [y/N] " add_archlinuxcn
if [[ $add_archlinuxcn =~ ^[Yy]$ ]]; then
    echo "Adding 'archlinuxcn' repository..."
    if ! grep -q "archlinuxcn" /etc/pacman.conf; then
        echo -e "\n[archlinuxcn]\nServer = https://repo.archlinuxcn.org/\$arch" | sudo tee -a /etc/pacman.conf
        sudo pacman -Sy && sudo pacman -S --needed archlinuxcn-keyring
    else
        echo "archlinuxcn repository is already configured."
    fi
fi

# Ask about installing yay if archlinuxcn is present
if grep -q "archlinuxcn" /etc/pacman.conf; then
    read -p "Would you like to install yay? [y/N] " install_yay
    if [[ $install_yay =~ ^[Yy]$ ]]; then
        echo "Installing yay..."
        sudo pacman -S --needed yay
    fi
fi

echo "Finished installing packages."
