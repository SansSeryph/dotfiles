# Install Steps

Steps to take after a fresh Manjaro Gnome install.

## Add/Remove Software App

### General Tab

TODO: Remove update notification tray icon
TODO: Add configs to dotfiles

1. Update all packages
1. Install applications: `pikaur`

## Settings App

TODO: Find the config files
TODO: Add config files to dotfiles

## Manjaro Settings Manager App

TODO: Can this be automated?

Under `Hardware Configuration`:
1. Click `Auto Install Open-Source Driver`
1. Click `Auto Install Proprietary Driver`

## Applications

### Install Pikaur

```
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ..
rm -rf pikaur
```

### Install Applications

```
pikaur --remove --recursive --noconfirm firefox-theme-gnome-maia
pikaur --sync --needed --noconfirm tldr libreoffice-still authy exa bat neovim \
	libappindicator-gtk3 signal-desktop steam-manjaro keybase keybase-gui tmux   \
	keepassxc betterdiscord-installer betterdiscordctl discord fish kitty htop   \
	neovim-qt ripgrep ttf-fira-code spotify quick-lint-js fd fontforge
```

## Dotfiles

```
mkdir ~/Workspace
git clone https://github.com/SansSeryph/dotfiles
cd dotfiles
./dotdrop.sh install
```

TODO: In `~/.default-npm-packages`, add eslint and other related eslint plugins
TODO: For Perl, might need to specially configure the global version in ~/.tool-versions
TODO: Find and add Gnome configs

## Development Environment Setup

```
pikaur --sync --needed --noconfirm asdf-vm bash-completion unzip

chsh --shell /usr/bin/fish $(whoami)
fish

set --erase EDITOR
set --universal --export EDITOR (which nvim)

set --erase VISUAL
set --universal --export VISUAL (which nvim)

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/catppuccin/fish
```

Patch Fira to have the full nerd fonts icons. I'm going this route instead of
installing the patched font directly because it doesn't come with font features
needed for kitty to display certain characters.

```
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/Workspace/nerd-fonts

mkdir -p ~/.local/share/fonts
chmod 755 ~/.local/share/fonts/

fontforge -script ~/Workspace/nerd-fonts/font-patcher --complete --careful \
  --progress-bar /usr/share/fonts/TTF/FiraCode-Regular.ttf
chmod 444 Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf
mv Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf ~/.local/share/fonts/

fc-cache
```

## Tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Node

```
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

npm install -g yarn
yarn global add neovim ansible-language-server bash-language-server \
	vscode-langservers-extracted cssmodules-language-server \
  diagnostic-languageserver dockerfile-language-server-nodejs \
  sql-language-server stylelint-lsp @tailwindcss/language-server \
  typescript typescript-language-server vim-language-server @volar/server vls \
  yaml-language-server
  

asdf reshim nodejs latest
```

### Ruby

```
pikaur --sync --needed --noconfirm base-devel libffi libyaml openssl zlib
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest
asdf reshim ruby latest
```

### Python

```
asdf plugin add python https://github.com/danhper/asdf-python
asdf install python latest
adsf global python latest

pip install --user ansible ansible-lint yamllint

asdf reshim python latest
```

### Perl

```
asdf plugin add perl https://github.com/ouest/asdf-perl
asdf install perl latest

cpanm -n Neovim::Ext
cpanm -n App::cpanminus

asdf reshim perl latest
```

## Discord

TODO: Install Better Discord

# Gnome

Get some wallpapers

```
git clone https://github.com/catppuccin/wallpapers Pictures/Wallpapers/catppuccin
```

TODO: Find a way to load `~/Documents/dynamic_wallpapers.xml` into Dynamic Wallpaper Editor from 
CLI

## Final Steps

- Log into accounts:
	- Authy
	- Firefox
	- Discord
	- Keybase
	- Steam
	- Signal
	- Keybase
- Make sure keybase auto-starts on OS start
- Create an SSH key 
- Set the DuckDuckGo Theme to be Catppuccin:
  1. Visit https://duckduckgo.com/settings
  2. Go to Cloud Save > Load Settings.
  3. Enter `catppuccin-ddg` as passphrase.
  4. Click on `Load` button.

# TODOs

## Configure
- Kitty
	- Go through config file
	- Check out [kittens](https://sw.kovidgoyal.net/kitty/kittens/custom/?highlight=split%20line#)
- Fish
	- Prompt
	- Set `fish_greeting` to show a cool logo + welcome message a la jessarcher's setup
  - Oh My Fish: https://github.com/oh-my-fish/oh-my-fish
- Tmux
	- TPM
	- Plugins
	- Theme
- Gnome
	- Wallpapers
	- Icons
	- Fonts
	- Windows/UI
