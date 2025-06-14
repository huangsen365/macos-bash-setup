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

3. Restart your terminal or run the following to launch the Homebrew Bash.
   This works on both Apple Silicon and Intel Macs:
   ```bash
exec "$(brew --prefix)"/bin/bash -l
```

## Cross-platform notes

Homebrew installs packages under different prefixes depending on your Mac's
architecture (`/opt/homebrew` for Apple Silicon and `/usr/local` for Intel).
All scripts in this repo use `#!/usr/bin/env bash` and rely on `brew --prefix`
so the same commands work on both types of machines.

## Requirements

- macOS
- [Homebrew](https://brew.sh/)

## Optional dependencies

If you use the MySQL settings included in `.bashrc`, you may also want to
install the following packages:

```bash
brew install pkg-config
brew install mysql
```

## License

MIT
