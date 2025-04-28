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
   bash scripts/nvim-setup.sh
   ```

## Directory Structure
- `scripts/` - Installation and management scripts
  - `arch-cli-setup.sh` - Basic Arch Linux CLI setup
  - `nvim-setup.sh` - NeoVim and development tools setup
- `packages/` - Configurations managed by GNU Stow
  - `dev/` - Development environment configs (git, nvim, etc.)

I'll extend this list and file later