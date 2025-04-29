# ButterSus .dotfiles

This repository contains configuration files and scripts for my amazing unixporn linux setup

## Important Notes

Make sure to run `sudo pacman -Syu` just in case. My script doesn't do that for security reasons, you know

## Installation

There is a pure minimum needed for any CLI environment

1. Clone this repository:
   ```bash
   git clone https://github.com/ButterSus/.dotfiles.git
   cd .dotfiles
   ```

2. Install essential packages:
   ```bash
   bash scripts/arch-cli-setup.sh
   ```

3. Set up development environment:
   ```bash
   bash scripts/dev-setup.sh
   ```
   This will guide you through setting up your development environment with interactive prompts for each component:
   - NeoVim with all the good stuff (tree-sitter, ripgrep, etc.)
   - C++ development tools (GCC, Clang, CMake, etc.)
   - Rust development environment
   - JavaScript/TypeScript tools
   - Docker and container tools
   - Python development environment
   - ZShell with Starship and Zellij
   - Yazi file manager

## Directory Structure
- `scripts/` - Installation and management scripts
  - `arch-cli-setup.sh` - Basic Arch Linux CLI setup
  - `dev-setup.sh` - Modular development environment setup
- `packages/` - Configurations managed by GNU Stow
  - `dev/` - Development environment configs (git, nvim, etc.)

I'll extend this list and file later