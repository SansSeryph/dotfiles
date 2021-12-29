# Neovim Configs

## Requirements

- [Neovim](https://neovim.io/) version 0.6 or later

## Background

These configs have the following features:
- Written in Lua
- Leader keymaps are namespaced
- TODOs sprinkled around in `init.lua`
- Plugin management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- Fuzzy Finding with Telescope
- Leader key set up to <Space>

## TODOs

- Complete TODO's in `init.lua`
- Replace augroup defs with nvim api calls when they become available
- Figure out how to set `g:clipboard` (can't just put `"unamedplus"` there)
- Something with 80 chars per line
- Move each plugin set to live in their own file
- Add pics/gifs to README
- Add customized keymaps to README

- Read these help files:
  - shada
  - autoformat

- Treesitter
  - See if there are any handy tools I can use with this plugin
  - Read nvim-tree-docs

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
