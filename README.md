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


# TODOs

## Neovim

- Replace augroup defs with nvim api calls when they become available
- Figure out how to set `g:clipboard`
- Complete the TODO's in the rest of the file
- Complete the TODO's in other required nvim files
- Plugins / Features
	- Markdown helpers
		- Formats/prettifies
		- Preview or even WYSIWYG would be nice (like Notion or Jira)
		- Obsidian-like features
			- `ctrl+enter`
        - Turns line into a list item
        - Turns list item into checkbox
        - Toggles checkbox
        - On links (Wiki or URL), open whatever is under cursor
			- Automatically update list numbering
			- Backtick formatting
        - Update syntax colorscheme based on language
			- Wiki-style linking
			- Fold headings/sub-lists/blocks/etc
- Investigate these things:
  - shada
  - autoformat
