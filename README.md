# Dev-Tools

This repository contains a Nushell script `dev-tools.nu` for managing Android devices using adb commands.


<img width="1012" alt="image" src="https://github.com/EsmaeelNabil/dev-tools/assets/28542963/a2063162-22d9-41cc-93ae-49d6ac3d689a">
<img width="1019" alt="image" src="https://github.com/EsmaeelNabil/dev-tools/assets/28542963/5094456c-5c57-4103-a428-500e11885fcc">

## Prerequisites

- [Nushell](https://www.nushell.sh/)
- [Android Debug Bridge (adb)](https://developer.android.com/studio/command-line/adb)
- [fzf](https://github.com/junegunn/fzf) for fuzzy search
- [gum](https://github.com/Byron/gum) for spinners

```
# Install Homebrew if you haven't already
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Nushell using Homebrew
brew install nushell

# Install fzf using Homebrew
brew install fzf

# Install gum using cargo (Rust's package manager)
# First, install Rust if you haven't already
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Then, install gum
cargo install gum
```

## Usage

1. Clone this repository:

```bash
git clone https://github.com/yourusername/dev-tools.git
cd dev-tools

./dev-tools.nu
```
