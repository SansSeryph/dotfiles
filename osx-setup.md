# OSX Setup

TODO: Add stuff here

## Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "# Set PATH, MANPATH, etc., for Homebrew." >> ~/.zprofile
echo "eval \"$(/opt/homebrew/bin/brew shellenv)\""
```

## Install Applications

```
brew tap homebrew/cask-fonts
brew tap quick-lint/quick-lint-js https://github.com/quick-lint/quick-lint-js.git

brew install gh tldr quick-lint-js fd ripgrep tree neovim exa bat tmux fish \
             ctags openssl readline btop git dotdrop asdf lua-language-server
brew install --cask kitty font-fira-code obsidian
```

## Configure Everything

```
mkdir -p ~/Workspace
cd ~/Workspace
git clone https://github.com/SansSeryph/dotfiles
cd dotfiles
dotdrop install --force -p osx

echo "\n# Set PATH, MANPATH, etc., for Homebrew." >> ~/.config/fish/config.fish
echo "eval /opt/homebrew/bin/brew shellenv" >> ~/.config/fish/config.fish

echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/catppuccin/fish
```

## Install Programming Tools

### Tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Node

```
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
asdf reshim nodejs latest
```

### Ruby

```
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest
asdf reshim ruby latest
gem ctags
```

### Python

```
asdf plugin add python
asdf install python latest
asdf global python latest
asdf reshim python latest
```

### Perl

```
asdf plugin add perl
asdf install perl latest

cpanm -n Neovim::Ext
cpanm -n App::cpanminus

asdf reshim perl latest
```
