local M = {}

function M.configure(keymap)
  -- ############################################################################
  -- # Helpers
  -- ############################################################################

  local noremap = { noremap = true }
  local silent = { silent = true }
  local noremap_silent = { noremap = true, silent = true }

  -- ############################################################################
  -- # Remaps
  -- ############################################################################

  -- Maintain cursor position when yanking visual selection
  keymap('v', 'y', 'myy`y', noremap)
  keymap('v', 'Y', 'myY`y', noremap)

  -- Make Y behave like other capital letters
  keymap('n', 'Y', 'y$', noremap)

  -- Quickly insert things ot the end of the line
  keymap('i', ';;', '<Esc>A;<Esc>', {})
  keymap('i', ',,', '<Esc>A,<Esc>', {})

  -- ############################################################################
  -- # Ctrl Binds
  -- ############################################################################

  -- Split navigation
  keymap('', '<C-h>', '<Esc><C-W>h', noremap)
  keymap('', '<C-j>', '<Esc><C-W>j', noremap)
  keymap('', '<C-k>', '<Esc><C-W>k', noremap)
  keymap('', '<C-l>', '<Esc><C-W>l', noremap)

  -- Tab navigation
  keymap('', '<C-o>', '<Cmd>tabnext<CR>', noremap)
  keymap('', '<C-i>', '<Cmd>tabprevious<CR>', noremap)

  -- Clear highlighted search text
  keymap('n', '<C-u>', '<Cmd>nohlsearch<CR>', silent)

  -- Buffer/Window Management
  keymap('', '<C-x>', '<Cmd>bdelete<CR>', silent)
  keymap('', '<C-c>', '<Cmd>close<CR>', silent)

  -- ############################################################################
  -- # Leader Maps
  -- ############################################################################

  -- Set <Space> as leader
  keymap('', '<Space>', '<Nop>', noremap_silent)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Numbers are for tab navigation
  keymap('n', '<leader>1', '<Cmd>tabnext 1<CR>', silent)
  keymap('n', '<leader>2', '<Cmd>tabnext 2<CR>', silent)
  keymap('n', '<leader>3', '<Cmd>tabnext 3<CR>', silent)
  keymap('n', '<leader>4', '<Cmd>tabnext 4<CR>', silent)
  keymap('n', '<leader>5', '<Cmd>tabnext 5<CR>', silent)
  keymap('n', '<leader>6', '<Cmd>tabnext 6<CR>', silent)
  keymap('n', '<leader>7', '<Cmd>tabnext 7<CR>', silent)
  keymap('n', '<leader>8', '<Cmd>tabnext 8<CR>', silent)
  keymap('n', '<leader>9', '<Cmd>tabnext 9<CR>', silent)

  -- v namespace: vim commands
  keymap('n', '<leader>ve', '<Cmd>tabedit ~/.config/nvim/init.lua<CR>', noremap)
  keymap('n', '<leader>vs', '<Cmd>source ~/.config/nvim/init.lua<CR>', noremap)
end

return M
