# macOS Bash Setup

> A minimal script to set up modern Bash on macOS

## What it does

- Installs the latest Bash using Homebrew
- Sets Homebrew Bash as your default shell
- Creates symlinks for `.bashrc` and `.bash_profile`

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/huangsen365/macos-bash-setup.git
   cd macos-bash-setup
   ```

2. Run the setup script:
   ```
   sh install.sh
   ```

3. Restart your terminal or run:
   ```
   exec /opt/homebrew/bin/bash -l
   ```

## Requirements

- macOS
- [Homebrew](https://brew.sh/)

## License

MIT
