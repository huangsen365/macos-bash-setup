#!/bin/bash

# Color definitions
RESET="\033[0m"
GREEN="\033[32m"
BLUE="\033[34m"
YELLOW="\033[33m"
RED="\033[31m"

# Functions for colored output
success() { echo -e "${GREEN}✓ $1${RESET}"; }
info() { echo -e "${BLUE}ℹ $1${RESET}"; }
warn() { echo -e "${YELLOW}⚠ $1${RESET}"; }
error() { echo -e "${RED}✗ $1${RESET}"; }

echo -e "${BLUE}==== macOS Bash Setup ====${RESET}"

# Find Homebrew
BREW_CMD=$(command -v brew || echo "")
if [ -z "$BREW_CMD" ]; then
  if [ -x "/opt/homebrew/bin/brew" ]; then
    BREW_CMD="/opt/homebrew/bin/brew"
  elif [ -x "/usr/local/bin/brew" ]; then
    BREW_CMD="/usr/local/bin/brew"
  else
    error "Homebrew not found. Please install Homebrew first."
    error "Visit https://brew.sh to install Homebrew."
    exit 1
  fi
fi

success "Using Homebrew at: $BREW_CMD"
eval "$($BREW_CMD shellenv)"

# Get Homebrew bash path first (needed for checks)
HOMEBREW_BASH_PATH=$($BREW_CMD --prefix)/bin/bash

# Check if any sudo operations will be needed and cache credentials upfront
current_shell=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$current_shell" != "$HOMEBREW_BASH_PATH" ]] || ! grep -q "$HOMEBREW_BASH_PATH" /etc/shells; then
  info "Administrator privileges will be required for shell setup"
  sudo -v
  # Keep sudo credentials fresh for the duration of the script
  (while true; do sudo -n true; sleep 50; kill -0 "$$" || exit; done 2>/dev/null &)
fi

# Install Bash if needed
if ! $BREW_CMD list bash &>/dev/null; then
  info "Installing Bash via Homebrew..."
  $BREW_CMD install bash
  success "Bash installed successfully!"
else
  success "Homebrew Bash is already installed"
fi

# Add to /etc/shells if needed
if ! grep -q "$HOMEBREW_BASH_PATH" /etc/shells; then
  info "Adding Homebrew's Bash to /etc/shells..."
  sudo sh -c "echo $HOMEBREW_BASH_PATH >> /etc/shells"
  success "Added to /etc/shells"
else
  success "Homebrew's Bash already in /etc/shells"
fi

# Set as default shell if needed
if [[ "$current_shell" != "$HOMEBREW_BASH_PATH" ]]; then
  info "Setting Homebrew's Bash as default shell..."
  sudo chsh -s "$HOMEBREW_BASH_PATH" $USER
  success "Default shell changed"
else
  success "Homebrew's Bash already set as default shell"
fi

# Get the current script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setup config files using relative paths
if [ -f "$SCRIPT_DIR/.bashrc" ]; then
  if [ ! -L ~/.bashrc ]; then
    info "Creating symbolic link for .bashrc..."
    ln -sf "$SCRIPT_DIR/.bashrc" ~/.bashrc
    success ".bashrc linked"
  else
    success ".bashrc already linked"
  fi
else
  warn ".bashrc not found in script directory"
fi

if [ -f "$SCRIPT_DIR/.bash_profile" ]; then
  if [ ! -L ~/.bash_profile ]; then
    info "Creating symbolic link for .bash_profile..."
    ln -sf "$SCRIPT_DIR/.bash_profile" ~/.bash_profile
    success ".bash_profile linked"
  else
    success ".bash_profile already linked"
  fi
else
  warn ".bash_profile not found in script directory"
fi

echo ""
success "Setup complete! Restart your terminal or run:"
info "exec $HOMEBREW_BASH_PATH -l"
