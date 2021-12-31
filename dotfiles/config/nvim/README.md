# Neovim Configs

## Requirements

- [Neovim](https://neovim.io/) version 0.6 or later

## Background

These configs have the following features:
- Written in Lua
- Leader keymaps are namespaced
- Plugin management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- Fuzzy Finding with Telescope
- Leader key set up to <Space>

## TODOs

- Add pics/gifs to README
- Add customized keymaps to README
- Use ctrl and j/k to navigate completion options instead of n/p

- LSPs
  - Make sure there's a SASS LSP (cssls might be able to)
  - Look into fixers
  - Install one for Lua
  - Add Zeta Note LSP?

- Markdown features that I'd like:
  - Formats/Prettifies on save
    - Automatically update list numbering
    - Backtick formatting: Update syntax colorscheme based on language
  - Preview or even WYSIWYG would be nice (like Notion or Jira)
  - Obsidian-like features
    - Wiki-style linking
    - Fold headings/sub-lists/blocks/etc
    - `ctrl+enter` keymap
      - Turns line into a list item if it doesn't start with `-`
      - Turns list item into empty checkbox
      - Toggles checkboxes
      - On links (Wiki or URL), open whatever is under cursor
