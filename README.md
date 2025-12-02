# macOS Bash Setup

> A minimal script to set up modern Bash on macOS

## What it does

- Installs the latest Bash using Homebrew
- Installs `pkg-config` (required for some build tools)
- Optionally installs `mysql-client` (prompts during setup)
- Sets Homebrew Bash as your default shell
- Creates symlinks for `.bashrc` and `.bash_profile`

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/huangsen365/macos-bash-setup.git
   cd macos-bash-setup
   ```

2. Run the setup script:
   ```bash
   bash install.sh
   ```

   > **Note:** Use `bash` (not `sh`) to run the script for proper colored output.

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

Your `.bashrc` also automatically adds `/opt/homebrew/bin` and `/usr/local/bin`
to `PATH` if they exist. This guarantees that `brew` and packages installed by
Homebrew are found regardless of architecture.

## Requirements

- macOS
- [Homebrew](https://brew.sh/)

## Optional dependencies

The install script automatically installs `pkg-config` and offers to install
`mysql-client` during setup. If you need to install them manually:

```bash
brew install pkg-config
brew install mysql-client
```

The `.bashrc` includes helper configurations for MySQL client (PATH, LDFLAGS,
CPPFLAGS, PKG_CONFIG_PATH) that are automatically set when `mysql-client` is
installed via Homebrew.

## License

MIT
