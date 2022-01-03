# Neovim Configs

## Requirements

- [Neovim](https://neovim.io/) version 0.6 or later
- Depending on the language servers you want, potentially `yarn`/`npm`, `gem`, and your OS package manager.

## Installing Everything

1. Clone the repo
2. Copy everything from this directory to your Neovim configs location
3. Install plugins: `nvim +PackerInstall`

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
