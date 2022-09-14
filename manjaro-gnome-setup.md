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
	neovim-qt ripgrep ttf-fira-code spotify quick-lint-js-git fd tree  \
	github-cli ctags syncthing
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
set --erase VISUAL

set --universal --export EDITOR (which nvim)
set --universal --export VISUAL (which nvim)
set --universal --export PAGER "nvim -R"
set --universal --export MANPAGER "nvim +Man!"
set --universal --export WAYLAND_DISPLAY wayland-0

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/catppuccin/fish
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
asdf reshim nodejs latest
```

### Ruby

```
pikaur --sync --needed --noconfirm base-devel libffi libyaml openssl zlib
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest
asdf reshim ruby latest
gem ctags
```

### Python

```
asdf plugin add python https://github.com/danhper/asdf-python
asdf install python latest
asdf global python latest

pip install --ugprade pip
pip install --user ansible ansible-lint yamllint docopt requests

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

### Lua

mkdir -p ~/Workspace/builds/
cd ~/Workspace/builds/
pikaur --sync --needed --noconfirm ninja
git clone  --depth=1 https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --depth 1 --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
ln -sf ./bin/lua-language-server ~/.local/bin/

## Discord

TODO: Install Better Discord

# Gnome

## Syncthing

systemctl enable --user syncthing

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
- Set up Syncthing
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
