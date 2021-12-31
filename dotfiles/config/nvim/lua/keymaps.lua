-- ------------------------------------
-- | Remaps
-- ------------------------------------

-- Allow gf to create new files if it doesn't exits
keymap('n', 'gf', ':edit <cfile><cr>', {})

-- Reselect visual selection after indenting
keymap('v', '<', '<gv', noremap)
keymap('v', '>', '>gv', noremap)

-- Maintain cursor position when yanking visual selection
keymap('v', 'y', 'myy`y', noremap)
keymap('v', 'Y', 'myY`y', noremap)

-- Make Y behave like other capital letters
keymap('n', 'Y', 'y$', noremap)

-- Quickly insert things ot the end of the line
keymap('i', ';;', '<Esc>A;<Esc>', {})
keymap('i', ',,', '<Esc>A,<Esc>', {})

-- ------------------------------------
-- | Ctrl Binds
-- ------------------------------------

-- Split navigation
keymap('', '<C-h>', '<Esc><C-W>h', noremap)
keymap('', '<C-j>', '<Esc><C-W>j', noremap)
keymap('', '<C-k>', '<Esc><C-W>k', noremap)
keymap('', '<C-l>', '<Esc><C-W>l', noremap)

-- Tab navigation
keymap('', '<C-o>', '<Esc>:tabnext<cr>', noremap)
keymap('', '<C-i>', '<Esc>:tabprevious<cr>', noremap)

-- Closing and quitting
keymap('', '<C-x>', '<Esc>:bd<cr>', silent)
keymap('', '<C-w>', '<Esc>:tabclose<cr>', silent)
keymap('', '<C-q>', '<Esc>:q<cr>', silent)

-- Clear all buffers
keymap('', '<C-c>', '<Esc>:bufdo! bdelete<cr>', noremap_silent)

-- Clear highlighted search text
keymap('n', '<C-u>', ':nohlsearch<cr>', silent)
keymap('i', '<C-u>', '<Esc>:nohlsearch<cr>i', silent)

-- ------------------------------------
-- | Leader Maps
-- ------------------------------------

-- Set <Space> as leader
keymap('', '<Space>', '<Nop>', noremap_silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Numbers are for tab navigation
keymap('n', '<leader>1', ':tabnext 1<cr>', silent)
keymap('n', '<leader>2', ':tabnext 2<cr>', silent)
keymap('n', '<leader>3', ':tabnext 3<cr>', silent)
keymap('n', '<leader>4', ':tabnext 4<cr>', silent)
keymap('n', '<leader>5', ':tabnext 5<cr>', silent)
keymap('n', '<leader>6', ':tabnext 6<cr>', silent)
keymap('n', '<leader>7', ':tabnext 7<cr>', silent)
keymap('n', '<leader>8', ':tabnext 8<cr>', silent)
keymap('n', '<leader>9', ':tabnext 9<cr>', silent)

-- v namespace: tools for vim itself
keymap('n', '<leader>ve', ':tabedit ~/.config/nvim/init.lua<cr>', noremap)
keymap('n', '<leader>vs', ':source ~/.config/nvim/init.lua<cr>', noremap)

