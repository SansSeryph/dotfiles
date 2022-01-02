# Dotfiles

This repo comes with a handy tool called [dotdrop](https://github.com/deadc0de6/dotdrop).
It helps to manage various dotfiles and install them as well.

Here are some handy commands to help get started:
- Adding files/directories to the repo to be symlinked when installing:
  `./dotdrop.sh import --link=link <file>`
- Comparing files in the repo with what's set up in `~` already: `./dotdrop.sh
  compare [--profile=<profile_name>]`
- Installing files (see `config.yaml` for profiles - you may need to create
  one): `./dotdrop.sh install [--profile=<profile_name>]`

Additionally, this repo also stores `*_setup` files for quickly getting devices
going. They start as `.md` files containing instructions but the goal is to
(slowly) migrate them over to fully automated scripts.

# Features

- Development environment with Kitty, Fish, and Neovim. Each language is managed by [asdf](https://asdf-vm.com/)
- Package management with [pikaur](https://github.com/actionless/pikaur)
- [Catppuccin Theme](https://github.com/catppuccin) for TMux, Neovim, Fish, Kitty, and even DuckDuckGo!

# TODOs

- Add some screenshots and gifs of what the setup looks like
- Generate and update ctags for repos
