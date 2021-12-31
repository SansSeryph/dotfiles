# Neovim Configs

## Requirements

- [Neovim](https://neovim.io/) version 0.6 or later
- Depending on the language servers you want, potentially `yarn`/`npm`, `gem`, and your OS package manager.

## Background

These configs have the following features:
- Written in Lua
- Leader keymaps are namespaced
- Plugin management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- Fuzzy Finding with Telescope
- Leader key set up to <Space>

## TODOs

- Add pics/gifs to README
- Add install instructions
- Add customized keymaps to README

- Completions
  - Use ctrl and j/k to navigate completion options instead of n/p

- LSPs
  - Make sure there's a SASS LSP (cssls might be able to)
  - Look into fixers
  - Install one for Lua
  - Add Zeta Note LSP?
  - Hide error messages and just display red X in gutter
