# Neovim Configs

## Requirements

- [Neovim](https://neovim.io/) version 0.6 or later
- Depending on the language servers you want, potentially `yarn`/`npm`, `pip` (for python3), ruby `gem`, and your OS package manager (ex: `brew`/`apt-get`/`pacman + AUR helpers`/etc). I personally have them available for global use so I can use the helpers anywhere.
- Language Server (see the [neovim lsp docs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for the server you want)

Here's the "I want everything" commands to run for language server requirements:

```
yarn global add \
  neovim @ansible/ansible-language-server bash-language-server \
  vscode-langservers-extracted cssmodules-language-server \
  diagnostic-languageserver dockerfile-language-server-nodejs \
  sql-language-server stylelint-lsp @tailwindcss/language-server \
  typescript typescript-language-server vim-language-server @volar/server vls \
  yaml-language-server remark-language-server

gem install rubocop solargraph typeprof
pip install --user ansible ansible-lint yamllint
```



## Installing Everything

1. Clone the repo
2. Copy everything from this directory to your Neovim configs location
3. Install requirements (see above)
4. Install plugins: `nvim +PackerInstall`.

IMPORTANT NOTE: For now, the install cycle will be continuously be:
1. Load the config
2. See a bunch of errors
3. Run the packer install
4. Repeat until you stop seeing errors

## Background

These configs have the following features:
- Written in Lua
- Leader set to space
- Leader keymaps are namespaced
- Plugin management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- Fuzzy Finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)

## TODOs

- Rework configs to be able to be installed from nothing
- Add pics/gifs to README
- Add customized keymaps to README

- LSPs
  - Make sure there's a SASS LSP (cssls might be able to)
  - Look into fixers
  - Install one for Lua
  - Add Zeta Note LSP?
  - Hide error messages and just display red X in gutter
