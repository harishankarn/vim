#!/bin/bash

# Define the home directory and Vim configuration folder
VIM_DIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

# Function to prompt the user to install Vim
check_vim_installed() {
  echo "Checking if Vim is installed..."
  if ! command -v vim &> /dev/null; then
    echo "Vim is not installed."
    echo "For Ubuntu/Debian-based systems, run:"
    echo "---------------------------"
    echo "sudo apt update && sudo apt install vim -y"
    echo "For macOS, run:"
    echo "sudo brew install vim"
    echo "Script cannot proceed without Vim. Exiting."
    exit 1
  else
    echo "Vim is already installed."
  fi
}

# Function to remove existing .vim and .vimrc
remove_existing_config() {
  echo "Removing existing .vim and .vimrc..."
  rm -rf "$VIM_DIR"
  rm -f "$VIMRC"
}

# Function to setup .vim and .vimrc
setup_vim() {
  echo "Setting up .vim and .vimrc..."
  SCRIPT_DIR=$(dirname "$(realpath "$0")")
  cp "$SCRIPT_DIR/.vimrc" "$HOME/"
  cp -r "$SCRIPT_DIR/.vim" "$HOME/"
}


# Function to install Vim plugins using vim-plug
install_plugins() {
  echo "Installing Vim plugins..."
  vim -c "cd ~" +PlugInstall +qall
}

# Start setup
check_vim_installed
remove_existing_config
setup_vim
install_plugins

echo "Setup complete!"

