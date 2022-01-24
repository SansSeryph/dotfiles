# OS Setup

TODO: Add stuff here

# Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Install Applications

```
brew tap homebrew/cask-fonts
brew tap quick-lint/quick-lint-js https://github.com/quick-lint/quick-lint-js.git

brew install gh tldr quick-lint-js fd ripgrep tree neovim exa bat tmux fish \
             htop ctags font-Fira-Code-nerd-font openssl readline btop \
             syncthing git
brew install --cask spotify kitty keepassxc authy
```
