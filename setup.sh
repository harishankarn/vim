#!/bin/bash

# Define the home directory and Vim configuration folder
VIM_DIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

# Function to prompt the user to install Vim
install_vim() {
  echo "Checking if Vim is installed..."
  if ! command -v vim &> /dev/null; then
    echo "Vim is not installed."
    if [[ "$(uname)" == "Darwin" ]]; then
      echo "Detected macOS."
      echo "Installing Vim using Homebrew..."
      if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew first."
        exit 1
      fi
      brew install vim
    elif [[ -f "/etc/debian_version" ]]; then
      echo "Detected Debian-based system."
      echo "Installing Vim using apt..."
      sudo apt update && sudo apt install vim -y
    else
      echo "Unsupported operating system. Please install Vim manually."
      exit 1
    fi
  else
    echo "Vim is already installed."
  fi
}

install_node(){
# Check if Node.js is installed for coc.nvim
  echo "Checking if Node.js is installed..."
  if ! command -v node &> /dev/null; then
    echo "Node.js is not installed."
    echo "To use coc.nvim, Node.js is required."
    if [[ "$(uname)" == "Darwin" ]]; then
      echo "For macOS, install Node.js using Homebrew:"
      echo "brew install node"
    elif [[ -f "/etc/debian_version" ]]; then
      echo "For Ubuntu/Debian-based systems, run:"
      echo "sudo apt update && sudo apt install nodejs npm -y"
    else
      echo "Please install Node.js manually for your operating system."
    fi
    exit 1
  else
    echo "Node.js is already installed."
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
install_vim
install_node
remove_existing_config
setup_vim
install_plugins

echo "Setup complete!"
